#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn)

    Description:
        Reduces a group if no players are within a certain radius.

    Arguments:
        -

    Example:
        call MF_ai_spawner_fnc_reduce

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_group", "_radius", "_debug"];

if (_debug) then {
    MSG_1("DEBUG","%1 - Using Reduce",_group);
};

SETVAR(_group,GVAR(isReduced),false);

while {{alive _x} count (units _group) > 0} do {
    sleep 5;
    
    _reduceableUnits = units _group - crew (vehicle (leader _group));

    //We need to make sure the leader is active
    (leader _group) hideObjectGlobal false;
    (leader _group) enableSimulationGlobal true;
            
    if ([getPos (leader _group), _radius] call FUNC(playerInRadius)) then {
        if (GETVAR(_group,GVAR(isReduced),false)) then {
            if (_debug) then {
                MSG_1("DEBUG","%1 - Rebuilding Group",_group);
            };
                            
            {
                (vehicle _x) hideObjectGlobal false;
                _x enableSimulationGlobal true;
                sleep 0.1;
                if ((vehicle _x) isEqualTo _x) then {_x setPos (getPos (leader _group));};
            } forEach _reduceableUnits;
            
            SETVAR(_group,GVAR(isReduced),false);
        };
    } else {
        if (!(GETVAR(_group,GVAR(isReduced),false))) then {
            if (_debug) then {
                MSG_1("DEBUG","%1 - Reducing Group", _group);
            };
            
            {
                (vehicle _x) hideObjectGlobal true;
                _x enableSimulationGlobal false;
            } forEach _reduceableUnits;
            
            SETVAR(_group,GVAR(isReduced),true);
        };
    };
};
