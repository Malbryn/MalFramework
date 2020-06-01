#include "script_component.hpp"

if !(GVARMAIN(moduleScenarioControl)) exitWith{};

if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(addScenarioEndControlMenu);
    }] call CFUNC(addEventHandler);
};
