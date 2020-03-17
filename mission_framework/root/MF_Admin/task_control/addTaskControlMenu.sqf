/*
 * Author:
 * Malbryn
 *
 * Description:
 * Creates ACE self-interaction menu for the logged-in admin and adds the ability of controlling task states
 * TODO: Refresh when new task is created
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] execVM "mission_framework\root\MF_Admin\task_control\addTaskControlMenu.sqf"
 *
 */

if (hasInterface && (serverCommandAvailable "#logout" || getPlayerUID player == parsingNamespace getVariable "MISSION_MAKER")) then {
    // Put all tasks into an array
    _taskList = player call BIS_fnc_tasksUnit;

    // Create the Tasks parent
    private _menu = ['Tasks', 'Tasks', '', {}, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", "Admin Menu"], _menu] call ace_interact_menu_fnc_addActionToObject;

    // Iterate through the tasks and add each task to the Tasks parent menu
    _task = [];
    _taskName = "";

    {
        // Create a task sub-menu under the Tasks main category
        _task = _x call BIS_fnc_taskDescription;
        _taskName = (_task select 1) joinString "";

        _menu = [_taskName, _taskName, '', {}, {true}] call ace_interact_menu_fnc_createAction;

        [player, 1, ["ACE_SelfActions", "Admin Menu", "Tasks"], _menu] call ace_interact_menu_fnc_addActionToObject;


        // Task controls
        _menu = ['Succeeded', 'Succeeded', '', {
            [_this select 2, "SUCCEEDED"] call BIS_fnc_taskSetState;
        }, {true}, {}, _x] call ace_interact_menu_fnc_createAction;

        [player, 1, ["ACE_SelfActions", "Admin Menu", "Tasks", _taskName], _menu] call ace_interact_menu_fnc_addActionToObject;


        _menu = ['Failed', 'Failed', '', {
            [_this select 2, "FAILED"] call BIS_fnc_taskSetState;
        }, {true}, {}, _x] call ace_interact_menu_fnc_createAction;

        [player, 1, ["ACE_SelfActions", "Admin Menu", "Tasks", _taskName], _menu] call ace_interact_menu_fnc_addActionToObject;


        _menu = ['Canceled', 'Canceled', '', {
            [_this select 2, "CANCELED"] call BIS_fnc_taskSetState;
        }, {true}, {}, _x] call ace_interact_menu_fnc_createAction;

        [player, 1, ["ACE_SelfActions", "Admin Menu", "Tasks", _taskName], _menu] call ace_interact_menu_fnc_addActionToObject;


        _menu = ['Assigned', 'Assigned', '', {
            [_this select 2, "ASSIGNED"] call BIS_fnc_taskSetState;
        }, {true}, {}, _x] call ace_interact_menu_fnc_createAction;

        [player, 1, ["ACE_SelfActions", "Admin Menu", "Tasks", _taskName], _menu] call ace_interact_menu_fnc_addActionToObject;
    } forEach _taskList;
};