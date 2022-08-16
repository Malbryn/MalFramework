#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn)

    Description:
        Applies waypoint data.

    Arguments:
        0: GROUP - New group
        1: ARRAY - Array of waypoints

    Example:
        [group, [wp1, wp2, wp3]] call MF_ai_spawner_fnc_applyWaypoint

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_newGroup", "_waypointList"];

if (_waypointList isNotEqualTo []) then {
    private _currentWaypoint = "";
    private _newWaypoint = "";

    for "_waypointIndex" from 1 to (count (_waypointList) - 1) do {
        _currentWaypoint = _waypointList select _waypointIndex;

        _newWaypoint = _newGroup addWaypoint [(_currentWaypoint#0), _waypointIndex];

        _newWaypoint setWaypointBehaviour (_currentWaypoint#1);
        _newWaypoint setWaypointCombatMode (_currentWaypoint#2);
        _newWaypoint setWaypointCompletionRadius (_currentWaypoint#3);
        _newWaypoint setWaypointFormation (_currentWaypoint#4);
        _newWaypoint setWaypointScript (_currentWaypoint#5);
        _newWaypoint setWaypointSpeed (_currentWaypoint#6);
        _newWaypoint setWaypointStatements (_currentWaypoint#7);
        _newWaypoint setWaypointTimeout (_currentWaypoint#8);
        _newWaypoint setWaypointType (_currentWaypoint#9);
    };
};
