#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Calculates the level of protection of the target unit.

    Arguments:
        0: OBJECT - Player unit

    Example:
        [player] call MF_cbrn_fnc_getProtectionLevel

    Returns:
        SCALAR
*/

if !(hasInterface) exitWith {};

params ["_unit"];

private _level = 0;

// If the unit is inside a protected vehicle, then exit with highest value
if ((typeOf vehicle _unit) in GVAR(protectiveVehicles) && !isTurnedOut _unit) exitWith {3};

if ((goggles _unit) in GVAR(protectiveMasks)) then {
    _level = 1;

    if ((uniform _unit) in GVAR(protectiveUniforms)) then {
        _level = 2;

        if ((backpack _unit) in GVAR(protectiveBackpack)) then {
            _level = 3;
        };
    };
};

_level
