#include "script_component.hpp"

/*
    Author:
        nkenny (modified by Malbryn)

    Description:
        Unit creeps up as close as possible before opening fire.
        Stance is based on distance, speed is always limited and Hold fire for as long as possible.

    Arguments:
        0: GROUP or OBJECT - Group to perform this task
        1: SCALAR - Range of the task

    Example:
        [this, 300] spawn MF_ai_scripts_fnc_taskCreep

    Returns:
        BOOLEAN
*/

params ["_group", ["_range", 500], ["_cycle", 15]];

if (!local _group) exitWith {};

if (_group isEqualType objNull) then {_group = group _group;};

_group setbehaviour "AWARE";
_group setFormation "DIAMOND"; 
_group setSpeedMode "LIMITED";
_group setCombatMode "GREEN";
_group enableAttack false;

{
    doStop _x; 

    _x addEventhandler ["FiredNear",{
        params ["_unit"];
        doStop _x;
        _unit setCombatMode "RED";
        _unit suppressFor 4;
        group _unit enableAttack true;
        _unit removeEventHandler ["FiredNear", _thisEventHandler];
        }];
    true
} count units _group; 

while {{alive _x} count units _group > 0} do {

    waitUntil {
        sleep 1;
        simulationenabled leader _group
    }; 

    _target = [_group] call FUNC(findTarget);

    if (!isNull _target) then {
        [_group, _target] call FUNC(creepOrders);
        _cycle = 30;
    } else {
        _cycle = 120;
        _group setCombatMode "GREEN"
    };

    sleep _cycle;
};

true
