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
 * ["MissionSuccess", true] remoteExec ["MF_fnc_endMission", 2];  -  Called on a client
 * ["MissionFail", false] call MF_fnc_endMission;  -  Called on the server
 *
 */

if (!isServer) exitWith {};

params ["_ending", "_isVictory"];

// Save end mission stats
[] call MF_fnc_saveMissionTime;
[] call MF_fnc_saveFriendlyFires;

// Calling the end mission screen
[_ending, _isVictory, true, true, true] remoteExec ["BIS_FNC_endMission", 0, true];

// Disabling damage if it's on - FIX
if (MF_var_nd_ending_enabled) then {
    [] remoteExec ["MF_fnc_noDamageEnding", 0];
};

// Remove the end mission conditions loop
[MF_EndCheck] call CBA_fnc_removePerFrameHandler;