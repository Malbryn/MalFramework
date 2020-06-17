#include "script_component.hpp"

if !(GVARMAIN(moduleDisableDamage)) exitWith {};

[QGVARMAIN(damageDisabled), {
    call FUNC(eventFired);
}] call CFUNC(addEventHandler);
