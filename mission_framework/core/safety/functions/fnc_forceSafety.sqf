#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Puts the player's weapon away.

    Arguments:
        -

    Example:
        call MF_safety_fnc_forceSafety

    Returns:
        void
*/

if !(hasInterface) exitWith {};

player action ["SWITCHWEAPON", player, player, -1];
