/*
 * Author:
 * Malbryn
 *
 * Description:
 * Sets up the player entity
 *
 * Arguments:
 * _this select 0: OBJECT - The unit (Optional, default: player)
 * _this select 1: STRING - Role of the unit, see: gear script
 * _this select 2: BOOLEAN - True if the unit is a command element (the CO can end the mission and/or call in supply drops)
 *                           (Optional, default: false)
 * _this select 3: STRING - Assigned fireteam colour (Optional, default: white (= "MAIN"))
 *
 * Return Value:
 * void
 *
 * Example:
 * [this, "PLTHQ", true, "YELLOW"] spawn MF_fnc_initPlayer
 *
 */

if (!hasInterface) exitWith {};

params [["_unit", player], "_role", ["_isCO", false], ["_colour", "MAIN"]];

// Fixing locality issues
waitUntil {!isNull _unit};
if (!local _unit) exitWith {};


// Gear script
[_unit, _role] call MF_fnc_setGear;


// Command element (can call retreat and call in supply drops)
[_unit, _isCO] call MF_fnc_assignCO;


// Assign team colour
_unit assignTeam _colour;


if ((roleDescription _unit) find "Medic" >= 0) then {
    _unit setVariable ["ACE_medical_medicClass", 1, true];
} else {
    _unit setVariable ["ACE_medical_medicClass", 0, true];
};

if ((roleDescription _unit) find "Pilot" >= 0) then {
    _unit setVariable ["ACE_GForceCoef", 0.5];
} else {
    _unit setVariable ["ACE_GForceCoef", 1.0];
};


// Assign group leader rally point menu
if ((leader group _unit) == _unit) then {
    [] call MF_fnc_addRpMenu;
};