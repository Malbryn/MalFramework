#include "script_component.hpp"

if !(GVARMAIN(moduleScenarioControl)) exitWith {};

if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(addScenarioEndControlMenu);
    }] call CFUNC(addEventHandler);

    [QGVARMAIN(transferSC), {
        call FUNC(addScenarioEndControlMenu);
    }] call CFUNC(addEventHandler);
};
