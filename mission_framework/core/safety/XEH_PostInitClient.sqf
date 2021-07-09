#include "script_component.hpp"

if !(GVARMAIN(moduleSafetyStart)) exitWith {};

// Force weapon on back at mission start
[QGVARMAIN(initFramework), {
    call FUNC(forceSafety);
}] call CFUNC(addEventHandler);
