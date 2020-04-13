/*
 * Author:
 * Malbryn
 *
 * Description:
 * Converts and saves the civilian kills in a global variable
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] call MF_fnc_saveCivilianKills
 *
 */

private _text = MF_var_stat_ck joinString "<br/>";
missionNamespace setVariable ["MF_var_stat_ck", _text, true];