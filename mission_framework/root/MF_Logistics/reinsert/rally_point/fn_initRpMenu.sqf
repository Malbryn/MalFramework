/*
 * Author:
 * Malbryn
 *
 * Description:
 * Creates the RP menu for the group leader
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] call MF_fnc_initRpMenu
 *
 */

if (!hasInterface) exitWith {};


// Create parent category
private _menu = ['Rally Point', 'Rally Point', '\a3\ui_f\data\GUI\Cfg\Hints\icon_text\b_inf_ca.paa', {}, {true}] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions"], _menu] call ace_interact_menu_fnc_addActionToObject;


// Create child category
_menu = ['Deploy Rally Point', 'Deploy Rally Point', '', {
  [] call MF_fnc_deployRp;
}, {true}] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "Rally Point"], _menu] call ace_interact_menu_fnc_addActionToObject;