/*
 * Author:
 * Malbryn
 *
 * Description:
 * Adds a mission eventhandler that monitors the killer of the civilian unit
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] execVM "mission_framework\root\MF_Mission\mission_statistics\addCivilianKillEH.sqf"
 *
 */

MF_var_civ_cas = 0;

// The eventhandler only counts the civilian casualties only if it was caused by the player side
addMissionEventHandler ["EntityKilled", {
    params ["_unit", "_killer", "_triggerMan"];

    if ((side group _unit == civilian) && (side _killer == playerSide)) then {
		// Increment the number of the civilian casualties
		MF_var_civ_cas = MF_var_civ_cas + 1;

		// Log the name of the killer
		_time = ceil (CBA_missionTime / 60);
		_text = format ["Minute %1  :  A civilian was killed by %2 <br/ >", _time, name _killer];
		MF_var_stat_ck pushBack _text;
    };
}];