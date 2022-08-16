#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Sets the state of the currently selected task.

    Arguments:
        0: STRING - Task state

    Example:
        ["SUCCEEDED"] call MF_admin_fnc_setTaskState

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params [["_state", ""]];

// Get the currently selected task
private _taskID = lbData [712, lbCurSel 712];

if (_taskID != "") then {
    [_taskID, _state] call BFUNC(taskSetState);

    // Refresh the colour
    private _colour = switch (_state) do {
        case "ASSIGNED": {TASKCOLOUR_ASSIGNED};
        case "SUCCEEDED": {TASKCOLOUR_SUCCEEDED};
        case "FAILED": {TASKCOLOUR_FAILED};
        case "CANCELED": {TASKCOLOUR_CANCELLED};
        default {TASKCOLOUR_CREATED};
    };

    lbSetColor [712, lbCurSel 712, _colour];

    [
        COMPONENT_STR,
        "INFO",
        "Task state has been updated",
        true
    ] call EFUNC(main,log);
};

// Update the task list
call FUNC(updateTaskList);
