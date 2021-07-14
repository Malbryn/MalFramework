#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds the option to change the loadout and take (one of) the alternative one.

    Arguments:
        0: OBJECT - The object that the player can interact with

    Example:
        [this] call MF_gear_fnc_addAlternativeLoadouts

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params ["_object"];

// Add ACE interaction menu
