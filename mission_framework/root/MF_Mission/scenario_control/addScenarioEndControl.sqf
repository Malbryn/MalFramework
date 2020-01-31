/*
 * Author:
 * Malbryn
 *
 * Description:
 * Creates ACE self-interaction menu for the the logged-in admin and the CO to be able to control the scenario flow
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] execVM "mission_framework\root\MF_Mission\scenario_control\addScenarioEndControl.sqf"
 *
 */

if (hasInterface) then {

  // Admin section
  if (serverCommandAvailable "#kick") then {

    // Scenario control category
    private _switch = ['Scenario Flow', 'Scenario Flow', '', {}, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", "Admin Menu"], _switch] call ace_interact_menu_fnc_addActionToObject;


    // Mission Success
    private _switch = ['Mission Success', 'Mission Success', '', {
      [] call MF_fnc_getStats;

      ["MissionSuccess", true, true, true, true] remoteExecCall ["BIS_FNC_EndMission", 0, true];

      if (MF_var_nd_ending_enabled) then {
        [] remoteExecCall ["MF_fnc_noDamageEnding", 0];
      };
    }, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", "Admin Menu", "Scenario Flow"], _switch] call ace_interact_menu_fnc_addActionToObject;


    // Mission Fail
    private _switch = ['Mission Fail', 'Mission Fail', '', {
      [] call MF_fnc_getStats;

      ["MissionFail", false, true, true, true] remoteExecCall ["BIS_FNC_EndMission", 0, true];

      if (MF_var_nd_ending_enabled) then {
        [] remoteExecCall ["MF_fnc_noDamageEnding", 0];
      };
    }, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", "Admin Menu", "Scenario Flow"], _switch] call ace_interact_menu_fnc_addActionToObject;


    // Mission Terminated
    private _switch = ['Terminate Mission', 'Terminate Mission', '', {
      [] call MF_fnc_getStats;

      ["MissionTerminated", false, true, true, true] remoteExecCall ["BIS_FNC_EndMission", 0, true];

      if (MF_var_nd_ending_enabled) then {
        [] remoteExecCall ["MF_fnc_noDamageEnding", 0];
      };
    }, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", "Admin Menu", "Scenario Flow"], _switch] call ace_interact_menu_fnc_addActionToObject;
  };


  // CO section
  if ((player getVariable "MF_var_is_CO") && !(serverCommandAvailable "#kick")) then {

    // Scenario control category
    private _switch = ['Scenario flow', 'Scenario flow', '', {}, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions"], _switch] call ace_interact_menu_fnc_addActionToObject;


    // Mission Success
    private _switch = ['Mission Success', 'Mission Success', '', {
      [] call MF_fnc_getStats;

      ["MissionSuccess", true, true, true, true] remoteExecCall ["BIS_FNC_EndMission", 0, true];

      if (MF_var_nd_ending_enabled) then {
        [] remoteExecCall ["MF_fnc_noDamageEnding", 0];
      };
    }, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", "Scenario flow"], _switch] call ace_interact_menu_fnc_addActionToObject;


    // Mission Fail
    private _switch = ['Mission Fail', 'Mission Fail', '', {
      [] call MF_fnc_getStats;

      ["MissionFail", false, true, true, true] remoteExecCall ["BIS_FNC_EndMission", 0, true];

      if (MF_var_nd_ending_enabled) then {
        [] remoteExecCall ["MF_fnc_noDamageEnding", 0];
      };
    }, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", "Scenario flow"], _switch] call ace_interact_menu_fnc_addActionToObject;
  };
};