#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Spawns an aircraft to do a fly-by then despawns it.

    Arguments:
        0: STRING - Class name of the aircraft
        1: ARRAY - Starting position of the aircraft (note: 3rd coordinate is the altitude of the aircraft)
        2: ARRAY - First waypoint position
        3: ARRAY - Second waypoint position

    Example:
        ["B_Plane_CAS_01_dynamicLoadout_F", [7003.45, 4978.28, 100], [7161.55,2043.53,0], [4004.47,2028.71,0]] call MF_flyby_fnc_doFlyby

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_type", "_startPos", "_wp1Pos", "_wp2Pos"];

private _aircraft = createVehicle [_type, _startPos, [], 0, "FLY"];
createVehicleCrew _aircraft;

group _aircraft setCombatMode "BLUE";
group _aircraft setBehaviour "CARELESS";

private _wp1 = group _aircraft addWaypoint [_wp1Pos, 5];
_wp1 setWaypointType "MOVE";

private _wp2 = group _aircraft addWaypoint [_wp2Pos, 5];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointStatements ["true", QUOTE(
    private _aircraft = vehicle this;
    deleteVehicle (vehicle _aircraft);
    thisList apply {deleteVehicle _x};
)];

[COMPONENT_STR, "DEBUG", "Flyby is on the way", true, 0] call EFUNC(main,log);
