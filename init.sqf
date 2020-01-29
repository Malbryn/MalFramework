// Import admin scripts
#include "mission_framework\root\MF_Admin\fncInit.sqf"
#include "mission_framework\root\MF_Admin\init.sqf"


// Import the mission framework settings
#include "mission_framework\config\config.sqf"


// Mission statistics script
#include "mission_framework\root\MF_Mission\mission_statistics\fncInit.sqf"


// Run everywhere
enableSaving [false, false];
enableEnvironment [false, true];


// Run on the client's machine
if (hasInterface) then {

  enableRadio false;
  setViewDistance MF_var_view_distance_player;
};


// Run on the server
if (isServer) then {

  MF_var_stat_ff = ["FRIENDLY FIRE INCIDENTS:<br/>"];

  setViewDistance MF_var_view_distance_server;
  setTimeMultiplier MF_var_time_acceleration;

  // Mission end conditions check loop on server
  MF_var_mission_ended = false;

  waitUntil { CBA_missionTime > 0 };

  MF_EndCheck = [] spawn {
    while {!MF_var_mission_ended} do {
      [] call MF_fnc_checkEndConditions;
    };
  };
};