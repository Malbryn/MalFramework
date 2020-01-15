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
 * [this, "SL"] execVM "mission_framework\core\gear\gearCore.sqf"
 *
 */

params ["_unit", "_role"];

// Remove all gear before applying the loadout
_unit execVM "mission_framework\root\MF_Player\gear\removeAllGear.sqf";

// Find the role of the unit
_gear = _role call compile preprocessFileLineNumbers "mission_framework\root\MF_Player\gear\selectGear.sqf";

// Apply the selected loadout
[_unit, _gear] execVM "mission_framework\root\MF_Player\gear\applyGear.sqf";
