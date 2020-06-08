#include "script_component.hpp"

/*
    Author:
        nkenny (modified by Malbryn)

    Description:
        Slower, more deliberate tracking and attacking script, spawns flares to coordinate

    Arguments:
        0: GROUP or OBJECT - Group to perform this task
        1: SCALAR - Range of the task

    Example:
        [this, 300] spawn MF_ai_scripts_fnc_taskHunt

    Returns:
        BOOLEAN
*/

params ["_group",["_range",500],["_cycle",60 + random 30]];

if (!local _group) exitWith {};

if (_group isEqualType objNull) then {_group = group _group;};

_group setbehaviour "SAFE";
_group setSpeedMode "LIMITED";

while {{alive _x} count units _group > 0} do {

    waitUntil {
        sleep 1;
        simulationenabled leader _group
    };

    _combat = behaviour leader _group isEqualTo "COMBAT";
    _onFoot = (isNull objectParent (leader _group));

    _target = [_group] call FUNC(findTarget);

    if (!isNull _target) then {
        _group move (_target getPos [random 100,random 360]);
        _group setFormDir (leader _group getDir _target);
        _group setSpeedMode "NORMAL";
        _group enableGunLights "forceOn"; 
        _group enableIRLasers true;
        
        if (!_combat && {_onFoot} && {random 1 > 0.8}) then {
            [_group] call FUNC(flare);
        };
        
        if (_combat && {(nearestBuilding _target distance2d _target < 25)}) then {
            [_group, _target] call FUNC(suppress);
        };
    };

    sleep _cycle;
};
