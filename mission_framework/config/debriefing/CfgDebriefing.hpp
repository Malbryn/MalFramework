/* ----------------------------------- COOP ENDINGS ----------------------------------- */

// Generic - Major Success
class MissionSuccess {
    title = "Mission Success";              // Closing shot - Main title
    subtitle = "default_subtitle";          // Closing shot - Short description
    description = "default_description";    // Debriefing - Summary of the mission
    pictureBackground = "";                 // Debriefing - 2:1 picture as background
    picture = "mil_end";                    // Closing shot - 1:1 icon in the middle of the screen
    pictureColor[] = {0, 0.8, 0, 1};        // Closing shot - Icon colour
};

// Generic - Minor success
class MinorSuccess {
    title = "Minor Success";
    subtitle = "default_subtitle";
    description = "default_description";
    pictureBackground = "";
    picture = "mil_flag";
    pictureColor[] = {0, 0.8, 0, 1};
};

// Generic - Minor fail
class MinorFail {
    title = "Minor Defeat";
    subtitle = "default_subtitle";
    description = "default_description";
    pictureBackground = "";
    picture = "mil_flag";
    pictureColor[] = {0.9, 0, 0, 1};
};

// Generic - Major Fail
class MissionFail {
    title = "Mission Failed";
    subtitle = "default_text";
    description = "default_text";
    pictureBackground = "";
    picture = "KIA";
    pictureColor[] = {0.6, 0.1, 0.2, 1};
};

// Time limit - Minor success
class TimeLimitMinorSuccess {
    title = "Minor Success";
    subtitle = "Time limit reached";
    description = "default_text";
    pictureBackground = "";
    picture = "mil_flag";
    pictureColor[] = {0, 0.8, 0, 1};
};

// Time limit - Minor fail
class TimeLimitMinorFail {
    title = "Minor Defeat";
    subtitle = "Time limit reached";
    description = "default_text";
    pictureBackground = "";
    picture = "mil_flag";
    pictureColor[] = {0.9, 0, 0, 1};
};

// Player casualty
class PlayerCasLimit {
    title = "Mission Failed";
    subtitle = "You've suffered serious casualties";
    description = "Your unit suffered serious casualties. Better luck next time.";
    pictureBackground = "";
    picture = "KIA";
    pictureColor[] = {0.6, 0.1, 0.2, 1};
};

// Civilian casualty
class CivCasLimit {
    title = "Mission Failed";
    subtitle = "Civilian casualty limit reached";
    description = "The number of civilian casualties was too high. Watch your fire next time.";
    pictureBackground = "";
    picture = "KIA";
    pictureColor[] = {0.6, 0.1, 0.2, 1};
};

// Withdrawal - Minor success
class WithdrawalMinorSuccess {
    title = "Minor Success";
    subtitle = "Tactical withdrawal was called by the CO";
    description = "The CO called tactical withdrawal ending the mission earlier. Consider this a minor success.";
    pictureBackground = "";
    picture = "mil_flag";
    pictureColor[] = {0, 0.8, 0, 1};
};

// Withdrawal - Minor fail
class WithdrawalMinorFail {
    title = "Minor Defeat";
    subtitle = "Tactical withdrawal was called by the CO";
    description = "The CO called tactical withdrawal ending the mission earlier. Consider this a minor defeat.";
    pictureBackground = "";
    picture = "mil_flag";
    pictureColor[] = {0.9, 0, 0, 1};
};


/* ----------------------------------- TvT ENDINGS ----------------------------------- */

// Generic success
class BluforWin {
    title = "blufor_faction Win";
    subtitle = "default_subtitle";
    description = "default_description";
    pictureBackground = "";
    picture = "b_unknown";
    pictureColor[] = {0, 0.3, 0.6, 1};
};

// Generic fail
class RedforWin {
    title = "redfor_faction Win";
    subtitle = "default_subtitle";
    description = "default_description";
    pictureBackground = "";
    picture = "o_unknown";
    pictureColor[] = {0.5, 0, 0, 1};
};

// Time limit - Blufor win
class TimeLimitBlufor {
    title = "blufor_faction Win";
    subtitle = "Time limit reached";
    description = "redfor_faction ran out of time. blufor_faction win.";
    pictureBackground = "";
    picture = "b_unknown";
    pictureColor[] = {0, 0.3, 0.6, 1};
};

// Time limit - Redfor win
class TimeLimitRedfor {
    title = "redfor_faction Win";
    subtitle = "Time limit reached";
    description = "blufor_faction ran out of time. redfor_faction win.";
    pictureBackground = "";
    picture = "o_unknown";
    pictureColor[] = {0.5, 0, 0, 1};
};

// Time limit - Draw
class TimeLimitDraw {
    title = "Draw";
    subtitle = "Time limit reached";
    description = "Time's up. Both sides have the same amount of players. It's a draw.";
    pictureBackground = "";
    picture = "o_unknown";
    pictureColor[] = {0.5, 0, 0, 1};
};

// Player casualty - Blufor win
class PlayerCasLimitBlufor {
    title = "blufor_faction Win";
    subtitle = "redfor_faction suffered serious casulties";
    description = "redfor_faction suffered serious casualties. blufor_faction win.";
    pictureBackground = "";
    picture = "b_unknown";
    pictureColor[] = {0, 0.3, 0.6, 1};
};

// Player casualty - Redfor win
class PlayerCasLimitRedfor {
    title = "redfor_faction Win";
    subtitle = "blufor_faction suffered serious casulties";
    description = "blufor_faction suffered serious casualties. redfor_faction win.";
    pictureBackground = "";
    picture = "o_unknown";
    pictureColor[] = {0.5, 0, 0, 1};
};

// Civilian casualty - Blufor win
class CivCasLimitBlufor {
    title = "blufor_faction Win";
    subtitle = "Civilian casualty limit reached";
    description = "redfor_faction reached the civilian casualty limit. blufor_faction win.";
    pictureBackground = "";
    picture = "b_unknown";
    pictureColor[] = {0, 0.3, 0.6, 1};
};

// Civilian casualty - Redfor win
class CivCasLimitRedfor {
    title = "redfor_faction Win";
    subtitle = "Civilian casualty limit reached";
    description = "blufor_faction reached the civilian casualty limit. redfor_faction win.";
    pictureBackground = "";
    picture = "o_unknown";
    pictureColor[] = {0.5, 0, 0, 1};
};

// Withdrawal - Blufor win
class WithdrawalBlufor {
    title = "blufor_faction Win";
    subtitle = "redfor_faction called tactical withdrawal";
    description = "redfor_faction called tactical withdrawal. blufor_faction win.";
    pictureBackground = "";
    picture = "b_unknown";
    pictureColor[] = {0, 0.3, 0.6, 1};
};

// Withdrawal - Redfor win
class WithdrawalRedfor {
    title = "redfor_faction Win";
    subtitle = "blufor_faction called tactical withdrawal";
    description = "blufor_faction called tactical withdrawal. redfor_faction win.";
    pictureBackground = "";
    picture = "o_unknown";
    pictureColor[] = {0.5, 0, 0, 1};
};

// Respawn tickets - Blufor win
class TicketsBlufor {
    title = "blufor_faction Win";
    subtitle = "redfor_faction ran out of manpower";
    description = "redfor_faction ran out of manpower. blufor_faction win.";
    pictureBackground = "";
    picture = "b_unknown";
    pictureColor[] = {0, 0.3, 0.6, 1};
};

// Respawn tickets - Redfor win
class TicketsRedfor {
    title = "redfor_faction Win";
    subtitle = "blufor_faction ran out of manpower";
    description = "blufor_faction ran out of manpower. redfor_faction win.";
    pictureBackground = "";
    picture = "o_unknown";
    pictureColor[] = {0.5, 0, 0, 1};
};


/* --------------------------- GAME MASTER ENDING --------------------------- */

// Game master
class MissionTerminated {
    title = "Mission Terminated";
    subtitle = "The mission was terminated by a game master";
    description = "Due to technical reasons the mission was terminated.";
    pictureBackground = "";
    picture = "mil_warning";
    pictureColor[] = {0.9, 0, 0, 1};
};


/* ----------------------------- CUSTOM ENDINGS ----------------------------- */
