#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn)

    Description:
        Detects if enemy is within a given radius (planes excluded).

    Arguments:
        0: ARRAY - Position to check
        1: SIDE - Friendly side
        2: SCALAR - Radius in meters

    Example:
        [[0, 0, 0], west, 150] call MF_ai_spawner_fnc_enemyInRadius

    Returns:
        BOOLEAN
*/

if !(isServer) exitWith {};

params ["_position", "_friendlySide", "_radius"];

private _returnValue = false;

private _nearestUnits = _position nearEntities [["Man", "LandVehicle", "Helicopter", "Ship"], _radius];

{
    if ((side _x getFriend _friendlySide) < 0.6 && {side _x != civilian}) exitwith {
        _returnValue = true;
    };
} forEach _nearestUnits;

_returnValue;
