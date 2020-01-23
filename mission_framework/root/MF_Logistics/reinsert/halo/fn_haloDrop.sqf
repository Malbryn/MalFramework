/*
 * Author:
 * Malbryn
 *
 * Description:
 * Teleports the player to their death location, HALO drop
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] spawn MF_fnc_haloDrop
 *
 */

if (isNil (player getVariable "MF_var_death_pos")) exitWith {
  ["Warning", ["Target destination does not exist!"]] call BIS_fnc_showNotification;
};

player setPos (player getVariable "MF_var_death_pos");

cutText ["You are being paradropped back into the AO", "BLACK OUT", 2, true];
uiSleep 4;
player setPosATL [getposATL player select 0, getpos player select 1, 1500];
[player] spawn MF_fnc_addParachute;
cutText ["", "BLACK IN", 3, true];