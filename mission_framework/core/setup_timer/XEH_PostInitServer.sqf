#include "script_component.hpp"

if !(GVARMAIN(moduleSetupTimer)) exitWith {};

// Save the start time
[QGVARMAIN(initFramework), {
    GVAR(startTime) = serverTime;
    publicVariable QGVAR(startTime);
}] call CFUNC(addEventHandler);
