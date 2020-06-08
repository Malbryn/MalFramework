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

// A or M
if (!GVAR(aborted) && ((_this select 1) == 30 || (_this select 1) == 50)) then {
    GVAR(aborted) = true; //protection from user holding button
    if (GVAR(generating)) then {
        systemchat "LOS Tool aborting";
    }
    else {
        if (GVAR(running)) then {
            QGVAR(ID1) call FUNC(terminateEarly);
            QGVAR(ID2) call FUNC(terminateEarly);
            QGVAR(ID3) call FUNC(terminateEarly);
        };
    };
};
