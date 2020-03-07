/*
 * Author:
 * Malbryn
 *
 * Description:
 * Displays the remaining mission time if there's a time limit set
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] call MF_fnc_checkTimeLimit
 *
 */

if (hasInterface && MF_var_end_time_enabled) then {
    private _time = ceil((MF_var_end_time_limit - CBA_missionTime) / 60);
    [format ["Remaining time:<br/>%1 minutes", _time], 2, ace_player, 12] call ace_common_fnc_displayTextStructured;
};