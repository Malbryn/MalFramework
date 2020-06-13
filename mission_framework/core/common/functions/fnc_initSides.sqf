#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        -

    Arguments:
        -

    Example:
        call MF_common_fnc_initSides

    Returns:
        -
*/

if !(isServer) exitWith {};

private ["_total", "_current", "_tickets"];

// BLUFOR
_total = west countSide allUnits;
_current = _total;
_tickets = GVARMAIN(respawnTicketsBlufor);

GVAR(sideBlufor) = [_total, _current, _tickets];


// REDFOR
_total = east countSide allUnits;
_current = _total;
_tickets = GVARMAIN(respawnTicketsRedfor);

GVAR(sideRedfor) = [_total, _current, _tickets];
