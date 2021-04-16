#include "script_component.hpp"

/*
    Author:
        Fredrik Eriksson

    Description:
        Inits the vehicle respawn module.

    Arguments:
        0: OBJECT - Vehicle to be monitored for respawn
        1: SCALAR - Respawn delay in seconds (Optional, default: 5)
        2: CODE - Initialization for vehicle (to refer the vehicle use: _this) (Optional, default: {})
        3: SCALAR - Respawn Limit. Number of lives a vehicle has (Optional, default: -1)
        4: BOOLEAN - Deletes wreck on respawn. Wrecks within 100m of respawn point are automatically deleted, regardless of setting (Optional, default: false)
        5: BOOLEAN - Use custom loadout, saves inventory and loads it on respawn (Optional, default: true)
        6: BOOLEAN - Custom paintjob. Saves the current paint on the vehicle and applies it on respawn (Optional, default: true)

    Example:
        [this, 30, {_this allowDamage false}, 3, false, true, true] call MF_vehicle_respawn_fnc_initVehicleRespawn

    Returns:
        void
*/

if !(isServer) exitWith {};

params [
    ["_vehicle", objNull, [objNull]],
    ["_delay", 5, [0]],
    ["_init", {}, [{}]],
    ["_respawnLimit", -1, [0]],
    ["_deleteWreck", false, [false]],
    ["_loadout", true, [true]],
    ["_savePaint", true, [true]]
];

private _limitEnabled = false;

if (_respawnLimit != -1) then {
    SETPVAR(_vehicle,GVAR(respawnLimit),_respawnLimit);
    _limitEnabled = true;
};

private _inventory = [];

if (_loadout) then {
    _items = getItemCargo _vehicle;
    _magazines = getMagazineCargo _vehicle;
    _weapons = getWeaponCargo _vehicle;
    _backpacks = getBackpackCargo _vehicle;
    _inventory = [_items, _magazines, _weapons, _backpacks];
};

private _paint = "";
private _parts = [];

if (_savePaint) then {
    _customization = [_vehicle] call BFUNC(getVehicleCustomization);
    _paint = (_customization#0)#0;
    _parts = _customization#1;
};

// Save pylons
private _pylons = getAllPylonsInfo _vehicle;

private _vehicleData = [
    _delay, _init, _loadout, vehicleVarName _vehicle, getPosASL _vehicle,
    getDir _vehicle, typeOf _vehicle, _inventory, _savePaint, _paint, _parts,
    _deleteWreck, _limitEnabled, _pylons
];

if (isNil QGVAR(vehicleMonitor)) then {
    GVAR(totalArray) = [];
    call FUNC(initVehicleMonitor);
    GVAR(vehicleMonitor) = 1;
};

GVAR(totalArray) pushBack [_vehicle, _vehicleData];
