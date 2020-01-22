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

if (!hasInterface) exitWith {};

params ["_killed", "_killer"];

if (serverCommandAvailable "#kick") then {
  systemChat format ["[FRIENDLY FIRE] %1 was killed by %2!", _killed, _killer];
};