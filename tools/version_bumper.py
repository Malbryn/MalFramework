# Based on Arma 3 make.py
# https://github.com/acemod/arma-project-template/blob/master/tools/make.py

__version__ = "0.1"

import re
import subprocess
import sys
import os

# Check Python version
if sys.version_info[0] != 3:
    print("Python 3 is required.")
    sys.exit(1)

# Globals
push_commit = False
framework_version = "0.0.0.0"


def bump_version(version_increments=[]):
    if not version_increments:
        print("No increment was given. Please provide one of the following:")
        print("'increment_major', 'increment_minor', 'increment_patch', 'increment_build'")
        sys.exit(1)

    global framework_version
    version_stamp = framework_version

    try:
        from pathlib import Path

        script_path = Path(__file__).parents[1]
        script_version_path = os.path.join(script_path, "mission_framework/core/main/script_version.hpp")

        if os.path.isfile(script_version_path):
            file = open(script_version_path, "r")
            hpp_text = file.read()
            file.close()

            if hpp_text:
                major_text = re.search(r"#define MAJOR (.*\b)", hpp_text).group(1)
                minor_text = re.search(r"#define MINOR (.*\b)", hpp_text).group(1)
                patch_text = re.search(r"#define PATCH (.*\b)", hpp_text).group(1)
                build_text = re.search(r"#define BUILD (.*\b)", hpp_text).group(1)

            print("Current version: {}.{}.{}.{}".format(major_text, minor_text, patch_text, build_text))

            if version_increments:
                if "major" in version_increments:
                    major_text = int(major_text) + 1
                    minor_text = 0
                    patch_text = 0
                elif "minor" in version_increments:
                    minor_text = int(minor_text) + 1
                    patch_text = 0
                elif "patch" in version_increments:
                    patch_text = int(patch_text) + 1

                # Always increment build
                build_text = int(build_text) + 1

            version_stamp = "{}.{}.{}.{}".format(major_text, minor_text, patch_text, build_text)
            print("Incrementing version to {}".format(version_stamp))

            with open(script_version_path, "w", newline="\n") as file:
                file.writelines([
                    "#define MAJOR {}\n".format(major_text),
                    "#define MINOR {}\n".format(minor_text),
                    "#define PATCH {}\n".format(patch_text),
                    "#define BUILD {}\n".format(build_text)
                ])

        else:
            print("Version file is missing or cannot be accessed.")
            sys.exit(1)

    except Exception as e:
        print("Error in get_version(): {}".format(e))
        print("Check the integrity of the file: {}".format(script_version_path))
        print("Resetting to the default version stamp: {}".format(version_stamp))
        sys.exit(1)

    framework_version = version_stamp

    # Set environment variable
    subprocess.call("echo '::set-output name=VERSION::{}'".format(framework_version), shell=True)

    git_push()


def git_push():
    if not push_commit:
        print("Skipping pushing commit...")
        return

    print("Pushing to remote...")

    # Set up credentials
    subprocess.call(["git", "config", "--local", "user.name", "github-actions"])
    subprocess.call(["git", "config", "--local", "user.email", "actions@no-reply.github.com"])

    # Push commit
    commit_msg = "v" + ".".join(framework_version.split(".")[0:3]) + " Build " + framework_version.split(".")[3]

    subprocess.call(["git", "add", "-A"])
    subprocess.call(["git", "commit", "-m", commit_msg])
    subprocess.call(["git", "push", "origin", "master"])

    print("Pushed commit to master: {}".format(commit_msg))


def main(argv):
    print("This is version_bumper.py for MalFramework, based on the original make.py script by Ryan Schultz.")

    global push_commit
    global framework_version

    # Which part of the version should be incremented
    version_increments = []
    if "increment_build" in argv:
        argv.remove("increment_build")
        version_increments.append("build")
    if "increment_patch" in argv:
        argv.remove("increment_patch")
        version_increments.append("patch")
    if "increment_minor" in argv:
        argv.remove("increment_minor")
        version_increments.append("minor")
    if "increment_major" in argv:
        argv.remove("increment_major")
        version_increments.append("major")

    # Should push a commit to master
    if "push_commit" in argv:
        argv.remove("push_commit")
        push_commit = True

    bump_version(version_increments)


if __name__ == "__main__":
    main(sys.argv)

    print("Building successful.")
    sys.exit(0)
