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
 * _this select 2: BOOLEAN - True if the unit is a command element (the CO can end the mission and/or call in supply drops)
 *                           (Optional, default: false)
 * _this select 3: STRING - Assigned fireteam colour (Optional, default: white (= "MAIN"))
 *
 * Return Value:
 * void
 *
 * Example:
 * [this, "PLTHQ", true, "YELLOW"] execVM "mission_framework\root\MF_Player\init_player\initPlayer.sqf"
 *
 */

if (!hasInterface) exitWith {};

params ["_unit", "_role", ["_isCO", false], ["_colour", "MAIN"]];

// Fixing locality issues
if (!local _unit) exitWith {};

// Gear script
[_unit, _role] execVM "mission_framework\root\MF_Player\gear\gearCore.sqf";


// Command element = can end the mission and/or call in supply drops
[_unit, _isCO] execVM "mission_framework\root\MF_Player\init_player\assignCO.sqf";


// Assign team colour
_unit assignTeam _colour;


// ACE player role variables
//_unit setVariable ["ACE_isEngineer", 1, true];

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
  [] execVM "mission_framework\root\MF_Logistics\reinsert\rally_point\addRpMenu.sqf";
};
