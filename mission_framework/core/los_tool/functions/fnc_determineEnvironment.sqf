#include "script_component.hpp"

/*
    Author:
        BlackHawk

    Description:
        -

    Arguments:
        -

    Example:
        -

    Returns:
        void
*/

{
    if (!isNull(findDisplay _x)) exitWith {GVAR(IDD) = _x}
} forEach [12,37,52,53];
