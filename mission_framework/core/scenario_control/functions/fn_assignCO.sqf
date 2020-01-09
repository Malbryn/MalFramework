/*
 * Author:
 * Malbryn
 *
 * Description:
 * Assigns a unit as a command element meaning that the unit will be able to end the mission
 *
 * Arguments:
 * _this select 0: OBJECT - The unit to assign as CO
 * _this select 1: BOOLEAN - The unit is CO, set it to false to remove CO status (default: true)
 *
 * Return Value:
 * void
 *
 * Example:
 * [] call MF_fnc_assignCO
 *
 */

params ["_unit", ["_check", true]];

_unit setVariable ["MF_var_is_CO", _check];
