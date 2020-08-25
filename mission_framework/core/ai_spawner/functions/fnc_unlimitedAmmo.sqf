#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn)

    Description:
        Gives an AI unit unlimited ammo.

    Arguments:
        -

    Example:
        call MF_ai_spawner_fnc_unlimitedAmmo

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_unit"];

_unit addEventHandler ["Reloaded", {
    params ["_unit", "_weapon", "_muzzle", "_newmag", "_oldmag"];
    
    _ammoCount = _oldmag#1;
    _magazineClass = _oldmag#0;
    
    if (_ammoCount < 1) then {
        if (_magazineClass isEqualTo "") exitWith {};
        _unit addMagazine _magazineClass
    };
}];
