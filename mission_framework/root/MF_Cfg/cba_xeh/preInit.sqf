// Admin functions
#include "..\..\MF_Admin\fncInit.sqf"

// AI functions
#include "..\..\MF_AI\ai_scripts\fncInit.sqf"
#include "..\..\MF_AI\set_ai_skill\fncInit.sqf"

// Diary functions
#include "..\..\MF_Diary\orbat\fncInit.sqf"

// Logistics functions
#include "..\..\MF_Logistics\jip\fncInit.sqf"
#include "..\..\MF_Logistics\vehicle_respawn\fncInit.sqf"

// Mission functions
#include "..\..\MF_Mission\end_conditions\fncInit.sqf"
#include "..\..\MF_Mission\end_mission\fncInit.sqf"
#include "..\..\MF_Mission\mission_statistics\fncInit.sqf"

// Player functions
#include "..\..\MF_Player\gear\fncInit.sqf"
#include "..\..\MF_Player\init_player\fncInit.sqf"


// Compiling those functions that are transferable (i.e. CO dies, next in command can use the support modules) for easier remote execution
MF_fnc_addRpMenu =
	compile preprocessFileLineNumbers "mission_framework\root\MF_Logistics\reinsert\rally_point\fn_addRpMenu.sqf";

MF_fnc_addSupplyDropMenu =
	compile preprocessFileLineNumbers "mission_framework\root\MF_Logistics\supply_drop\fn_addSupplyDropMenu.sqf";

MF_fnc_addScenarioEndControl =
	compile preprocessFileLineNumbers "mission_framework\root\MF_Mission\scenario_control\fn_addScenarioEndControl.sqf";


// Defining some global variables which need default values
MF_var_use_supply_drop = false;
MF_var_sc_enabled = false;
MF_var_nd_ending_enabled = false;
MF_var_snowfall_enabled = false;
MF_var_tasks = [];


// Compiling the AI skills array
call compile preprocessFileLineNumbers "mission_framework\config\ai_skill\ai_skill.sqf";
