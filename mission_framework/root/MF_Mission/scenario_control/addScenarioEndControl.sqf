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
      ["MissionSuccess", true] remoteExec ["MF_fnc_endMission", 2];
    }, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", "Admin Menu", "Scenario Flow"], _switch] call ace_interact_menu_fnc_addActionToObject;


    // Mission Fail
    private _switch = ['Mission Fail', 'Mission Fail', '', {
      ["MissionFail", false] remoteExec ["MF_fnc_endMission", 2];
    }, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", "Admin Menu", "Scenario Flow"], _switch] call ace_interact_menu_fnc_addActionToObject;


    // Mission Terminated
    private _switch = ['Terminate Mission', 'Terminate Mission', '', {
      ["MissionTerminated", false] remoteExec ["MF_fnc_endMission", 2];
    }, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", "Admin Menu", "Scenario Flow"], _switch] call ace_interact_menu_fnc_addActionToObject;
  };


  // CO section
  if ((player getVariable "MF_var_is_CO") && !(serverCommandAvailable "#kick")) then {

    // Scenario control category
    private _switch = ['Scenario flow', 'Scenario flow', '\a3\ui_f\data\Map\Diary\Icons\taskSucceeded_ca.paa', {}, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions"], _switch] call ace_interact_menu_fnc_addActionToObject;


    // Call retreat
    private _switch = ['Call retreat', 'Call retreat', '', {
      // Put the tasks into an array
      private _taskList = player call BIS_fnc_tasksUnit;

      // Count failed or cancelled tasks
      _count = 0;
      {
        private _state = _x call BIS_fnc_taskState;
        if (_state == "CREATED" || _state == "FAILED" || _state == "CANCELED") then {
          _count = _count + 1;
        };
      } forEach _taskList;

      // Calculate the rate of the failed tasks
      _rate = _count / count _taskList;

      // Call the mission end on the server accordingly
      if (_rate >= (MF_var_success_rate * 0.01)) then {
        ["RetreatLose", false] remoteExec ["MF_fnc_endMission", 2];
      } else {
        ["RetreatWin", true] remoteExec ["MF_fnc_endMission", 2];
      };
    }, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", "Scenario flow"], _switch] call ace_interact_menu_fnc_addActionToObject;
  };
};