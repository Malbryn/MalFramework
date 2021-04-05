#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Calculates the rate of completed tasks and all tasks

    Arguments:
        -

    Example:
        call MF_end_conditions_fnc_calculateTaskRate

    Returns:
        SCALAR
*/

if !(isServer) exitWith {};

private _taskList = GVAR(tasks);
private _taskCount = 0;
private _state = "";
private _rate = 0;

// Count the completed tasks
_taskList apply {
    _state = _x call BFUNC(taskState);

    if (_state == "SUCCEEDED") then {
        _taskCount = _taskCount + 1;
    };
};

if (count _taskList != 0) then {
    _rate = _taskCount / count _taskList;
};

_rate
