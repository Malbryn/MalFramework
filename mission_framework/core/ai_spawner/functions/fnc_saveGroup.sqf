#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn)

    Description:
        Saves group data.

    Arguments:
        0: OBJECT or GROUP - The unit/group to save

    Example:
        [myGroup] call MF_ai_spawner_fnc_saveGroup

    Returns:
        ARRAY
*/

if !(isServer) exitWith {};

params ["_unit"];

// Make sure unit is a unit and not a group (thanks to S.Crowe)
if (typeName _unit == "GROUP") then {
    _unit = leader _unit;
};

_groupData = [];
_infantryData = [];
_vehicleData = [];
_vehicles = [];
_waypoints = [];

// Save group data
_unitSide = side _unit;
_unitGroup = (group _unit);
_unitsInGroup = units _unitGroup;

//Save waypoint data
_waypoints = [_unitGroup] call FUNC(saveWaypoints);

// Freeze units
{
    _x disableAI "ALL";
    _x enableSimulationGlobal false;
    (vehicle _x) enableSimulationGlobal false;
} forEach _unitsInGroup;

{	
    if ( (vehicle _x) == _x) then {
        _infantryData pushBack ([_x] call FUNC(saveUnit));
    } else {
        // Normal vehicles have drivers
        if (driver (vehicle _x) == _x) then {
            _vehicleData pushBack ([vehicle _x] call FUNC(saveVehicle));
        } else {
            // Static weapons have gunners
            if ((gunner (vehicle _x) == _x) && ((vehicle _x) isKindOf "StaticWeapon")) then {
                _vehicleData pushBack ([vehicle _x] call FUNC(saveVehicle));
            };
        };
    };
} forEach _unitsInGroup;

_groupData = [_unitSide, _vehicleData, _infantryData, _waypoints];

_groupData
