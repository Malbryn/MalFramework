/*
 * Author:
 * Malbryn
 *
 * Description:
 * Ends the mission on every client
 *
 * Arguments:
 * _this select 0: STRING - Name of the ending (in CfgDebriefing)
 * _this select 1: BOOLEAN - Is victory
 *
 * Return Value:
 * void
 *
 * Example:
 * [] spawn MF_fnc_checkEndConditions
 *
 */

if (!isServer) exitWith {};

params ["_ending", "_isVictory"];

// Save the mission time
[] call MF_fnc_saveMissionTime;

// Disabling damage if it's on - FIX
if (MF_var_nd_ending_enabled) then {
	[] remoteExecCall ["MF_fnc_noDamageEnding", 0];
};

// Calling the end mission screen
["TimeLimit", false, true, true, true] remoteExec ["BIS_FNC_endMission", 0, true];