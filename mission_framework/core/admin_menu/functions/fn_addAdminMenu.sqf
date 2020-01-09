/*
 * Author:
 * Malbryn
 *
 * Description:
 * Creates ACE self-interaction menu for the logged-in admin
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] call MF_fnc_addAdminMenu
 *
 */

if (!hasInterface) exitWith {};

if (serverCommandAvailable "#kick") then {
  private _menu = ['Admin Menu', 'Admin Menu', '', {}, {true}] call ace_interact_menu_fnc_createAction;

  [player, 1, ["ACE_SelfActions"], _menu] call ace_interact_menu_fnc_addActionToObject;
};
