#include "script_component.hpp"

if !(GVARMAIN(moduleRetreat)) exitWith {};

[QGVAR(transferSC), {
    call FUNC(addScenarioEndControlMenu);
}] call CFUNC(addEventHandler);

// Add the scenario control menu
call FUNC(addScenarioEndControlMenu);
