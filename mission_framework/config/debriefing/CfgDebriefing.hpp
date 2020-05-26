// These mission endings are currently hardcoded, do not remove these

/* ----------------------------DEFAULT ENDINGS----------------------------- */
/* ------------------- CUSTOMISABLE BUT DO NOT REMOVE---------------------- */

class MissionSuccess {
    title = "Mission Success";        // Closing shot - Main title
    subtitle = "default_text";        // Closing shot - Short description
    description = "default_text";     // Debriefing - Summary of the mission
    pictureBackground = "";           // Debriefing - 2:1 picture as background
    picture = "mil_end";              // Closing shot - 1:1 icon in the middle of the screen
    pictureColor[] = {0, 0.8, 0, 1};  // Closing shot - Icon colour
};

class MissionFail {
    title = "Mission Failed";
    subtitle = "default_text";
    description = "default_text";
    pictureBackground = "";
    picture = "KIA";
    pictureColor[] = {0.6, 0.1, 0.2, 1};
};

class TimeLimit {
    title = "Mission Failed";
    subtitle = "Time limit reached";
    description = "You've run out of time. Better luck next time.";
    pictureBackground = "";
    picture = "KIA";
    pictureColor[] = {0.6, 0.1, 0.2, 1};
};

class CasualtyLimit {
    title = "Mission Failed";
    subtitle = "You've suffered serious casualties";
    description = "Your unit suffered serious casualties. Better luck next time.";
    pictureBackground = "";
    picture = "KIA";
    pictureColor[] = {0.6, 0.1, 0.2, 1};
};

class CivCasualtyLimit {
    title = "Mission Failed";
    subtitle = "Civilian casualty limit reached";
    description = "The number of civilian casualties was too high. Watch your fire next time.";
    pictureBackground = "";
    picture = "KIA";
    pictureColor[] = {0.6, 0.1, 0.2, 1};
};

class MissionTerminated {
    title = "Mission Terminated";
    subtitle = "The mission was terminated by admin";
    description = "Due to technical reasons the mission was terminated.";
    pictureBackground = "";
    picture = "mil_warning";
    pictureColor[] = {0.9, 0, 0, 1};
};

class WithdrawalWin {
    title = "Minor Success";
    subtitle = "Tactical withdrawal was called by the CO";
    description = "The CO called tactical withdrawal ending the mission earlier. Consider this a minor success.";
    pictureBackground = "";
    picture = "mil_flag";
    pictureColor[] = {0, 0.8, 0, 1};
};

class WithdrawalLose {
    title = "Minor Defeat";
    subtitle = "Tactical withdrawal was called by the CO";
    description = "The CO called tactical withdrawal ending the mission earlier. Consider this a minor defeat.";
    pictureBackground = "";
    picture = "mil_flag";
    pictureColor[] = {0.9, 0, 0, 1};
};

/* ------------------------CUSTOM ENDINGS BELOW------------------------ */
