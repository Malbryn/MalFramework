#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn)

    Description:
        Gives an AI unit unlimited ammo.

    Arguments:
        0: OBJECT - Unit

    Example:
        [unit] call MF_ai_spawner_fnc_unlimitedAmmo

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_unit"];

_unit addEventHandler ["Reloaded", {
    params ["_unit", "_weapon", "_muzzle", "_newmag", "_oldmag"];

    private _ammoCount = _oldmag#1;
    private _magazineClass = _oldmag#0;

    if (_ammoCount == 0 && {_magazineClass isNotEqualTo ""}) then {
        _unit addMagazine _magazineClass;
    };
}];
