#include "script_component.hpp"

if !(GVARMAIN(moduleVehicleRespawn)) exitWith {};

[QGVAR(registerKilledEH), {
    params ["_vehicle"];

    private _ID = _vehicle addEventHandler ["Killed", {
        params ["_vehicle", "_killer", "_instigator", "_useEffects"];

        [QGVAR(vehicleKilled), _vehicle] call CFUNC(serverEvent);
    }];

    _vehicle setVariable [QGVAR(vehicleRespawnEHID), _ID];
}] call CFUNC(addEventHandler);

[QGVAR(unregisterKilledEH), {
    params ["_vehicle"];

    private _ID = _vehicle getVariable QGVAR(vehicleRespawnEHID);

    if (isNil "_ID") exitwith {};

    _vehicle removeEventHandler ["Killed", _ID];
}] call CFUNC(addEventHandler);
