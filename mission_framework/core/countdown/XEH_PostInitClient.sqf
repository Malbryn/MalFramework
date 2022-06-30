#include "script_component.hpp"

if !(GVARMAIN(moduleCountdown)) exitWith {};

[QGVAR(openDialog), {
    params ["_timer", "_startTime", "_titleText"];

    [_timer, _startTime, _titleText] call FUNC(initCountdown);
}] call CFUNC(addEventHandler);

[QGVAR(closeDialog), {
    call FUNC(closeDialog);
}] call CFUNC(addEventHandler);
