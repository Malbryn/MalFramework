#include "script_component.hpp"

if !(GVARMAIN(moduleVehicleRespawn)) exitWith {};

// Vehicle monitoring
GVAR(monitoring) = [{
    call FUNC(monitorVehicle);
}, 5] call CFUNC(addPerFrameHandler);
