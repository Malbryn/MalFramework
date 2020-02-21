// These mission endings are currently hardcoded, do not remove

/* ----------------------------DEFAULT ENDINGS----------------------------- */
/* ------------------- CUSTOMISABLE BUT DO NOT REMOVE---------------------- */

class MissionSuccess {
    title = "Mission Success";      // Closing shot - Main title
    subtitle = "";                    // Closing shot - Short description
    description = "";                 // Debriefing - Summary of the mission
    pictureBackground = "";           // Debriefing - 2:1 picture as background
    picture = "mil_end";              // Closing shot - 1:1 icon in the middle of the screen
    pictureColor[] = {0, 0.8, 0, 1};  // Closing shot - Icon colour
};

class MissionFail {
    title = "Mission Failed";
    subtitle = "";
    description = "";
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

class MissionTerminated {
    title = "Mission Terminated";
    subtitle = "The mission was terminated by admin";
    description = "Due to technical reasons the mission was terminated";
    pictureBackground = "";
    picture = "mil_warning";
    pictureColor[] = {0.9, 0, 0, 1};
};

class Retreat {
    title = "Retreat";
    subtitle = "Retreat was called by the CO";
    description = "The CO called retreat ending the mission earlier. Consider this a minor success.";
    pictureBackground = "";
    picture = "mil_flag";
    pictureColor[] = {0.9, 0, 0, 1};
};

/* ------------------------CUSTOM ENDINGS BELOW------------------------ */