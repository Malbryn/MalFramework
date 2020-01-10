#include "mission_framework\settings\configure_modules.sqf";

// Disable mission saving
enableSaving [false, false];

// Disable animals
enableEnvironment [false, true];

// Run on player's machine
if (hasInterface) then {

/* Added postInit = 1; value to these functions, this section might not be needed?
  [{!isNull player}, {
    [] call MF_fnc_addAdminMenu;
    [] call MF_fnc_addArsenalMenu;
    [] call MF_fnc_addScenarioEndControl;
  }] call CBA_fnc_waitUntilAndExecute;
*/

//TODO: ADD THESE TO A SEPARATE FILE
  #ifdef MF_BRIEFING
    [] spawn MF_fnc_setBriefing;
  #endif

  #ifdef MF_COVERMAP
    [MF_var_ao] call MF_fnc_coverMap;
  #endif

  #ifdef MF_INTROTEXT
    [{CBA_missionTime > MF_var_title_delay}, {
      [] call MF_fnc_runIntro;
    }] call CBA_fnc_waitUntilAndExecute;
  #endif

  #ifdef MF_ORBAT  // TODO: FIX THIS
    [] call MF_fnc_setOrbat;
  #endif

  #ifdef MF_JIPTELEPORT
    if (CBA_missionTime > 90) then {
      [] call MF_fnc_jipInitTeleport;
    };
  #endif

  #ifdef MF_SNOWFALL  // TODO: FIX THIS
    [] spawn MF_fnc_startSnowfall;
    [] call MF_fnc_addSnowSwitch;
  #endif

  // Disable radios
  enableRadio false;

  // Set view distance
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
