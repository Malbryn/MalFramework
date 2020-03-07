/*
 * Author:
 * NeilZar
 *
 * Description:
 * Sends a notification to the logged-in admin when FF happens
 *
 * Arguments:
 * _this select 0: OBJECT - Name of the player who was killed
 * _this select 1: OBJECT - Name of the player who was the killer
 *
 * Return Value:
 * void
 *
 * Example:
 * [player1, player2] call MF_fnc_friendlyFireMessage
 *
 */

params ["_killed", "_killer"];

if (hasInterface && serverCommandAvailable "#kick") then {
    systemChat format ["[MF WARNING] %1 was killed by %2!", _killed, _killer];
};

// End mission statistics
if (isServer) then {
    _time = ceil (CBA_missionTime / 60);
    _text = format ["Minute %1  :  %2 was killed by %3 <br/ >", _time, _killed, _killer];
    MF_var_stat_ff pushBack _text;
};