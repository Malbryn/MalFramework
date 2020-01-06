// Default ends
class MissionSuccess {
    title = "Mission Completed";  // Closing shot - Main title
    subtitle = "";  // Closing shot - Short description
    description = "";  // Debriefing - Summary of the mission
    pictureBackground = "";  // Debriefing - 2:1 picture as background
    picture = "hd_flag";  // Closing shot - 1:1 icon in the middle of the screen
    pictureColor[] = {0.0, 0.3, 0.6, 1};  // Closing shot - Icon colour
};

class MissionFail {
    title = "Mission Failed";
    subtitle = "";
    description = "";
    pictureBackground = "";
    picture = "KIA";
    pictureColor[] = {0.6, 0.1, 0.2, 1};
};

// Don't remove this
class MissionTerminated {
    title = "Mission Terminated";
    subtitle = "The mission was terminated by admin";
    description = "Due to technical reasons the mission was terminated";
    pictureBackground = "";
    picture = "hd_warning";
    pictureColor[] = {1, 0, 0, 1};
};
