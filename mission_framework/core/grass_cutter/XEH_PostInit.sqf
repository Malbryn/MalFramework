#include "script_component.hpp"

if !(GVARMAIN(moduleGrassCutter)) exitWith{};

if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(addGrassCutterMenu);
    }] call CFUNC(addEventHandler);
};
