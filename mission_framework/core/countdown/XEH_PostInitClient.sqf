#include "script_component.hpp"

if !(GVARMAIN(countdown)) exitWith {};

[QGVAR(initDialog), {
    params ["_timer", "_startTime", "_titleText"];

    [_timer, _startTime, _titleText] call FUNC(initCountdown);
}] call CFUNC(addEventHandler);
