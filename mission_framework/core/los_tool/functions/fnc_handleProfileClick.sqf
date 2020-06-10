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

if (count GVAR(profileStartPos) == 0) exitWith {
    GVAR(profileStartPos) = _this;
};

if (count GVAR(profileEndPos) == 0) exitWith {
    GVAR(profileEndPos) = _this;
};

if (
    (_this select 0) < (GVAR(rightUpper) select 0) &&
    (_this select 0) > (GVAR(rightUpper) select 0) - 10 &&
    (_this select 1) < (GVAR(rightUpper) select 1) &&
    (_this select 1) > (GVAR(rightUpper) select 1) - 10
) then {
    call FUNC(closeChart);
};
