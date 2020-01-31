/*
 * Author:
 * Malbryn
 *
 * Description:
 * Spawns a plane to do a fly-by then despawns it
 *
 * Arguments:
 * _this select 0: STRING - Classname of the plane
 * _this select 1: ARRAY - Starting position of the plane (reminder: 3rd coordinate is the height of the plane)
 * _this select 2: ARRAY - First waypoint position
 * _this select 3: ARRAY - Second waypoint position
 *
 * Return Value:
 * void
 *
 * Example:
 * ["B_Plane_CAS_01_dynamicLoadout_F", [7003.45, 4978.28, 100], [7161.55,2043.53,0], [4004.47,2028.71,0]] spawn MF_fnc_doFlyby
 *
 */

params ["_type", "_startPos", "_wp1Pos", "_wp2Pos"];

_plane = createVehicle [_type, _startPos, [], 0, "FLY"];
createVehicleCrew _plane;

group _plane setCombatMode "BLUE";
group _plane setBehaviour "CARELESS";

_wp1 = group _plane addWaypoint [_wp1Pos, 5];
_wp1 setWaypointType "MOVE";

_wp2 = group _plane addWaypoint [_wp2Pos, 5];
_wp2 setWaypointType "MOVE";

sleep 145;
{deleteVehicle _x} forEach crew _plane;
deleteVehicle _plane;
