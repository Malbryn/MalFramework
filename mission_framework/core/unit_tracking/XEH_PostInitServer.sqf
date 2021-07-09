#include "script_component.hpp"

if !(GVARMAIN(moduleUnitTracking)) exitWith {};

// Add PFH
[QGVARMAIN(initFramework), {
    [{call FUNC(refreshMarkers)}, GVAR(refreshInterval)] call CFUNC(addPerFrameHandler);
}] call CFUNC(addEventHandler);
