// Reference: https://community.bistudio.com/wiki/Arma_3_Debriefing

// Closing shot
class MissionCompleted {
    title = "Mission Completed";  // Closing shot - Main title
    subtitle = "";  // Closing shot - Short description
    description = "";  // Debriefing - Summary of the mission
    pictureBackground = "";  // Debriefing - 2:1 picture as background
    picture = "b_inf";  // Closing shot - 1:1 icon in the middle of the screen
    pictureColor[] = {0.0, 0.3, 0.6, 1};  // Closing shot - Icon colour
};

class MissionFailed {
    title = "Mission Failed";
    subtitle = "";
    description = "";
    pictureBackground = "";
    picture = "KIA";
    pictureColor[] = {0.6, 0.1, 0.2, 1};
};

// Other mission end types...
