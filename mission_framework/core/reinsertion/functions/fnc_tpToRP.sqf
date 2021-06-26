#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Teleports the player to their squad's rally point.

    Arguments:
        -

    Example:
        spawn MF_reinsertion_fnc_tpToRP

    Returns:
        void
*/

if !(hasInterface) exitWith {};

private _result = ["Reinsertion - Squad Rally Point"] call FUNC(confirmTP);

if !(_result) exitWith {};

private _id = GETVAR((group player),GVAR(RPTent),nil);

if (isNil "_id") exitWith {
    ["Warning", ["Your squad RP is not deployed at this time, please stand by"]] call BFUNC(showNotification);

    private _notify = ((units group player) select { GETVAR(_x,EGVAR(player,isSL),false) }) - [player];

    [QGVARMAIN(notification_2), ["Info", "A squad member is waiting for the RP to be deployed"], _notify] call CFUNC(targetEvent);
};

private _RPTent = objectFromNetId _id;

cutText ["You are being teleported to your squad's Rally Point", "BLACK OUT", 2, true];

[{
    player setPos [(getPos _this)#0, ((getPos _this)#1) - 4, (getPos _this)#2];
    player setDir 0;

    [{
        cutText ["", "BLACK IN", 3, true];
    }, [], 1] call CFUNC(waitAndExecute);
}, _RPTent, 2] call CFUNC(waitAndExecute);
