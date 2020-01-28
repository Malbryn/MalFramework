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

if (hasInterface) then {
  if (serverCommandAvailable "#kick") then {
    systemChat format ["[FRIENDLY FIRE] %1 was killed by %2!", _killed, _killer];
  };
};

// End statistics
if (isServer) then {
  _text = format ["%1 was killed by %2<br/>", _killed, _killer];
  MF_var_stat_ff pushBack _text;
};