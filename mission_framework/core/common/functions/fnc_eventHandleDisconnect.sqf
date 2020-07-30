#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds an eventhandler that sets the side respawn tickets when a player disconnects.

    Arguments:
        -

    Example:
        call MF_comnon_fnc_eventHandleDisconnect

    Returns:
        -
*/

if !(isServer) exitWith {};

addMissionEventHandler ["HandleDisconnect", {
    params ["_unit", "_id", "_uid", "_name"];

    [QGVAR(sideValueSet), [side _unit, -1, -1, 0]] call CFUNC(localEvent);
    
    false
}];
