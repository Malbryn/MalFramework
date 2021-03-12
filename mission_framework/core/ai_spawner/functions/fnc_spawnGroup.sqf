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

    Example:
        [[...], [0, 0, 0], "FLYING"] call MF_ai_spawner_fnc_spawnGroup

    Returns:
        GROUP
*/

if !(isServer) exitWith {};

params ["_groupData", "_spawnPos", "_special"];
_groupData params ["_unitSide", "_vehicleData", "_infantryData", "_waypoints"];

_newGroup = createGroup _unitSide;
waitUntil {!isNull _newGroup};

{
    _relativePos = (_x#1) vectorDiff (_vehicleData#0#1);
    _newVehiclePosition = _spawnPos vectorAdd _relativePos;
    _newVehicle = [_x, _newGroup, _newVehiclePosition, _special] call FUNC(spawnVehicle);
    waitUntil {alive _newVehicle};
} forEach _vehicleData;
 
{
    private "_relativePos";
        
    if (_vehicleData isEqualTo []) then {
        _relativePos = (_x#1) vectorDiff (_infantryData#0#1);
    } else {
        _relativePos = (_x#1) vectorDiff (_vehicleData#0#1);
    };
    
    _newUnitPosition = _spawnPos vectorAdd _relativePos;
    [_x, _newGroup, _newUnitPosition] call FUNC(spawnUnit);
} forEach _infantryData;

// Apply waypoints
[_newGroup, _waypoints] call FUNC(applyWaypoints);

_newGroup
