/*
 * Author:
 * Starfox64 (modified by Malbryn)
 *
 * Description:
 * Saves the mission time in a global variable
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] call MF_fnc_saveMissionTime
 *
 */

private _time = ceil (CBA_missionTime / 60);
private _timeLimit = ceil (MF_var_end_time_limit / 60);
private _text = "";

if (MF_var_end_time_enabled) then {
    _text = format ["MISSION TIME:<br/>%1 out of %2 minutes", _time, _timeLimit];
} else {
    _text = format ["MISSION TIME:<br/>%1 minutes", _time];
};

missionNamespace setVariable ["MF_var_stat_mission_time", _text, true];