#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Sets a vehicle as a Mobile Respawn Vehicle.

    Arguments:
        0: OBJECT - Vehicle that should become a MRV

    Example:
        [hqVic] call MF_reinsertion_fnc_setMRV

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_vehicle"];

SETPMVAR(GVAR(mrv),_vehicle);
