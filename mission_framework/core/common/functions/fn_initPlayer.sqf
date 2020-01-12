/*
 * Author:
 * Malbryn
 *
 * Description:
 * Sets up the player entity
 *
 * Arguments:
 * _this select 0: OBJECT - The player unit
 * _this select 1: STRING - Role of the unit, see: gear script
 * _this select 2: BOOLEAN - True if the unit is a command element (who can end the mission) (Optional, default: false)
 * _this select 3: STRING - Assigned fireteam colour (Optional, default: white - "MAIN")
 *
 * Return Value:
 * void
 *
 * Example:
 * [this, "PLTHQ", true, "YELLOW"] call MF_fnc_initPlayer
 *
 */

params ["_unit", "_role", ["_isCO", false], ["_colour", "MAIN"]];

// Gear script
[_unit, _role] call MF_fnc_gearCore;

// Command element = can end the mission
[_unit] call MF_fnc_assignCO;

// Assign team colour
_unit assignTeam "_colour";

// ACE player role variables
_unit setVariable ["ACE_isEngineer", 1, true];

if ((roleDescription _unit) find "Medic" >= 0) then {
    _unit setVariable ["ACE_medical_medicClass", 1, true];
} else {
    _unit setVariable ["ACE_medical_medicClass", 0, true];
};

if ((roleDescription player) find "Pilot" >= 0) then {
    _unit setVariable ["ACE_GForceCoef", 0.5];
} else {
    _unit setVariable ["ACE_GForceCoef", 1.0];
};
