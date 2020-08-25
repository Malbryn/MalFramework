#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn)

    Description:
        Detects if player is within a given radius.

    Arguments:
        -

    Example:
        call MF_ai_spawner_fnc_playerInRadius

    Returns:
        BOOLEAN
*/

if !(isServer) exitWith {};

params ["_position", "_radius"];

private _returnValue = false;

if ((player distance2D _position) < _radius) then {
    _returnValue = true;
};

{
    if ((_x distance2D _position) < _radius) exitWith {
        _returnValue = true;
    };
} forEach playableUnits;

_returnValue;
