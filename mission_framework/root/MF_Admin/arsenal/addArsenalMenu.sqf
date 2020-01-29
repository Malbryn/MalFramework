/*
 * Author:
 * Malbryn
 *
 * Description:
 * Creates ACE self-interaction menu for the logged-in admin which opens the ACE Arsenal
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] execVM "mission_framework\root\MF_Admin\arsenal\addArsenalMenu.sqf"
 *
 */

if (hasInterface && serverCommandAvailable "#kick") then {
  private _menu = ['Open Arsenal', 'Open Arsenal', '', {
    [player, player, true] call ace_arsenal_fnc_openBox;
  }, {true}] call ace_interact_menu_fnc_createAction;

  [player, 1, ["ACE_SelfActions", "Admin Menu"], _menu] call ace_interact_menu_fnc_addActionToObject;
};
