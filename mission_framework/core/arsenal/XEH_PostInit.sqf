#include "script_component.hpp"

if !(GVARMAIN(moduleCurator)) exitWith{};

if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(addArsenalMenu);
    }] call CFUNC(addEventHandler);
};
