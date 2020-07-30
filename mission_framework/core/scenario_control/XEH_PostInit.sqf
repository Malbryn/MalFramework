#include "script_component.hpp"

if !(GVARMAIN(moduleScenarioControl)) exitWith {};

// Check if the tasks are registered properly
[QGVARMAIN(initFramework), {
    if (count EGVAR(end_conditions,tasks) == 0) exitWith {
        MSG("WARNING","(Scenario control) The Scenario control module is active but no task was registered. You won't be able to call Tactical Withdrawal.");
    };
}] call CFUNC(addEventHandler);

if (hasInterface) then {
    [QGVAR(transferSC), {
        call FUNC(addScenarioEndControlMenu);
    }] call CFUNC(addEventHandler);

    call FUNC(addScenarioEndControlMenu);
};
