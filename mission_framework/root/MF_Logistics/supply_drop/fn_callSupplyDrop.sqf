/*
 * Author:
 * Malbryn
 *
 * Description:
 * Spawns a plane that drops a crate in as resupply
 *
 * Arguments:
 * _this select 0: OBJECT - Pre-placed resupply box
 * _this select 1: STRING - Ingress (poss. values: "north", "east", "south", "west") (Optional, default: "north")
 * _this select 2: SCALAR - Height of the plane (Optional, default: 500)
 *
 * Return Value:
 * void
 *
 * Example:
 * [crate1, "B_Plane_CAS_01_dynamicLoadout_F", "west", 250] spawn MF_fnc_callSupplyDrop
 *
 */

if !(hasInterface) exitWith {};

params ["_crate", ["_dir", "north"], ["_alt", 500]];

_type = MF_var_supply_drop_plane;

// Declare some variables
plane = objNull;
chute = objNull;
_startPos = [0, 0, 500];
_endPos = getPos player;

// Caluclate the spawning and drop positions
switch (_dir) do {
  case "north" : { 
    _startPos = [(getPos player select 0), (getPos player select 1) + 5000, _alt];
    _endPos = [(getPos player select 0), (getPos player select 1) - 150, _alt];
  };
  case "east" : {
    _startPos = [(getPos player select 0) + 5000, (getPos player select 1), _alt];
    _endPos = [(getPos player select 0) - 150, (getPos player select 1), _alt];
  };
  case "south" : {
    _startPos = [(getPos player select 0), ((getPos player) select 1) - 5000, _alt];
    _endPos = [(getPos player select 0), (getPos player select 1) + 150, _alt];
  };
  case "west" : {
    _startPos = [(getPos player select 0) - 5000, (getPos player select 1), _alt];
    _endPos = [(getPos player select 0) + 150, (getPos player select 1), _alt];
  };
};

// Show radio message
systemChat "HQ: Supply drop is on the way. ETA 1 minute, out.";

// Spawn smoke
_signal = "SmokeShellBlue" createVehicle position player;

// Create the plane
plane = createVehicle [_type, _startPos, [], 0, "FLY"];
createVehicleCrew plane;
group plane setCombatMode "BLUE";
group plane setBehaviour "CARELESS";

// First waypoint
_wp1 = group plane addWaypoint [_endPos, 20];
_wp1 setWaypointStatements ["true", "chute = createVehicle ['parachuteWest', getPos plane, [], 0, 'FLY'];"];
_wp1 setWaypointType "MOVE";

waitUntil {alive chute};

// Teleport and attach the crate to the parachute
{_crate allowDamage false;} remoteExec ["bis_fnc_call", 2, false];
{_crate setPos (getPos chute);} remoteExec ["bis_fnc_call", 2, false];
{_crate attachTo [chute, [0, 0, -0.85]];} remoteExec ["bis_fnc_call", 2, false];

// Spawn smoke
_signal = "SmokeShellYellow" createVehicle position _crate;
_signal attachTo [_crate];

// Second waypoint, delete plane
_wp2 = group plane addWaypoint [_startPos, 20];
_wp2 setWaypointStatements ["true", "{deleteVehicle _x} forEach crew plane; deleteVehicle plane;"];
_wp2 setWaypointType "MOVE";