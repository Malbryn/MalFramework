#include "script_component.hpp"

if !(GVARMAIN(moduleSafetyStart)) exitWith{};

if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(forceSafety);
    }] call CFUNC(addEventHandler);
};
