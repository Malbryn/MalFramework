#include "script_component.hpp"

if !(GVARMAIN(moduleUnitTracking)) exitWith {};

if (isServer) then {
    // Add PFH
    [QGVARMAIN(initFramework), {
        [{call FUNC(refreshMarkers)}, GVAR(refreshInterval)] call CFUNC(addPerFrameHandler);
    }] call CFUNC(addEventHandler);
};
