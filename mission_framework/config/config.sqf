#define MINUTES *60

/* ---------------------------MISSION PARAMETERS----------------------------- */
MF_var_time_limit_enabled = false;  // Mission time limit on/off (Not yet implemented!)
MF_var_time_limit = 90 MINUTES;  // Mission time limit in seconds (Not yet implemented!)
MF_var_prep_time = 5 MINUTES;  // Preparation time on a Defense mission (Not yet implemented!)
MF_var_respawn_tickets = 1;  // How many times the player can respawn (Not yet implemented!)
MF_var_view_distance_server = 2500;  // Server view distance (= AI view distance)
MF_var_view_distance_player = 2500;  // Player view distance
MF_var_time_acceleration = 1;  // Time acceleration between 0.1 - 120


/* -------------------------------MODULES------------------------------------ */
// AMBIENT FLYBY
#include "..\root\MF_Effects\ambient_flyby\fncInit.sqf"


// BRIEFING
#include "..\root\MF_Diary\briefing\init.sqf"


// COVER MAP
MF_var_ao = "ao";  // Name of the AO marker
#include "..\root\MF_Misc\cover_map\init.sqf"


// GRASS CUTTER
#include "..\root\MF_Player\grass_cutter\fncInit.sqf"
#include "..\root\MF_Player\grass_cutter\init.sqf"


// INTRO TEXT
MF_var_title = "TEST TITLE";
MF_var_date = "TEST DATE";
MF_var_location = "TEST LOCATION";
MF_var_title_delay = 20;
#include "..\root\MF_Misc\intro_text\init.sqf"


// MORTAR FIRE
#include "..\root\MF_Effects\mortar_fire\fncInit.sqf"


// JIP TELEPORT
#include "..\root\MF_Logistics\jip\fncInit.sqf"
MF_var_jip_is_available = true;  // If teleport to squad is available for JIP players
MF_var_jipTimer = 3 MINUTES;  // How many seconds the player has to TP back to their squad before the option expires
#include "..\root\MF_Logistics\jip\init.sqf"


// ORBAT
#include "..\root\MF_Diary\orbat\fncInit.sqf"
#include "..\root\MF_Diary\orbat\init.sqf"


// REINSERT
#include "..\root\MF_Logistics\reinsert\fncInit.sqf"
MF_var_use_halo = true;  // HALO drop
MF_var_use_mrv = false;  // Mobile Respawn Vehicle
MF_var_use_rp = true;  // Squad Rally Point
#include "..\root\MF_Logistics\reinsert\init.sqf"


// SAFETY
#include "..\root\MF_Player\safety\init.sqf"


// SCENARIO CONTROL
#include "..\root\MF_Player\scenario_control\init.sqf"


// SNOWFALL
//#include "..\root\MF_Effects\snowfall\fncInit.sqf"
//#include "..\root\MF_Effects\snowfall\init.sqf"


// SUPPLY DROP
#include "..\root\MF_Logistics\supply_drop\fncInit.sqf"
MF_var_supply_drop_crates = [
	[crate1, "Ammo Resupply"],
	[crate2, "Medic Resupply"]
];
MF_var_supply_drop_plane = "LIB_C47_Skytrain";
#include "..\root\MF_Logistics\supply_drop\addSupplyDropMenu.sqf"


// VEHICLE RESPAWN
#include "..\root\MF_Logistics\vehicle_respawn\fncInit.sqf"
