#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Updates the progress position in the Admin Menu.

    Arguments:
        -

    Example:
        call MF_admin_menu_fnc_updateProgressBar

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Exit if the dialog is not visible
if (isNull findDisplay 799) exitWith {};

private _taskList = player call BFUNC(tasksUnit);

_taskList apply {
    private _task = _x call BFUNC(taskDescription);
    private _taskName = (_task#1) joinString "";

    private _index = lbAdd [712, _taskName];

    // Task state colour
    private _state = _x call BFUNC(taskState);
    private _colour = [];

    switch (_state) do {
        case "ASSIGNED": {_colour = TASKCOLOUR_ASSIGNED};
        case "SUCCEEDED": {_colour = TASKCOLOUR_SUCCEEDED};
        case "FAILED": {_colour = TASKCOLOUR_FAILED};
        case "CANCELED": {_colour = TASKCOLOUR_CANCELLED};
        default {_colour = TASKCOLOUR_CREATED};
    };

    lbSetColor [712, _index, _colour];

    // Attach the task ID to the row
    lbSetData [712, _index, _x];
};
