#include "script_component.hpp"

// Friendly fire event
[QGVAR(logFF), {
    params ["_unit", "_killer"];

    [_unit, _killer] call FUNC(logFriendlyFire);
}] call CFUNC(addEventHandler);
