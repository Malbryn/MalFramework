#include "script_component.hpp"

if !(GVARMAIN(moduleSnowfall)) exitWith {};

if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        GVAR(enabled) = true;
        
        call FUNC(addSnowMenu);
        call FUNC(startSnowfall);
    }] call CFUNC(addEventHandler);
};
