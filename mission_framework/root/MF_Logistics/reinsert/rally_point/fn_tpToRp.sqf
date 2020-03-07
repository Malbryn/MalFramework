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

_coord = (leader player) getVariable "rpPos";

if (isNil "_coord") exitWith {
    ["Warning", ["TP destination does not exist"]] call BIS_fnc_showNotification
};

cutText ["You are being teleported to your squad's Rally Point", "BLACK OUT", 2, true];
uiSleep 2;
player setPos _coord;
uiSleep 1;
cutText ["", "BLACK IN", 3, true];
