#include "..\script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Creates ACE self-interaction menu which adds the ability of controlling task states

    Arguments:
        -

    Example:
        call MF_blank_fnc_blank

    Returns:
        void
*/

private ["_menu", "_taskList", "_task", "_taskName"];

if !(IS_ADMIN_LOGGED || getPlayerUID player == GETPAVAR(GVARMAIN(missionMaker),"")) exitWith {};

// Put every task into an array
_taskList = player call BFUNC(tasksUnit);

// Create the Tasks category
_menu = ['Tasks', 'Tasks', '', {}, {true}] call AFUNC(interact_menu,createAction);
[player, 1, ["ACE_SelfActions", "Admin Menu"], _menu] call AFUNC(interact_menu,addActionToObject);

// Iterate the tasks and add each task to the Tasks category
_task = [];
_taskName = "";

{
    // Create a task sub-menu under the Tasks main category
    _task = _x call BFUNC(taskDescription);
    _taskName = (_task#1) joinString "";

    _menu = [_taskName, _taskName, '', {}, {true}] call AFUNC(interact_menu,createAction);
    [player, 1, ["ACE_SelfActions", "Admin Menu", "Tasks"], _menu] call AFUNC(interact_menu,addActionToObject);


    // Task controls
    _menu = ['Succeeded', 'Succeeded', '', {
        [_this#2, "SUCCEEDED"] call BFUNC(taskSetState);
    }, {true}, {}, _x] call AFUNC(interact_menu,createAction);

    [player, 1, ["ACE_SelfActions", "Admin Menu", "Tasks", _taskName], _menu] call AFUNC(interact_menu,addActionToObject);


    _menu = ['Failed', 'Failed', '', {
        [_this#2, "FAILED"] call BFUNC(taskSetState);
    }, {true}, {}, _x] call AFUNC(interact_menu,createAction);

    [player, 1, ["ACE_SelfActions", "Admin Menu", "Tasks", _taskName], _menu] call AFUNC(interact_menu,addActionToObject);


    _menu = ['Canceled', 'Canceled', '', {
        [_this#2, "CANCELED"] call BFUNC(taskSetState);
    }, {true}, {}, _x] call AFUNC(interact_menu,createAction);

    [player, 1, ["ACE_SelfActions", "Admin Menu", "Tasks", _taskName], _menu] call AFUNC(interact_menu,addActionToObject);


    _menu = ['Assigned', 'Assigned', '', {
        [_this#2, "ASSIGNED"] call BFUNC(taskSetState);
    }, {true}, {}, _x] call AFUNC(interact_menu,createAction);

    [player, 1, ["ACE_SelfActions", "Admin Menu", "Tasks", _taskName], _menu] call AFUNC(interact_menu,addActionToObject);
} forEach _taskList;
