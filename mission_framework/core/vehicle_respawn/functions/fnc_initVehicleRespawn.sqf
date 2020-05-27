#include "script_component.hpp"

/*
    Author:
        Fredrik Eriksson

    Description:
        Init the vehicle respawn

    Arguments:
        0: OBJECT - Vehicle to be monitored for respawn
        1: SCALAR - Respawn delay in seconds (default: 5)
        2: CODE - Initialization for vehicle (to refer the vehicle use: _this)
        3: SCALAR - Respawn Limit. Number of lives a vehicle has (default: -1)
        4: BOOLEAN - Deletes wreck on respawn. Wrecks within 100m of respawn point is automatically deleted, regardless of setting (default: false)
        5: BOOLEAN - Use custom loadout, saves inventory and loads it on respawn (default: true)
        6: BOOLEAN - Custom paintjob. Saves the current paint on the vehicle and applies it on respawn (default: true)

    Example:
        [this, 30, {_this allowDamage false;}, 3, false, true, true] call MF_vehicle_respawn_fnc_initVehicleRespawn

    Returns:
        void
*/

if (!isServer) exitWith {};

private ["_inventory", "_paint", "_parts", "_vehicleData"];

params [
    ["_vehicle", objNull, [objNull]],
    ["_delay", 5, [0]],
    ["_init", {}, [{}]],
    ["_respawnLimit", -1, [0]],
    ["_deleteWreck", false, [false]],
    ["_loadout", true, [true]],
    ["_savePaint", true, [true]]
];

_limitEnabled = false;
if (_respawnLimit != -1) then {
    SETPVAR(_vehicle,GVAR(respawnLimit),_respawnLimit);
    _limitEnabled = true;
};

_inventory = [];
if (_loadout) then {
    _items = getItemCargo _vehicle;
    _magazines = getMagazineCargo _vehicle;
    _weapons = getWeaponCargo _vehicle;
    _backpacks = getBackpackCargo _vehicle;
    _inventory = [_items, _magazines, _weapons, _backpacks];
};

_paint = "";
_parts = [];
if (_savePaint) then {
    _customization = [_vehicle] call BFUNC(getVehicleCustomization);
    _paint = (_customization#0)#0;
    _parts = _customization#1;
};

_vehicleData = [
    _delay, _init, _loadout, vehicleVarName _vehicle, getPosASL _vehicle,
    getDir _vehicle, typeOf _vehicle, _inventory, _savePaint, _paint, _parts,
    _deleteWreck, _limitEnabled
];

if (isNil QGVAR(vehicleMonitor)) then {
    GVAR(totalArray) = [];
    [] call FUNC(initVehicleMonitor);
    GVAR(vehicleMonitor) = 1;
};

GVAR(totalArray) pushBack [_vehicle, _vehicleData];
