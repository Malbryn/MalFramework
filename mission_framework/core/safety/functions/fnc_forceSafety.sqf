#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Put the player's weapon away at mission start

    Arguments:
        -

    Example:
        call MF_safety_fnc_forceSafety

    Returns:
        void
*/

player action ["SWITCHWEAPON", player, player, -1];
