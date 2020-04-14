/*
 * Author:
 * Malbryn
 *
 * Description:
 * Creates ACE self-interaction menu for the logged-in admin and mission creator which checks the server performance and mission statistics
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] execVM "mission_framework\root\MF_Admin\performance_check\addCheckPerformanceMenu.sqf"
 *
 */

if (hasInterface && (serverCommandAvailable "#logout" || getPlayerUID player == parsingNamespace getVariable "MISSION_MAKER")) then {

    // Main category
    private _menu = ['Check Performance', 'Check Performance', '', {}, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", "Admin Menu"], _menu] call ace_interact_menu_fnc_addActionToObject;


    // Sub-categories
    private _menu = ['Server', 'Server', '', {
        ["server"] spawn MF_fnc_checkPerformance;
    }, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", "Admin Menu", "Check Performance"], _menu] call ace_interact_menu_fnc_addActionToObject;


    private _menu = ['Mission', 'Mission', '', {
        ["mission"] spawn MF_fnc_checkPerformance;
    }, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", "Admin Menu", "Check Performance"], _menu] call ace_interact_menu_fnc_addActionToObject;


    private _menu = ['Units', 'Units', '', {
        ["units"] spawn MF_fnc_checkPerformance;
    }, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", "Admin Menu", "Check Performance"], _menu] call ace_interact_menu_fnc_addActionToObject;


    private _menu = ['Objects', 'Objects', '', {
        ["objects"] spawn MF_fnc_checkPerformance;
    }, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", "Admin Menu", "Check Performance"], _menu] call ace_interact_menu_fnc_addActionToObject;
};
