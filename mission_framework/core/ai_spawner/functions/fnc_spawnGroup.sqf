#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn)

    Description:
        Spawns group.

    Arguments:
        0: ARRAY - Group data
        1: ARRAY - Spawn position
        2: STRING - Special spawn rules
        4: BOOLEAN - Give the unit infinite ammo.

    Example:
        [[...], [0, 0, 0], "FLYING"] call MF_ai_spawner_fnc_spawnGroup

    Returns:
        GROUP
*/

if !(isServer) exitWith {};

params ["_groupData", "_spawnPos", "_special", "_unlimitedAmmo"];
_groupData params ["_unitSide", "_vehicleData", "_infantryData", "_waypoints"];

private _newGroup = createGroup _unitSide;
waitUntil {!isNull _newGroup};

private _relativePos = [];
private _newVehiclePosition = [];
private _newVehicle = objNull;

{
    _relativePos = (_x#1) vectorDiff (_vehicleData#0#1);
    _newVehiclePosition = _spawnPos vectorAdd _relativePos;
    _newVehicle = [_x, _newGroup, _newVehiclePosition, _special, _unlimitedAmmo] call FUNC(spawnVehicle);
    waitUntil {alive _newVehicle};
} forEach _vehicleData;

{
    if (_vehicleData isEqualTo []) then {
        _relativePos = (_x#1) vectorDiff (_infantryData#0#1);
    } else {
        _relativePos = (_x#1) vectorDiff (_vehicleData#0#1);
    };

    _newUnitPosition = _spawnPos vectorAdd _relativePos;
    [_x, _newGroup, _newUnitPosition, _unlimitedAmmo] call FUNC(spawnUnit);
} forEach _infantryData;

// Apply waypoints
[_newGroup, _waypoints] call FUNC(applyWaypoints);

_newGroup
