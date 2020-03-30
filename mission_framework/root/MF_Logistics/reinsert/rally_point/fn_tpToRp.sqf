/*
 * Author:
 * Malbryn
 *
 * Description:
 * Teleports the player to their squad's rally point
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] spawn MF_fnc_deployRp
 *
 */

if (!hasInterface) exitWith {};

private _id = (group player) getVariable ["RPTent", nil];

if (isNil "_id") exitWith {
    ["Warning", ["Your squad RP is not deployed at this time"]] call BIS_fnc_showNotification;
    ["Info", ["A squad member is waiting for the RP"]] remoteExec ["BIS_fnc_showNotification", leader player];
};

private _RPTent = objectFromNetId _id;

cutText ["You are being teleported to your squad's Rally Point", "BLACK OUT", 2, true];
uiSleep 2;
player setPos [getPos _RPTent select 0, (getPos _RPTent select 1) - 4, getPos _RPTent select 2];
player setDir 0;
uiSleep 1;
cutText ["", "BLACK IN", 3, true];
