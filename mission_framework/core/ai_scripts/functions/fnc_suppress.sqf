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

params ["_group", "_target"];

{
    _x doSuppressiveFire ((getposASL _target) vectorAdd [random 2, random 2,0.5 + random 3]);
    true
} count units _group;
