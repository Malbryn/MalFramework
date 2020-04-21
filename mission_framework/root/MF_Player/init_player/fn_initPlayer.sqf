/*
 * Author:
 * Malbryn
 *
 * Description:
 * Sets up the player entity
 *
 * Arguments:
 * _this select 0: OBJECT - The unit
 * _this select 1: STRING - Role of the unit, see: gear script
 * _this select 2: SCALAR - Unit traits (Optional):
 *                             0 - Default, no special ability
 *                             1 - Squad level leadership (SL, FTL), can deploy Rally Poins
 *                             2 - Platoon level leadership (PLTHQ, PLTSGT), can call respawns, resupply and tactical withdrawal
 * _this select 4: STRING - Assigned fireteam colour (Optional, default: white (= "MAIN"))
 * _this select 5: SCALAR - Unit's view distance (Optional, default: -1 (default value defined in config.sqf))
 *
 * Return Value:
 * void
 *
 * Example:
 * [this, "PLTHQ", 2, "YELLOW", 2500] call MF_fnc_initPlayer
 *
 */

params ["_unit", "_role", ["_traits", 0], ["_colour", "MAIN"], ["_viewDistance", -1]];

diag_log format ["[MF LOG] Initialising unit: %1 (Local: %2)", _unit, local _unit];

// Fixing locality issues
if !(local _unit) exitWith {};


// Gear script
[_unit, _role] call MF_fnc_setGear;


// Assign player traits
[_unit, _traits] call MF_fnc_setTraits;


// Assign team colour
[_unit, _colour] spawn {
  (_this select 0) assignTeam (_this select 1);
};


// Assign view distance
_unit setVariable ["MF_var_vd", _viewDistance, true];


// ACE player variables
if ((roleDescription _unit) find "Medic" >= 0) then {
    _unit setVariable ["ACE_medical_medicClass", 1, true];
} else {
    _unit setVariable ["ACE_medical_medicClass", 0, true];
};

if ((roleDescription _unit) find "Pilot" >= 0) then {
    _unit setVariable ["ACE_GForceCoef", 0.5, true];
} else {
    _unit setVariable ["ACE_GForceCoef", 1.0, true];
};
