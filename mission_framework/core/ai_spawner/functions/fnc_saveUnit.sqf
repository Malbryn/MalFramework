#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn)

    Description:
        Saves unit data.

    Arguments:
        0: OBJECT - Unit

    Example:
        [unit1] call MF_ai_spawner_fnc_saveUnit

    Returns:
        ARRAY
*/

if !(isServer) exitWith {};

params ["_unit"];

[typeOf _unit, getPos _unit, getUnitLoadout _unit, skill _unit, vehicleVarName _unit]
