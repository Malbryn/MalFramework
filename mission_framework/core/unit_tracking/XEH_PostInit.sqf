#include "script_component.hpp"

if !(GVARMAIN(moduleUnitTracking)) exitWith {};

if (isServer) then {
    // Add PFH
    [{
        call FUNC(refreshMarkers);
    }, GVAR(refreshInterval)] call CFUNC(addPerFrameHandler);
};
