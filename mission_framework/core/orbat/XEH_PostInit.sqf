#include "script_component.hpp"

if !(GVARMAIN(moduleOrbat)) exitWith{};

if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(initOrbat);
    }] call CFUNC(addEventHandler);
};
