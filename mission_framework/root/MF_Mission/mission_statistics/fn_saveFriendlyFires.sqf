/*
 * Author:
 * Malbryn
 *
 * Description:
 * Converts and saves the friendly fire incidents in a global variable
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] call MF_fnc_saveFriendlyFires
 *
 */

private _text = MF_var_stat_ff joinString "<br/>";
missionNamespace setVariable ["MF_var_stat_ff", _text, true];