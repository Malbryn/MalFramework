#include "script_component.hpp"

/*
    Author:
        Perfk & BlackHawk (modified by Malbryn)

    Description:
        Key handler for the killcam.

    Arguments:
        -

    Example:
        call MF_blank_fnc_blank

    Returns:
        void
*/

if ((_this#1) == 37) then {
    if (GVAR(toggle)) then {
        GVAR(toggle) = false;
        cutText ["", "PLAIN DOWN"];
    } else {
        GVAR(toggle) = true;
        cutText ["The lines show the LINE OF SIGHT (not the bullet trajectory) from<br/>the position of enemy to the player's position at the moment of death.", "PLAIN DOWN", -1, true, true];
    };
};
