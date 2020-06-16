#include "script_component.hpp"

/*
    Author:
        joko // Jonas (modified by Malbryn)

    Description:
        Sets the sub-skills of an AI unit.

    Arguments:
        0: OBJECT - The selected AI unit

    Example:
        [bob] call MF_ai_skills_fnc_setAISkills

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_unit"];

private _unit = _unit#0;

// If the unit is not local or is a player, then exit
if (!local _unit || isPlayer _unit) exitWith {};

_skills = GVAR(skillSet);

// Set the sub-skills
_unit setSkill ["general", _skills#0];
_unit setSkill ["commanding", _skills#1];
_unit setSkill ["courage", _skills#2];
_unit setSkill ["aimingAccuracy", _skills#3];
_unit setSkill ["aimingShake", _skills#4];
_unit setSkill ["aimingSpeed", _skills#5];
_unit setSkill ["reloadSpeed", _skills#6];
_unit setSkill ["spotDistance", _skills#7];
_unit setSkill ["spotTime", _skills#8];
