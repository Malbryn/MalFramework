#include "script_component.hpp"

/*
    Author:
        nkenny (modified by Malbryn)

    Description:
        The AI group indentifies buildings, clears them methodically and marks them as safe
        The gorup then moves to the next building and repeats this until there's no building left

    Arguments:
        0: GROUP or OBJECT - Group to perform this task
        1: SCALAR - Range of the task

    Example:
        [this, 300] call MF_ai_scripts_fnc_taskCQB

    Returns:
        BOOLEAN
*/

params ["_group", ["_range", 50], ["_cycle", 21]];

if !(local _group) exitWith {};

if (_group isEqualType objNull) then {
    _group = group _group;
};

_group setSpeedMode "FULL";
_group setFormation "FILE";
_group enableAttack false;
_group allowFleeing 0;

{
    _x disableAI "AUTOCOMBAT";
    _x disableAI "SUPPRESSION";
    _x enableIRLasers true;
} foreach units _group;

while {{alive _x} count units _group > 0} do {
    waitUntil {
        sleep 1;
        simulationenabled leader _group;
    }; 

    _building = call FUNC(findBuilding);
    _enemy = call FUNC(findEnemy);

    if (isNull _building && {isNull _enemy}) exitWith {};

    call FUNC(act);

    sleep _cycle;
};

true
