#include "script_component.hpp"

if !(GVARMAIN(moduleDisableDamage)) exitWith {};

[QGVARMAIN(damageDisabled), {
    call FUNC(disableDamage);
}] call CFUNC(addEventHandler);
