#include "script_component.hpp"

if !(GVARMAIN(moduleVehicleRespawn)) exitWith {};

[QGVAR(vehicleKilled), FUNC(vehicleKilled)] call CFUNC(addEventHandler);
