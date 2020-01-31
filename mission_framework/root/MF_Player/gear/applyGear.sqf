/*
 * Author:
 * Malbryn
 *
 * Description:
 * Applies the selected loadout to the unit and saves it in a variable
 *
 * Arguments:
 * _this select 0: OBJECT - Unit
 * _this select 1: ARRAY - Gear exported from ACE Arsenal
 *
 * Return Value:
 * void
 *
 * Example:
 * [this, [...]] execVM "mission_framework\root\MF_Player\gear\applyGear.sqf"
 *
 */

params ["_unit", "_gear"];

// Set the loadout
_unit setUnitLoadout _gear;

// Save the current loadout
private _loadout = getUnitLoadout _unit;
player setVariable ["MF_var_current_loadout", _loadout, false];
