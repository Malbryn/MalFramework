#include "script_component.hpp"

if !(GVARMAIN(moduleVehicleRespawn)) exitWith {};

if (isServer) then {
    GVAR(monitoring) = [{
        call FUNC(monitorVehicle);
    }, 5] call CFUNC(addPerFrameHandler);
};
