/*
 * Author:
 * Malbryn
 *
 * Description:
 * Sets the player's respawn tickets
 *
 * Arguments:
 * _this select 0: OBJECT - Unit (Optional, default: player)
 * _this select 1: SCALAR - Number of respawn tickets (Optional, default: MF_var_respawn_tickets)
 *
 * Return Value:
 * void
 *
 * Example:
 * [player, 3] call MF_fnc_setRespawnTickets
 *
 */

params [["_unit", player], ["_amount", MF_var_respawn_tickets]];

_unit setVariable ["MF_tickets", _amount, true];