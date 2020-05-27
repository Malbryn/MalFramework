#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Set a vehicle as a Mobile Respawn Vehicle

    Arguments:
        0: OBJECT - Vehicle that should become a MRV

    Example:
        [hqVic] call MF_reinsert_fnc_setMRV

    Returns:
        void
*/

params ["_vehicle"];

SETPMVAR(GVAR(mrv),_vehicle);
