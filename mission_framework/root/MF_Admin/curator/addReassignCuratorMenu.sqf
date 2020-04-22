/*
 * Author:
 * Malbryn
 *
 * Description:
 * Adds option to reassign admin zeus in case of JIP or death
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

if (hasInterface && (serverCommandAvailable "#logout" || getPlayerUID player == parsingNamespace getVariable "MISSION_MAKER")) then {
    private _menu = ['Reassign Curator', 'Reassign Curator', '', {
        [player] remoteExec ["MF_fnc_reassignCurator", 2];
    }, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", "Admin Menu"], _menu] call ace_interact_menu_fnc_addActionToObject;
};
