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

_mrv = missionNamespace getVariable "MF_var_mrv";

cutText ["You are being reinserted back to the AO", "BLACKOUT", 2, true];
uiSleep 4;
player moveInCargo _mrv;
cutText ["", "BLACK IN", 3, true];