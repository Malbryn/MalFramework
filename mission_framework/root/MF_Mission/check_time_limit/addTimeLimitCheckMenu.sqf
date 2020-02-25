/*
 * Author:
 * Malbryn
 *
 * Description:
 * Adds an ACE interaction menu to the player to check the remaining mission time
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] execVM "mission_framework\root\MF_Mission\check_time_limit\addTimeLimitCheckMenu.sqf"
 *
 */

if (hasInterface && MF_var_end_time_enabled) then {
  private _menu = ['Check remaining time', 'Check remaining time', '\a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\watch_ca.paa', {
	  [] call MF_fnc_checkTimeLimit;
  }, {true}] call ace_interact_menu_fnc_createAction;

  [player, 1, ["ACE_SelfActions"], _menu] call ace_interact_menu_fnc_addActionToObject;
};