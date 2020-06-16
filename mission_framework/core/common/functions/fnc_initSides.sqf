#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Initialises the player sides in a TvT.

    Arguments:
        -

    Example:
        call MF_common_fnc_initSides

    Returns:
        -
*/

if !(isServer) exitWith {};

private _total = 0;
private _current = 0;
private _tickets = 0;

// BLUFOR
_total = west countSide allUnits;
_current = _total;
_tickets = GVARMAIN(respawnTicketsBlufor);

GVAR(sideBlufor) = [_total, _current, _tickets];
publicVariable QGVAR(sideBlufor);

// REDFOR
_total = east countSide allUnits;
_current = _total;
_tickets = GVARMAIN(respawnTicketsRedfor);

GVAR(sideRedfor) = [_total, _current, _tickets];
publicVariable QGVAR(sideRedfor);
