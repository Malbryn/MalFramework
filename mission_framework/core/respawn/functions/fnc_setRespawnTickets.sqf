#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Sets the player's respawn tickets.

    Arguments:
        0: OBJECT - The player's object
        1: SCALAR - Number of respawn tickets

    Example:
        [player, 1] call MF_respawn_fnc_setRespawnTickets

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params ["_unit", "_amount"];

SETPVAR(_unit,GVAR(playerTickets),_amount);

if (_amount == -1) exitWith {};

[format ["Respawns available:<br/>%1", _amount], 2, _unit, 12] call AFUNC(common,displayTextStructured);
