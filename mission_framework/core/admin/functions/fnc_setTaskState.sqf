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

    private _colour = [];

    // Refresh the colour
    switch (_state) do {
        case "ASSIGNED": {_colour = TASKCOLOUR_ASSIGNED};
        case "SUCCEEDED": {_colour = TASKCOLOUR_SUCCEEDED};
        case "FAILED": {_colour = TASKCOLOUR_FAILED};
        case "CANCELED": {_colour = TASKCOLOUR_CANCELLED};
        default {_colour = TASKCOLOUR_CREATED};
    };

    lbSetColor [712, lbCurSel 712, _colour];

    [COMPONENT_STR, "INFO", "Task state has been updated", true] call EFUNC(main,log);
};

call FUNC(updateTaskList);
