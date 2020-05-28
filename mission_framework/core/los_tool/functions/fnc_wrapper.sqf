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

//if (GVAR(IDD) == 12) then {
//    _this call CBA_fnc_execNextFrame;
//}
//else {
    //(_this select 1) call (_this select 0);
    [
        {count GVAR(executeFromDraw) == 0},
        {GVAR(executeFromDraw) = _this;},
        _this
    ] call CBA_fnc_waitUntilAndExecute;
//}
