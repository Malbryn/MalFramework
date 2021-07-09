#include "script_component.hpp"

// Terminate the end condition checking loop if there's no condition defined
if !(GVARMAIN(moduleTimeLimit) || GVARMAIN(modulePlayerCasualties) || GVARMAIN(moduleTaskLimit) ||
GVARMAIN(moduleExtraction) || GVARMAIN(moduleCivilianCasualties)) exitWith {};

[QGVARMAIN(initFramework), {
    // Register the civilians
    call FUNC(registerCivilians);

    // Check the tasks array
    if ((GVARMAIN(moduleTaskLimit) && (count GVAR(tasks) == 0)) ||
    (GVARMAIN(moduleExtraction) && (count GVAR(tasks) == 0))) then {
        [COMPONENT_STR, "WARNING", "No task was registered, the end condition check won't work properly", true, 0] call EFUNC(main,log);
        GVARMAIN(moduleTaskLimit) = false;
        GVARMAIN(moduleExtraction) = false;
        GVARMAIN(moduleTimeLimit) = false;
    };

    // Add per frame handler
    // Adding some delay so the side values are set properly
    [{
        if (GVARMAIN(isTvT)) then {
            GVAR(endConditionCheck) = [{
                call FUNC(checkEndConditionsTvT);
            }, 3] call CFUNC(addPerFrameHandler);
        } else {
            GVAR(endConditionCheck) = [{
                call FUNC(checkEndConditionsCoop);
            }, 10] call CFUNC(addPerFrameHandler);
        };
    }, [], 5] call CFUNC(waitAndExecute);

    // Time limit notification
    if (GVAR(notificationTime) != -1) then {
        [{(GVAR(timeLimit) - floor (CBA_missionTime)) == GVAR(notificationTime)}, {
            private _timeLimitMinutes = floor (GVAR(notificationTime) / 60);
            [QGVARMAIN(notification_2), ["TimeLimitNotification", _timeLimitMinutes]] call CFUNC(globalEvent);
        }] call CFUNC(waitUntilAndExecute);
    };

    // Check the staging area
    if (GVAR(stagingEnabled) && !GVARMAIN(isTvT)) then {
        [COMPONENT_STR, "DEBUG", "Staging is enabled, delaying mission time limit...", true, 2] call EFUNC(main,log);
        GVAR(timeLimitOriginal) = GVAR(timeLimit);

        GVAR(checkStaging) = [{
            call FUNC(checkStagingArea);
        }, 1] call CFUNC(addPerFrameHandler);
    };
}] call CFUNC(addEventHandler);
