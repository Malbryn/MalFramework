#include "script_component.hpp"

/*
    Author:
        nkenny (modified by Malbryn)

    Description:
        Aggressive tracking and attacking script

    Arguments:
        0: GROUP or OBJECT - Group to perform this task
        1: SCALAR - Range of the task

    Example:
        [this, 300] spawn MF_ai_scripts_fnc_taskRush

    Returns:
        BOOLEAN
*/
params ["_group",["_range",500],["_cycle",15]];

if (!local _group) exitWith {};

if (_group isEqualType objNull) then {_group = group _group;};

_group setSpeedMode "FULL";
_group setFormation "WEDGE";
_group enableAttack false;

{
    _x disableAI "AUTOCOMBAT";
    dostop _x;
    true
} count units _group;

while {{alive _x} count units _group > 0} do {

    waitUntil {
        sleep 1;
        simulationenabled leader _group
    };
    
    _target = [_group] call FUNC(findTarget);
    
    // act
    if (!isNull _target) then {
        [_group, _target] call FUNC(rushOrders);
        _cycle = 15;
    } else {
        _cycle = 60;
    };

    sleep _cycle;
};

true
