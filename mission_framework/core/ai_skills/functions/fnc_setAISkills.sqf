#include "script_component.hpp"

/*
    Author:
        joko // Jonas (modified by Malbryn)

    Description:
        Set the AI skills

    Arguments:
        0: OBJECT - The selected AI unit

    Example:
        [bob] call MF_ai_skills_fnc_setAISkills

    Returns:
        void
*/

params ["_unit"];

_unit = _unit#0;

// If the unit is not local or is a player, then exit
if (!local _unit || isPlayer _unit) exitWith {};

_skill = GVAR(skillSet);

// Set the sub-skills
_unit setSkill ["general", _skill#0];
_unit setSkill ["commanding", _skill#1];
_unit setSkill ["courage", _skill#2];
_unit setSkill ["aimingAccuracy", _skill#3];
_unit setSkill ["aimingShake", _skill#4];
_unit setSkill ["aimingSpeed", _skill#5];
_unit setSkill ["reloadSpeed", _skill#6];
_unit setSkill ["spotDistance", _skill#7];
_unit setSkill ["spotTime", _skill#8];
