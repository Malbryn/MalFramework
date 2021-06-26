#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Teleports the player to the platoon HAB.

    Arguments:
        -

    Example:
        spawn MF_reinsertion_fnc_tpToHAB

    Returns:
        void
*/

if !(hasInterface) exitWith {};

private _result = ["Reinsertion - Platoon HAB"] call FUNC(confirmTP);

if !(_result) exitWith {};

private _id = GETMVAR(GVAR(HAB),nil);

if (isNil "_id") exitWith {
    ["Warning", ["The platoon HAB is not deployed at this time, please stand by"]] call BFUNC(showNotification);
};

private _HAB = objectFromNetId _id;

cutText ["You are being teleported to the platoon HAB", "BLACK OUT", 2, true];

[{
    player setPos [(getPos _this)#0, ((getPos _this)#1) - 8, (getPos _this)#2];
    player setDir 0;

    [{
        cutText ["", "BLACK IN", 3, true];
    }, [], 1] call CFUNC(waitAndExecute);
}, _HAB, 2] call CFUNC(waitAndExecute);
