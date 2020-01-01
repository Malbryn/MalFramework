/*
 * Author:
 * Malbryn
 *
 * Description:
 * Starts other scripts to remove the unit's current gear and
 * then applies a custom loadout
 *
 * Arguments:
 * _this select 0: OBJECT - Unit
 * _this select 1: STRING - Role of the unit
 *
 * Return Value:
 * void
 *
 * Example:
 * [this, "SL"] call MF_fnc_gearCore;
 *
 */

params ["_unit", "_role"];

// Remove all gear before applying the loadout
_unit call MF_fnc_removeAllGear;

// Find the role of the unit
_gear = [_role] call MF_fnc_selectGear;

// Apply the selected loadout
[_unit, _gear] call MF_fnc_applyGear;
