#include "script_component.hpp"

if !(GVARMAIN(moduleTFAR)) exitWith {};

// Set radios event
[QGVAR(setRadios), {
    call FUNC(setChannels);
    call FUNC(setStereos);
}] call CFUNC(addEventHandler);
