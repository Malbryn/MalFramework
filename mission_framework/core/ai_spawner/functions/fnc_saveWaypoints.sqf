#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn)

    Description:
        Saves waypoint data.

    Arguments:
        0: GROUP - The group

    Example:
        [myGroup] call MF_ai_spawner_fnc_saveWaypoints

    Returns:
        ARRAY
*/

if !(isServer) exitWith {};

params ["_unitGroup"];

private _waypointList = [];
private _currentWaypoint = [];
private _waypointCount = count (waypoints _unitGroup);

if (_waypointCount > 1) then {
    for "_waypointIndex" from 1 to (_waypointCount - 1) do {
        _currentWaypoint = [];

        _currentWaypoint pushBack waypointPosition [_unitGroup, _waypointIndex];
        _currentWaypoint pushBack waypointBehaviour [_unitGroup, _waypointIndex];
        _currentWaypoint pushBack waypointCombatMode [_unitGroup, _waypointIndex];
        _currentWaypoint pushBack waypointCompletionRadius [_unitGroup, _waypointIndex];
        _currentWaypoint pushBack waypointFormation [_unitGroup, _waypointIndex];
        _currentWaypoint pushBack waypointScript [_unitGroup, _waypointIndex];
        _currentWaypoint pushBack waypointSpeed [_unitGroup, _waypointIndex];
        _currentWaypoint pushBack waypointStatements [_unitGroup, _waypointIndex];
        _currentWaypoint pushBack waypointTimeout [_unitGroup, _waypointIndex];
        _currentWaypoint pushBack waypointType [_unitGroup, _waypointIndex];

        _waypointList set [_waypointIndex, _currentWaypoint];
    };
};

_waypointList
