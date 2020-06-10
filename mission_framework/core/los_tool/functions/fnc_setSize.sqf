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

params ["_middle", "_edge"];
GVAR(targetSize) = _middle distance2D _edge;
