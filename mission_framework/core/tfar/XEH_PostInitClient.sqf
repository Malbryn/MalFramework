#include "script_component.hpp"

if !(GVARMAIN(moduleTFAR)) exitWith {};

if (!isMultiplayer) exitWith {
    [
        COMPONENT_STR,
        "INFO",
        "The module does not work in singleplayer",
        true
    ] call EFUNC(main,log);
};

// Set channels at mission start
[QGVARMAIN(initFramework), {
    [QGVAR(setRadios)] call CFUNC(localEvent);
}] call CFUNC(addEventHandler);
