/*
 * Author:
 * Malbryn
 *
 * Description:
 * Adds option to reassign admin zeus in case of JIP
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] execVM "mission_framework\root\MF_Admin\curator\addReassignCuratorMenu.sqf"
 *
 */

if (hasInterface && serverCommandAvailable "#kick") then {
    private _menu = ['Reassign Curator', 'Reassign Curator', '', {
        ["MF_registerCurator", player] call CBA_fnc_serverEvent;
    }, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", "Admin Menu"], _menu] call ace_interact_menu_fnc_addActionToObject;
};
