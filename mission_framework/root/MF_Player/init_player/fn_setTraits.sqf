/*
 * Author:
 * Malbryn
 *
 * Description:
 * Assigns special traits (command level) to a player
 *
 * Arguments:
 * _this select 0: OBJECT - The unit
 * _this select 1: INTEGER - Unit traits (Optional):
 *                             0 - Default, no special ability
 *                             1 - Squad level leadership (SL, FTL), can deploy Rally Poins
 *                             2 - Platoon level leadership (PLTHQ, PLTSGT), can call respawns, resupply and retreat
 *
 * Return Value:
 * void
 *
 * Example:
 * [this, 1] execVM "mission_framework\root\MF_Player\init_player\fn_setTraits.sqf"
 *
 */

params ["_unit", ["_traits", 0]];

switch (_traits) do {
	case 0 : {
		_unit setVariable ["MF_var_is_SL", false, true];
		_unit setVariable ["MF_var_is_CO", false, true];
	};
	case 1 : {
		_unit setVariable ["MF_var_is_SL", true, true];
		_unit setVariable ["MF_var_is_CO", false, true];
	};
	case 2 : {
		_unit setVariable ["MF_var_is_SL", true, true];
		_unit setVariable ["MF_var_is_CO", true, true];
	};
	default {
		systemChat format ["[MF ERROR] Invalid unit trait value (%1) of unit (%2)", _traits, _unit];
		diag_log format ["[MF ERROR] Invalid unit trait value (%1) of unit (%2)", _traits, _unit];
	};
};
