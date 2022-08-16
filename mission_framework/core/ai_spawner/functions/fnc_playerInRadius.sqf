#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn)

    Description:
        Detects if player is within a given radius.

    Arguments:
        0: ARRAY - Position to check (ATL)
        1: SCALAR - Radius of check

    Example:
        [getPosATL unit1, 150] call MF_ai_spawner_fnc_playerInRadius

    Returns:
        BOOLEAN
*/

if !(isServer) exitWith {};

params ["_position", "_radius"];

if ((player distance2D _position) < _radius) exitwith {
    true;
};

private _returnValue = false;

{
    if ((_x distance2D _position) < _radius) exitWith {
        _returnValue = true;
    };
} forEach (call CFUNC(players));

_returnValue;
