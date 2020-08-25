#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn)

    Description:
        Unsticks an AI unit.

    Arguments:
        -

    Example:
        call MF_ai_spawner_fnc_unstick

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_unit"];

_unit setPos (player modelToWorld [0, -3, 0.5]);
_unit enableAI "ALL";
