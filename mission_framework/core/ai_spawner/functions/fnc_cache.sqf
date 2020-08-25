#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn)

    Description:
        Caches a group if no players are within a certain radius.

    Arguments:
        -

    Example:
        call MF_ai_spawner_fnc_cache

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_group", "_radius", "_debug"];

if (_debug) then {
    systemChat format["%1 - Using Cache", _group]
};

_group setVariable ["IsCached", false];

while {{alive _x} count (units _group) > 0} do {

    sleep 5;

    if ([getPos (leader _group), _radius] call FUNC(playerInRadius)) then {
        if (GETVAR(_group,GVAR(isCached),false)) then {
            if (_debug) then {
                MSG_1("DEBUG","%1 - Uncaching group.", _group);
            };
            
            {
                (vehicle _x) hideObjectGlobal false;
                _x enableSimulationGlobal true;
            } forEach units _group;
            
            SETVAR(_group,GVAR(isCached),false);
        };
    } else {
        if (!(GETVAR(_group,GVAR(isCached),false))) then {
            if (_debug) then {
                MSG_1("DEBUG","%1 - Caching group.", _group);
            };
            
            {
                (vehicle _x) hideObjectGlobal true;
                _x enableSimulationGlobal false;
            } forEach units _group;
            
            SETVAR(_group,GVAR(isCached),true);
        };
    };
};
