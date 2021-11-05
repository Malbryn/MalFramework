#include "script_component.hpp"

if !(GVARMAIN(countdown) || GVARMAIN(isTVT)) exitWith {};

[QGVAR(showDialog), {
    params ["_timer"];

    [_timer] call FUNC(showCountdownDialog);
}] call CFUNC(addEventHandler);
