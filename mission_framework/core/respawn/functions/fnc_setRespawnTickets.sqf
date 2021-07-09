#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Sets the player's respawn tickets.

    Arguments:
        0: SCALAR - Number of respawn tickets (Optional, default: -1)

    Example:
        [3] call MF_respawn_fnc_setRespawnTickets

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params [["_amount", -1]];

SETPVAR(player,GVAR(tickets),_amount);

[format ["Respawns available:<br/>%1", _amount], 2, player, 12] call AFUNC(common,displayTextStructured);
