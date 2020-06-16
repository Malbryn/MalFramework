#include "script_component.hpp"

/*
    Author:
        nkenny

    Description:
        -

    Arguments:
        -

    Example:
        -

    Returns:
        -
*/

params ["_group"];

private _shootflare = "F_20mm_Red" createvehicle ((leader _group) ModelToWorld [0,0,200]);
_shootflare setVelocity [0,0,-10];
