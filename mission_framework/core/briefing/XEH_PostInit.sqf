#include "script_component.hpp"

if !(GVARMAIN(moduleBriefing)) exitWith{};

if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(setBriefing);
    }] call CFUNC(addEventHandler);
};
