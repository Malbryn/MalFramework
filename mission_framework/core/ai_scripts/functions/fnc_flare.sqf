#include "script_component.hpp"

/*
    Author:
        nkenny (modified by Malbryn)

    Description:
        -

    Arguments:
        -

    Example:
        -

    Returns:
        -
*/

private ["_shootFlare"];

_shootflare = "F_20mm_Red" createvehicle ((leader _group) ModelToWorld [0,0,200]);
_shootflare setVelocity [0,0,-10];
