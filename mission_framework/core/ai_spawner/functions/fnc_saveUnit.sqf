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

private _unitData = [];

_unitData pushBack (typeOf _unit);
_unitData pushBack (getPos _unit);
_unitData pushBack (getUnitLoadout _unit);
_unitData pushBack (skill _unit);
_unitData pushBack (vehicleVarName _unit);

_unitData
