/*
 * Author:
 * Fredrik Eriksson
 *
 * Description:
 * Init the vehicle respawn
 *
 * Arguments:
 * _this select 0: OBJECT - Vehicle to be monitored for respawn
 * _this select 1: SCALAR - Respawn delay in seconds (default: 5)
 * _this select 2: CODE - Initialization for vehicle (to call vehicle use: _this)
 * _this select 3: SCALAR - Respawn Limit. Number of lives a vehicle has (default: -1)
 * _this select 4: BOOLEAN - Deletes wreck on respawn. Wrecks within 100m of respawn point is automatically deleted, regardless of setting (default: false)
 * _this select 5: BOOLEAN - Use custom loadout, saves inventory and loads it on respawn (default: true)
 * _this select 6: BOOLEAN - Custom paintjob. Saves the current paint on the vehicle and applies it on respawn (default: true)
 *
 * Return Value:
 * void
 *
 * Example:
 * [this, 30, {_this allowDamage false;}, 3, false, true, true] call MF_fnc_initVehicleRespawn
 *
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
  _vehicle setVariable ["MF_var_VRRespawnLimit", _respawnLimit, true];
  _limitEnabled = true;
};

_inventory = [];
if _loadout then {
  _items = getItemCargo _vehicle;
  _magazines = getMagazineCargo _vehicle;
  _weapons = getWeaponCargo _vehicle;
  _backpacks = getBackpackCargo _vehicle;
  _inventory = [_items, _magazines, _weapons, _backpacks];
};

_paint = "";
_parts = [];
if _savePaint then {
  _customization = [_vehicle] call BIS_fnc_getVehicleCustomization;
  _paint = (_customization select 0) select 0;
  _parts = _customization select 1;
};

_vehicleData = [
  _delay, _init, _loadout, vehicleVarName _vehicle, getPosASL _vehicle,
  getDir _vehicle, typeOf _vehicle, _inventory, _savePaint, _paint, _parts,
  _deleteWreck, _limitEnabled
];

if (isNil "MF_var_VRMonitor") then {
  MF_var_TotalVRArray = [];
  [] spawn MF_fnc_initVehicleMonitor;
  MF_var_VRMonitor = 1;
};

MF_var_TotalVRArray pushBack [_vehicle, _vehicleData];
