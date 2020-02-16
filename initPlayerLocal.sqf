waitUntil {!isNull player};

// Import admin scripts
#include "mission_framework\root\MF_Admin\fncInit.sqf"
#include "mission_framework\root\MF_Admin\init.sqf"

["addAdminMenu", {
  [] execVM "mission_framework\root\MF_Admin\init.sqf";
  systemChat "Adding admin menu...";
}, "admin"] call CBA_fnc_registerChatCommand;

// Import the mission framework settings
#include "mission_framework\config\config.sqf"

// Mission statistics script
#include "mission_framework\root\MF_Mission\mission_statistics\fncInit.sqf"
MF_var_stat_ff = ["FRIENDLY FIRE INCIDENTS: "];

enableSaving [false, false];
enableEnvironment [false, true];
enableSentences false;
enableRadio false;

setViewDistance MF_var_view_distance_player;
