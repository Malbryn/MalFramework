#include "script_component.hpp"

if !(GVARMAIN(moduleTFAR)) exitWith {};

// Set channels at mission start
[QGVARMAIN(initFramework), {
    call FUNC(setChannels);
}] call CFUNC(addEventHandler);
