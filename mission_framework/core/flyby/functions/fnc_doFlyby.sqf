#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Spawns a plane to do a fly-by then despawns it

    Arguments:
        0: STRING - Classname of the plane
        1: ARRAY - Starting position of the plane (note: 3rd coordinate is the altitude of the plane)
        2: ARRAY - First waypoint position
        3: ARRAY - Second waypoint position

    Example:
        ["B_Plane_CAS_01_dynamicLoadout_F", [7003.45, 4978.28, 100], [7161.55,2043.53,0], [4004.47,2028.71,0]] call MF_flyby_fnc_doFlyby

    Returns:
        void
*/

params ["_type", "_startPos", "_wp1Pos", "_wp2Pos"];
private ["_plane", "_wp1", "_wp2"];

_plane = createVehicle [_type, _startPos, [], 0, "FLY"];
createVehicleCrew _plane;

group _plane setCombatMode "BLUE";
group _plane setBehaviour "CARELESS";

_wp1 = group _plane addWaypoint [_wp1Pos, 5];
_wp1 setWaypointType "MOVE";

_wp2 = group _plane addWaypoint [_wp2Pos, 5];
_wp2 setWaypointStatements ["true", QUOTE(deleteVehicle (vehicle this); {deleteVehicle _x} forEach crew (vehicle this);)];
_wp2 setWaypointType "MOVE";
