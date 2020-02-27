/*
 * Author:
 * Malbryn
 *
 * Description:
 * Registers a chat command which can be used to reassign the admin commands.
 * This can be used if the admin logs in after mission init.
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] execVM "mission_framework\root\MF_Admin\admin_menu\registerAdminCommand.sqf"
 *
 */

if (hasInterface) then {
  ["addAdminMenu", {
    [] execVM "mission_framework\root\MF_Admin\init.sqf";
    systemChat "[MF INFO] Adding admin menu...";
  }, "admin"] call CBA_fnc_registerChatCommand;
};