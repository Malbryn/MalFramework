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
 * [] call MF_fnc_addScenarioEndControl
 *
 */

if (isServer) exitWith {};

// Admin section
if (serverCommandAvailable "#kick") then {

  // Scenario control category
  private _switch = ['Scenario Flow', 'Scenario Flow', '', {}, {true}] call ace_interact_menu_fnc_createAction;

  [player, 1, ["ACE_SelfActions", "Admin Menu"], _switch] call ace_interact_menu_fnc_addActionToObject;

  // Mission Success
  private _switch = ['Mission Success', 'Mission Success', '', {
    ["MissionSuccess", true, true, true, true] remoteExecCall ["BIS_FNC_EndMission", 0, true];
  }, {true}] call ace_interact_menu_fnc_createAction;

  [player, 1, ["ACE_SelfActions", "Admin Menu", "Scenario Flow"], _switch] call ace_interact_menu_fnc_addActionToObject;

  // Mission Fail
  private _switch = ['Mission Fail', 'Mission Fail', '', {
    ["MissionFail", false, true, true, true] remoteExecCall ["BIS_FNC_EndMission", 0, true];
  }, {true}] call ace_interact_menu_fnc_createAction;

  [player, 1, ["ACE_SelfActions", "Admin Menu", "Scenario Flow"], _switch] call ace_interact_menu_fnc_addActionToObject;

  // Mission Terminated
  private _switch = ['Terminate Mission', 'Terminate Mission', '', {
    ["MissionTerminated", false, true, true, true] remoteExecCall ["BIS_FNC_EndMission", 0, true];
  }, {true}] call ace_interact_menu_fnc_createAction;

  [player, 1, ["ACE_SelfActions", "Admin Menu", "Scenario Flow"], _switch] call ace_interact_menu_fnc_addActionToObject;
};


// CO section
if (MF_var_is_CO && !(serverCommandAvailable "#kick")) then {

  // Scenario control category
  private _switch = ['Scenario Flow', 'Scenario Flow', '', {}, {true}] call ace_interact_menu_fnc_createAction;

  [player, 1, ["ACE_SelfActions", "Admin Menu"], _switch] call ace_interact_menu_fnc_addActionToObject;

  // Mission Success
  private _switch = ['Mission Success', 'Mission Success', '', {
    ["MissionSuccess", true, true, true, true] remoteExecCall ["BIS_FNC_EndMission", 0, true];
  }, {true}] call ace_interact_menu_fnc_createAction;

  [player, 1, ["ACE_SelfActions", "Admin Menu", "Scenario Flow"], _switch] call ace_interact_menu_fnc_addActionToObject;

  // Mission Fail
  private _switch = ['Mission Fail', 'Mission Fail', '', {
    ["MissionFail", false, true, true, true] remoteExecCall ["BIS_FNC_EndMission", 0, true];
  }, {true}] call ace_interact_menu_fnc_createAction;

  [player, 1, ["ACE_SelfActions", "Admin Menu", "Scenario Flow"], _switch] call ace_interact_menu_fnc_addActionToObject;
};
