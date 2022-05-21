#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Saves the player's current gear under the given role.

    Arguments:
        0: OBJECT - Player unit
        1: STRING - Role

    Example:
        [this, "CUSTOM"] call MF_gear_fnc_saveGear

    Returns:
        void
*/

params [
    ["_unit", objNull, [objNull]],
    ["_role", "", [""]]
];

// Check input
if (isNull _unit) exitWith {
    [
        COMPONENT_STR,
        "ERROR",
        "Cannot save the unit's gear because the unit is not found",
        true,
        1
    ] call EFUNC(main,log);
};

if (_role == "") exitWith {
    [
        COMPONENT_STR,
        "ERROR",
        "Cannot save the unit's gear because the role is empty",
        true,
        1
    ] call EFUNC(main,log);
};

// Get the player's gear and save it under the given role
private _gear = getUnitLoadout _unit;

SETVAR(_unit,GVAR(currentRole),_role);
SETVAR(_unit,GVAR(currentGear),_gear);
