#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Spawn the resupply plane which then drops the supplies

    Arguments:
        0: OBJECT - Pre-placed resupply box
        1: STRING - Ingress (poss. values: "north", "east", "south", "west") (Optional, default: "north")
        2: SCALAR - Height of the plane (Optional, default: 500)
        3: ARRAY - Position of the player who called in the supplies

    Example:
        [crate1, "west", 250, getPos player] call MF_supply_drop_fnc_callSupplyDrop

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_crate", ["_dir", "north"], ["_alt", 500], "_playerPos"];
private ["_type", "_startPos", "_endPos", "_signal", "_wp1"];

_type = GVAR(supplyDropPlane);

SETPMVAR(GVAR(dropAvailable),false);
SETPVAR(_crate,GVAR(crateAvailable),false);

// Declare some variables
GVAR(plane) = objNull;
GVAR(chute) = objNull;
_startPos = [0, 0, 500];
_endPos = _playerPos;

// Calculate the spawning and drop positions
switch (_dir) do {
    case "north" : {
        _startPos = [(_playerPos#0), (_playerPos#1) + 5000, _alt];
        _endPos = [(_playerPos#0), (_playerPos#1) - 150, _alt];
    };
    case "east" : {
        _startPos = [(_playerPos#0) + 5000, (_playerPos#1), _alt];
        _endPos = [(_playerPos#0) - 150, (_playerPos#1), _alt];
    };
    case "south" : {
        _startPos = [(_playerPos#0), (_playerPos#1) - 5000, _alt];
        _endPos = [(_playerPos#0), (_playerPos#1) + 150, _alt];
    };
    case "west" : {
        _startPos = [(_playerPos#0) - 5000, (_playerPos#1), _alt];
        _endPos = [(_playerPos#0) + 150, (_playerPos#1), _alt];
    };
};

// Spawn smoke
if !(GVAR(useFlare)) then {
    _signal = "SmokeShellBlue" createVehicle _playerPos;
};

// Create the plane
GVAR(plane) = createVehicle [_type, _startPos, [], 0, "FLY"];
createVehicleCrew GVAR(plane);
group GVAR(plane) setCombatMode "BLUE";
group GVAR(plane) setBehaviour "CARELESS";

// First waypoint
_wp1 = group GVAR(plane) addWaypoint [_endPos, 20];
_wp1 setWaypointStatements ["true", QUOTE(GVAR(chute) = createVehicle [ARR_5('O_Parachute_02_F',getPos GVAR(plane),[],0,'FLY')];)];
_wp1 setWaypointType "MOVE";


[{alive GVAR(chute)}, {
    params ["_crate", "_signal", "_startPos"];
    private ["_wp2"];

    // Teleport and attach the crate to the parachute
    _crate allowDamage false;
    _crate setPos (getPos GVAR(chute));
    _crate attachTo [GVAR(chute), [0, 0, 0.5]];

    // Spawn smoke/flare
    if (GVAR(useFlare)) then {
        _signal = "F_40mm_Green" createVehicle position _crate;
    } else {
        _signal = "SmokeShellYellow" createVehicle position _crate;
    };

    _signal attachTo [_crate, [0, 0, 0.1]];

    // Second waypoint, delete plane
    _wp2 = group GVAR(plane) addWaypoint [_startPos, 20];
    _wp2 setWaypointStatements ["true", QUOTE(crew GVAR(plane) apply {deleteVehicle _x}; deleteVehicle GVAR(plane); SETPMVAR(QGVAR(dropAvailable),true);)];
    _wp2 setWaypointType "MOVE";

    [{
        params ["_crate", "_signal"];
        
        if (GVAR(useFlare)) then {
            _signal = "Chemlight_green" createVehicle position _crate;
        } else {
            _signal = "SmokeShellYellow" createVehicle position _crate;
        };

        _signal attachTo [_crate, [0, 0, 0.1]];
    }, [_crate, _signal], 45] call CFUNC(waitAndExecute);
}, [_crate, _signal, _startPos]] call CFUNC(waitUntilAndExecute);
