waitUntil {!isNull player};

// Import admin scripts
#include "mission_framework\root\MF_Admin\fncInit.sqf"
#include "mission_framework\root\MF_Admin\init.sqf"
#include "mission_framework\root\MF_Admin\admin_menu\registerAdminCommand.sqf"

// Import the mission framework settings
#include "mission_framework\config\config.sqf"

enableSaving [false, false];
enableEnvironment [false, true];
enableSentences true;

[] call MF_fnc_setViewDistance;
[] call MF_fnc_setRespawnTickets;
[] spawn MF_fnc_setChannels;