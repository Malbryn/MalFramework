/*
 * Author:
 * Malbryn
 *
 * Description:
 * Creates ACE self-interaction menu to control the snowfall script
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] execVM "mission_framework\root\MF_Effects\snowfall\addSnowSwitch.sqf"
 *
 */

if (hasInterface) then {

  // Snow script category
  private _switch = ['Snow Script', 'Snow Script', '\a3\ui_f\data\IGUI\Cfg\Cursors\unitHealer_ca.paa', {}, {true}] call ace_interact_menu_fnc_createAction;
  [player, 1, ["ACE_SelfActions"], _switch] call ace_interact_menu_fnc_addActionToObject;


  // Turn snow script on
  private _switch = ['Snow Script - On', 'Snow Script - On', '', {
    [] spawn MF_fnc_startSnowfall;
    systemChat "Snow script is ON";
  }, {true}] call ace_interact_menu_fnc_createAction;

  [player, 1, ["ACE_SelfActions", "Snow Script"], _switch] call ace_interact_menu_fnc_addActionToObject;


  // Turn snow script off
  private _switch = ['Snow Script - Off', 'Snow Script - Off', '', {
    missionNameSpace setVariable ["MF_var_snowfall_start", false];
    systemChat "Snow script is OFF";
  }, {true}] call ace_interact_menu_fnc_createAction;

  [player, 1, ["ACE_SelfActions", "Snow Script"], _switch] call ace_interact_menu_fnc_addActionToObject;
};