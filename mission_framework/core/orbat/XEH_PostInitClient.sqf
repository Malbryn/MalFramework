#include "script_component.hpp"

if !(GVARMAIN(moduleOrbat)) exitWith {};

// Init ORBAT
call FUNC(initOrbat);

// Add EH to diary list in the briefing screen to detect when the ORBAT has been selected
[{
    !isNull (uiNamespace getVariable ["RscDiary", displayNull]);
}, {
    call FUNC(addSelectionDetection);
}] call CFUNC(waitUntilAndExecute);

// Add it again, but for in mission (previous one gets deleted for some reason)
[QGVARMAIN(initFramework), {
    call FUNC(addSelectionDetection);
}] call CFUNC(addEventHandler);
