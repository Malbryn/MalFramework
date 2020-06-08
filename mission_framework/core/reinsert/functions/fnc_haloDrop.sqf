#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Teleport the player to their death location using HALO drop

    Arguments:
        -

    Example:
        call MF_reinsert_fnc_haloDrop

    Returns:
        void
*/

if !(hasInterface) exitWith {};

private ["_pos"];

_pos = (GETVAR(player,GVAR(deathPos),""));

if (_pos isEqualTo "") exitWith {
    ["Warning", ["Target destination does not exist!"]] call BFUNC(showNotification);
};

cutText ["You are being paradropped into the AO", "BLACK OUT", 2, true];

[{
    player setPos _this;
    player setPosATL [(getposATL player)#0, (getpos player)#1, 1500];
    [player] call FUNC(addParachute);

    [{
        cutText ["", "BLACK IN", 3, true];
    }, [], 1] call CFUNC(waitAndExecute);
}, _pos, 2] call CFUNC(waitAndExecute);
