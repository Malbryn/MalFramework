#include "script_component.hpp"

if !(GVARMAIN(moduleRetreat)) exitWith {};

// Check if the tasks are registered properly
[QGVARMAIN(initFramework), {
    if (count EGVAR(end_conditions,tasks) == 0) exitWith {
        [COMPONENT_STR, "WARNING", "No task was registered, the Tactical withdrawal option won't be available", true] call EFUNC(main,log);
    };
}] call CFUNC(addEventHandler);
