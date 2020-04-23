/*
 * Author:
 * Malbryn
 *
 * Description:
 * Teleports the player into the MRV
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] spawn MF_fnc_tpToMrv
 *
 */

if (!hasInterface) exitWith {};

_mrv = missionNamespace getVariable ["MF_var_mrv", -1];

if (!alive _mrv) exitWith {
    ["Warning", ["The Mobile Respawn Vehicle was destroyed!"]] call BIS_fnc_showNotification;
};

if (_mrv emptyPositions "cargo" == 0) exitWith {
    ["Warning", ["Target vehicle is full!"]] call BIS_fnc_showNotification;
};

cutText ["You are being reinserted to the AO", "BLACK OUT", 2, true];
uiSleep 2;
player moveInCargo _mrv;
uiSleep 1;
cutText ["", "BLACK IN", 3, true];
