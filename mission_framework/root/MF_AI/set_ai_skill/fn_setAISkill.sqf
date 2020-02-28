/*
 * Author:
 * joko // Jonas (modified by Malbryn)
 *
 * Description:
 * Sets the AI skill globally
 *
 * Arguments:
 * _this select 0: OBJECT - The selected AI unit
 *
 * Return Value:
 * void
 *
 * Example:
 * [bob] call MF_fnc_setAISkill
 *
 */

params ["_unit"];

_unit = _unit select 0;

// If the unit is not local or is a player, then exit
if (!local _unit || isPlayer _unit) exitWith {};

// Include the sub-skills defined by the mission maker
#include "..\..\..\config\ai_skill\ai_skill.sqf"

// Set the sub-skills
_unit setSkill ["general", _skill select 0];
_unit setSkill ["commanding", _skill select 1];
_unit setSkill ["courage", _skill select 2];
_unit setSkill ["aimingAccuracy", _skill select 3];
_unit setSkill ["aimingShake", _skill select 4];
_unit setSkill ["aimingSpeed", _skill select 5];
_unit setSkill ["reloadSpeed", _skill select 6];
_unit setSkill ["spotDistance", _skill select 7];
_unit setSkill ["spotTime", _skill select 8];