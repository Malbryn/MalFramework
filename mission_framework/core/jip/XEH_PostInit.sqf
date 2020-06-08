#include "script_component.hpp"

if !(GVARMAIN(moduleJIP)) exitWith{};

if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(addJIPMenu);
    }] call CFUNC(addEventHandler);
};
