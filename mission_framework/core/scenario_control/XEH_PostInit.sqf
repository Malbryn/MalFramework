#include "script_component.hpp"

if !(GVARMAIN(moduleScenarioControl)) exitWith {};

if (hasInterface) then {
    [QGVARMAIN(transferSC), {
        call FUNC(addScenarioEndControlMenu);
    }] call CFUNC(addEventHandler);

    call FUNC(addScenarioEndControlMenu);
};
