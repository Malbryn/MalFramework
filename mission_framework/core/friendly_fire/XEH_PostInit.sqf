#include "script_component.hpp"

[QGVAR(logFF), {
    params ["_unit", "_killer"];

    [_unit, _killer] call FUNC(friendlyFireMessage);
}] call CFUNC(addEventHandler);
