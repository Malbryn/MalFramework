#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Sets the player's respawn tickets.

    Arguments:
        0: OBJECT - Unit (Optional, default: player)
        1: SCALAR - Number of respawn tickets (Optional, default: GVARMAIN(respawnTickets))

    Example:
        [player, 3] call MF_respawn_tickets_fnc_setRespawnTickets

    Returns:
        void
*/

params [["_unit", player], ["_amount", GVARMAIN(respawnTickets)]];

SETPVAR(_unit,GVAR(amount),_amount);
