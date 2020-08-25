#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn)

    Description:
        Caches a group if no players are within a certain radius.

    Arguments:
        -

    Example:
        [myGroup, 300] call MF_ai_spawner_fnc_cache

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_group", "_radius"];

SETVAR(_group,GVAR(isCached));

while {{alive _x} count (units _group) > 0} do {
    sleep 5;

    if ([getPos (leader _group), _radius] call FUNC(playerInRadius)) then {
        if (GETVAR(_group,GVAR(isCached),false)) then {
            {
                (vehicle _x) hideObjectGlobal false;
                _x enableSimulationGlobal true;
            } forEach units _group;
            
            SETVAR(_group,GVAR(isCached),false);
        };
    } else {
        if (!(GETVAR(_group,GVAR(isCached),false))) then {
            {
                (vehicle _x) hideObjectGlobal true;
                _x enableSimulationGlobal false;
            } forEach units _group;
            
            SETVAR(_group,GVAR(isCached),true);
        };
    };
};
