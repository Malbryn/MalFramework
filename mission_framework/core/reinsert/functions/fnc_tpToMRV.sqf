#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Teleport the player into the MRV

    Arguments:
        -

    Example:
        call MF_reinsert_fnc_tpToMRV

    Returns:
        void
*/

if (!hasInterface) exitWith {};

private ["_mrv"];

_mrv = GETMVAR(GVAR(mrv),objNull);

if (isNull _mrv) exitWith {
    MSG("ERROR","MRV does not exist!");
};

if !(alive _mrv) exitWith {
    ["Warning", ["The Mobile Respawn Vehicle was destroyed!"]] call BFUNC(showNotification);
};

if (_mrv emptyPositions "cargo" == 0) exitWith {
    ["Warning", ["Target vehicle is full!"]] call BFUNC(showNotification);
};


cutText ["You are being paradropped into the AO", "BLACK OUT", 2, true];

[{
    player moveInCargo _this;

    [{
        cutText ["", "BLACK IN", 3, true];
    }, [], 1] call CFUNC(waitAndExecute);
}, _mrv, 2] call CFUNC(waitAndExecute);
