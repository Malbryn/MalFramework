#include "script_component.hpp"

if !(GVARMAIN(moduleSnowfall)) exitWith {};

// Add snowfall menu and start the snow
[QGVARMAIN(initFramework), {
    GVAR(enabled) = true;
    
    call FUNC(addSnowMenu);
    call FUNC(startSnowfall);
}] call CFUNC(addEventHandler);
