#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Add a crate to the available supply drops crate

    Arguments:
        0: OBJECT - The object to be added to the array
        1: STRING - Name of the crate shown in the menu

    Example:
        [this, "Medical crate"] call MF_supply_drop_fnc_addCrate

    Returns:
        void
*/

params ["_crate", "_name"];
private ["_array"];

if !(isServer) exitWith {};

_array = [_crate, _name];

PUSH(GVAR(supplyCrates),_array);
publicVariable QGVAR(supplyCrates);
