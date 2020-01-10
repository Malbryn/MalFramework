/* ---------------------------MISSION PARAMETERS----------------------------- */
MF_var_time_limit = 3600;  // Mission time limit in seconds
MF_var_respawn_tickets = 1;  // Not yet implemented!
MF_var_view_distance_server = 2000;  // Server view distance (AI)
MF_var_view_distance_player = 2000;  // Player view distance
MF_var_time_acceleration = 1;  // Time acceleration between 0.1 - 120


/* -------------------------------MODULES------------------------------------ */
// BRIEFING
#define MF_BRIEFING

// COVER MAP
#define MF_COVERMAP
MF_var_ao = "ao";  // Name of the AO marker

// INTRO TEXT
#define MF_INTROTEXT
MF_var_title = "TEST TITLE";
MF_var_date = "TEST DATE";
MF_var_location = "TEST LOCATION";
MF_var_title_delay = 10;

// JIP TELEPORT --- TODO: WAIT UNTIL PLAYER IS IN THE GAME (SO THE NOTIFICATION CAN BE SEEN)
#define MF_JIPTELEPORT
MF_var_jip_is_available = true;  // If teleport is available for JIP players
MF_var_jipTimer = 180;  // Seconds the player has to TP back to their squad

// ORBAT
#define MF_ORBAT

// REINSERT
MF_var_use_para = true;
MF_var_use_mrv = false;  // Mobile Respawn Vehicle

// SNOWFALL
#define MF_SNOWFALL
MF_var_snowfall_enabled = true;
