// Import admin scripts
#include "mission_framework\root\MF_Admin\init.sqf"

// Import the mission framework modules
#include "mission_framework\config\config.sqf"


// Run everywhere
enableSaving [false, false];
enableEnvironment [false, true];


// Run on the player's machine
if (hasInterface) then {

  enableRadio false;
  setViewDistance MF_var_view_distance_player;
};


// Run on the server
if (isServer) then {
  setViewDistance MF_var_view_distance_server;

  setTimeMultiplier MF_var_time_acceleration;

  /*Mission end conditions check loop on server
  [] spawn {

  };
  */
};
