/*
 * Author:
 * Malbryn
 *
 * Description:
 * Spawns the resupply plane which then drops the supplies
 *
 * Arguments:
 * _this select 0: OBJECT - Pre-placed resupply box
 * _this select 1: STRING - Ingress (poss. values: "north", "east", "south", "west") (Optional, default: "north")
 * _this select 2: SCALAR - Height of the plane (Optional, default: 500)
 * _this select 3: ARRAY - Position of the player who called in the supplies
 *
 * Return Value:
 * void
 *
 * Example:
 * [crate1, "B_Plane_CAS_01_dynamicLoadout_F", "west", 250] spawn MF_fnc_callSupplyDrop
 *
 */

if (!isServer) exitWith {};

params ["_crate", ["_dir", "north"], ["_alt", 500], "_playerPos"];

private _type = MF_var_supply_drop_plane;

missionNamespace setVariable ["MF_drop_available", false, true];
_crate setVariable ["MF_sd_available", false, true];

// Declare some variables
plane = objNull;
chute = objNull;
private _startPos = [0, 0, 500];
private _endPos = _playerPos;

// Calculate the spawning and drop positions
switch (_dir) do {
    case "north" : {
        _startPos = [(_playerPos select 0), (_playerPos select 1) + 5000, _alt];
        _endPos = [(_playerPos select 0), (_playerPos select 1) - 150, _alt];
    };
    case "east" : {
        _startPos = [(_playerPos select 0) + 5000, (_playerPos select 1), _alt];
        _endPos = [(_playerPos select 0) - 150, (_playerPos select 1), _alt];
    };
    case "south" : {
        _startPos = [(_playerPos select 0), ((_playerPos) select 1) - 5000, _alt];
        _endPos = [(_playerPos select 0), (_playerPos select 1) + 150, _alt];
    };
    case "west" : {
        _startPos = [(_playerPos select 0) - 5000, (_playerPos select 1), _alt];
        _endPos = [(_playerPos select 0) + 150, (_playerPos select 1), _alt];
    };
};

// Spawn smoke
private _signal = "SmokeShellBlue" createVehicle _playerPos;

// Create the plane
plane = createVehicle [_type, _startPos, [], 0, "FLY"];
createVehicleCrew plane;
group plane setCombatMode "BLUE";
group plane setBehaviour "CARELESS";

// First waypoint
_wp1 = group plane addWaypoint [_endPos, 20];
_wp1 setWaypointStatements ["true", "chute = createVehicle ['O_Parachute_02_F', getPos plane, [], 0, 'FLY'];"];
_wp1 setWaypointType "MOVE";

waitUntil {alive chute};

// Teleport and attach the crate to the parachute
_crate allowDamage false;
_crate setPos (getPos chute);
_crate attachTo [chute, [0, 0, 0.5]];

// Spawn smoke
_signal = "SmokeShellYellow" createVehicle position _crate;
_signal attachTo [_crate, [0, 0, 0.1]];

// Second waypoint, delete plane
_wp2 = group plane addWaypoint [_startPos, 20];
_wp2 setWaypointStatements ["true", "{deleteVehicle _x} forEach crew plane; deleteVehicle plane; missionNamespace setVariable ['MF_drop_available', true, true];"];
_wp2 setWaypointType "MOVE";

sleep 45;
_signal = "SmokeShellYellow" createVehicle position _crate;
_signal attachTo [_crate, [0, 0, 0.1]];
