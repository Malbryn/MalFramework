#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Teleport the player to their squad's rally point

    Arguments:
        -

    Example:
        call MF_reinsert_fnc_tpToRP

    Returns:
        void
*/

private ["_id", "_notify", "_RPTent"];

if (!hasInterface) exitWith {};

if (isNil {GETVAR((group player),GVAR(RPTent),nil)}) exitWith {
    ["Warning", ["Your squad RP is not deployed at this time, please stand by"]] call BFUNC(showNotification);

    _notify = ((units group player) select { GETVAR(_x,EGVAR(player,isSL),false) }) - [player];

    [QGVARMAIN(notification_2), ["Info", "A squad member is waiting for the RP to be deployed"], _notify] call CFUNC(targetEvent);
};

_RPTent = objectFromNetId _id;

cutText ["You are being teleported to your squad's Rally Point", "BLACK OUT", 2, true];

[{
    player setPos [(getPos _RPTent)#0, ((getPos _RPTent)#1) - 4, (getPos _RPTent)#2];
    player setDir 0;

    [{
        cutText ["", "BLACK IN", 3, true];
    }, [], 1] call CFUNC(waitAndExecute);
}, _RPTent, 2] call CFUNC(waitAndExecute);
