#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn)

    Description:
        Applies waypoint data.

    Arguments:
        -

    Example:
        call MF_ai_spawner_fnc_applyWaypoint

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_newGroup", "_waypointList"];

if (!(_waypointList isEqualTo [])) then {
    for "_waypointIndex" from 1 to (count (_waypointList) - 1) do {
        _currentWaypoint = _waypointList select _waypointIndex;

        _newWaypoint = _newGroup addWaypoint [(_currentWaypoint#0), _waypointIndex];

        _newWaypoint setwaypointBehaviour (_currentWaypoint#1);
        _newWaypoint setwaypointCombatMode (_currentWaypoint#2);
        _newWaypoint setwaypointCompletionRadius (_currentWaypoint#3);
        _newWaypoint setwaypointFormation (_currentWaypoint#4);
        _newWaypoint setwaypointScript (_currentWaypoint#5);
        _newWaypoint setwaypointSpeed (_currentWaypoint#6);
        _newWaypoint setwaypointStatements (_currentWaypoint#7);
        _newWaypoint setwaypointTimeout (_currentWaypoint#8);
        _newWaypoint setwaypointType (_currentWaypoint#9);
    };
};
