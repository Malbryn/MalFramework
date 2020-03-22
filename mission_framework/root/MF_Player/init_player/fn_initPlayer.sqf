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
 * _this select 2: BOOLEAN - True if the unit is a command element (the CO can end the mission and/or call in supply drops)
 *                           (Optional, default: false)
 * _this select 3: STRING - Assigned fireteam colour (Optional, default: white (= "MAIN"))
 *
 * Return Value:
 * void
 *
 * Example:
 * [this, "PLTHQ", true, "YELLOW"] call MF_fnc_initPlayer
 *
 */

params ["_unit", "_role", ["_isCO", false], ["_colour", "MAIN"]];

diag_log format ["[MF LOG] Initialising unit: %1 (Local: %2)", _unit, local _unit];

// Fixing locality issues
if !(local _unit) exitWith {};


// Gear script
[_unit, _role] call MF_fnc_setGear;


// Command element (can call retreat, call respawn and call in supply drops)
if (_isCO) then {
    [_unit, _isCO] call MF_fnc_assignCO;
};


// Assign team colour
_unit assignTeam _colour;


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
