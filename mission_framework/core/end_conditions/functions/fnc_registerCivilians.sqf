#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Registers the civilians to be monitored by the end condition check script.

    Arguments:
        -

    Example:
        call MF_end_conditions_fnc_registerCivilians

    Returns:
        void
*/

if !(isServer) exitWith {};

// Register the civilians
if (GVARMAIN(moduleCivilianCasualties)) then {
    GVAR(civs) = [];

    allUnits apply {
        if ((side _x) == civilian) then {
            PUSH(GVAR(civs),_x);
        };
    };
};
