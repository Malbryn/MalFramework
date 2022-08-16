#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn), johnb43

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

params [["_unit", objNull, [objNull, grpNull]]];

// Make sure unit is a unit and not a group (thanks to S.Crowe)
private _unitGroup = [group _unit, _unit] select (_unit isEqualType grpNull);

// Save waypoint data
private _waypoints = [_unitGroup] call FUNC(saveWaypoints);

private _vehicle = objNull;
private _infantryData = [];
private _vehicleData = [];

// Freeze units and get their info
{
    _vehicle = objectParent _x;

    _x disableAI "ALL";
    _x enableSimulationGlobal false;

    if (isNull _vehicle) then {
        _infantryData pushBack ([_x] call FUNC(saveUnit));
    } else {
        _vehicle enableSimulationGlobal false;

        // Normal vehicles have drivers
        if (driver _vehicle == _x) then {
            _vehicleData pushBack ([_vehicle] call FUNC(saveVehicle));
        } else {
            // Static weapons have gunners
            if ((gunner _vehicle == _x) && {_vehicle isKindOf "StaticWeapon"}) then {
                _vehicleData pushBack ([_vehicle] call FUNC(saveVehicle));
            };
        };
    };
} forEach (units _unit);

[side _unit, _vehicleData, _infantryData, _waypoints]
