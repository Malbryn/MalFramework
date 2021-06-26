#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Teleports the player into the MRV.

    Arguments:
        -

    Example:
        spawn MF_reinsertion_fnc_tpToMRV

    Returns:
        void
*/

if !(hasInterface) exitWith {};

private _result = ["Reinsertion - Mobile Respawn Vehicle"] call FUNC(confirmTP);

if !(_result) exitWith {};

private _mrv = GETMVAR(GVAR(mrv),objNull);

if (isNull _mrv) exitWith {
    [COMPONENT_STR, "ERROR", "MRV does not exist", true] call EFUNC(main,log);
};

if !(alive _mrv) exitWith {
    ["Warning", ["The Mobile Respawn Vehicle was destroyed!"]] call BFUNC(showNotification);
};

if (_mrv emptyPositions "cargo" == 0) exitWith {
    ["Warning", ["Target vehicle is full! Try again later."]] call BFUNC(showNotification);
};

cutText ["You are being teleported back to the AO", "BLACK OUT", 2, true];

[{
    player moveInCargo _this;

    [{
        cutText ["", "BLACK IN", 3, true];
    }, [], 1] call CFUNC(waitAndExecute);
}, _mrv, 2] call CFUNC(waitAndExecute);
