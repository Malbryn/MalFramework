/*
 * Author:
 * Malbryn
 *
 * Description:
 * Spawns a plane to do a flyby then despawns it
 *
 * Arguments:
 * _this select 0: STRING - Classname of the plane
 * _this select 1: ARRAY - Starting position of the plane (reminder: 3rd coordinate is the height)
 * _this select 2: SIDE - Side of the plane crew
 * _this select 3: ARRAY - First waypoint position
 * _this select 4: ARRAY - Second waypoint position
 *
 * Return Value:
 * void
 *
 * Example:
 * ["B_Plane_CAS_01_dynamicLoadout_F", [7003.45, 4978.28, 100], west, [7161.55,2043.53,0], [4004.47,2028.71,0]] spawn MF_fnc_doFlyby
 *
 */

params ["_type", "_startPos", "_side", "_wp1Pos", "_wp2Pos"];
private ["_plane", "_planePilot", "_planeCrew", "_wp1", "_wp2"];

_plane = createVehicle [_type, _startPos, [], 0, "FLY"];

_planePilot = createGroup _side;
_planePilot setCombatMode "BLUE";
_planePilot setBehaviour "CARELESS";

[_plane, _planePilot] call BIS_fnc_spawnCrew;

_planeCrew = createGroup _side;
(crew _plane) joinSilent _planeCrew;

_wp1 = _planeCrew addWaypoint [_wp1Pos, 5];
_wp1 setWaypointType "MOVE";

_wp2 = _planeCrew addWaypoint [_wp2Pos, 5];
_wp2 setWaypointType "MOVE";

sleep 145;
{deleteVehicle _x} forEach crew _plane;
deleteVehicle _plane;