#include "script_component.hpp"

if !(GVARMAIN(moduleJIP)) exitWith {};

// Add JIP menu
[QGVARMAIN(initFramework), {
    call FUNC(addJIPMenu);
}] call CFUNC(addEventHandler);
