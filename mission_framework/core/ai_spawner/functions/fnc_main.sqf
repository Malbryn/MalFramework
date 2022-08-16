#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn), johnb43

    Description:
        Initialises the AI spawner module.

    Arguments:
        0: OBJECT or GROUP - The unit or group
        1: SCALAR - The number of respawns the unit/group has (Optional, default: -1)
        2: SCALAR - Respawn delay in seconds (Optional, default: 30)
        3: SCALAR - Cache radius in meters (Optional, default: 0)
        4: SCALAR - Radius in which enemies will pause the spawner (Optional, default: 300)
        5: ARRAY - Array of markers where the unit/group will respawn randomly (Optional, default: [])
        6: OBJECT - Exit trigger. If activated, the respawn will stop (Optional, default: objNull)
        7: SCALAR - Initial spawn delay in seconds (Optional, default: 0)
        8: STRING/CODE - Init string/code to run upon spawning. (If string: Use "_proxyThis" where you would usually use "this" in a script or function call) (If code: Use "_this" instead of "this") (If originally object/group was passed, "this" will be leader/group)(Optional, default: "")
        9: STRING - Special spawn rules, for example "FLYING" (Optional, default: "NONE")
        10: BOOLEAN - Allow infinite ammo: Ammo gets replenished when a magazine has been emptied (Optional, default: true)

        Scheduled
        _start: Code that will be evaluated once at the start when this function is called.
        Available variables:
        _group (original group)
        _unit (original group leader)

        Scheduled
        _spawning: Code that will be evaluated when the units have been respawned.
        Available variables:
        _newGroup (new group that contains respawned units)

        Scheduled
        _afterSpawningWaitUntil: Code that will be evaluated in a loop until the code returns true. This code is called after the units have been spawned in and before the the exit code
        Default: Checking every 5s if the group has been eliminated

        Unscheduled
        _exit: Code that will be evaluated at the end of one iteration
        Available variables:
        _lives

    Example:
        [this, 2, 30, 300, 150, [], objNull, 0, "", "NONE", true] spawn MF_ai_spawner_fnc_main

    Returns:
        void
*/

if !(isServer) exitWith {};

waitUntil {time > 0};

params [
    ["_unit", objNull, [objNull, grpNull]],
    ["_lives", -1, [0, []]],
    ["_delays", [30, 0], [[]]],
    ["_radius", [0, 300], []],
    ["_codes", [{}, {}, {}], [[]]],
    ["_deleteOriginalUnit", true, [false]],
    ["_respawnMarkers", [], [[]]],
    ["_special", "NONE", [""]],
    ["_unlimitedAmmo", true, [false]]
];

_delays params [
    ["_respawnDelay", 30, [0, []]],
    ["_initialDelay", 0, [0, []]]
];
_radius params [
    ["_cacheRadius", 0, [0]],
    ["_pauseRadius", 300, [0]]
];
_codes params [
    ["_start", {true}, [{}]],
    ["_beforeSpawning", {true}, [{}]],
    ["_spawning", {true}, [{}]],
    ["_afterSpawningWaitUntil", {
        sleep 5;
        {alive _x} count (units _newGroup) == 0;
    }, [{}]],
    ["_exit", false, [false]]
];

private _isGroup = _unit isEqualType grpNull;

// Make sure unit is a unit and not a group (Thanks to S.Crowe)
if (_isGroup) then {
    _unit = leader _unit;
};

private _unitSide = side _unit;
private _synchronizedObjectsList = (synchronizedObjects _unit) select {!(_x isKindOf "EmptyDetector")};
private _respawnPosList = [getPos _unit];
private _group = group _unit;

// Add additional respawn positions where applicable
{
    _respawnPosList pushBack (getMarkerPos _x);
} forEach _respawnMarkers;

// Determine number of lives if passed an array
if (_lives isEqualType []) then {
    _lives params ["_minLives", "_maxLives"];

    _lives = _minLives + floor random (_maxLives - _minLives);
};

// If random initial wai
if (_initialDelay isEqualType []) then {
    _initialDelay params ["_minDelay", "_maxDelay"];

    _initialDelay = _initialDelay + floor random (_maxDelay - _minDelay);
};

// Save unit data and delete
private _groupData = [_unit] call FUNC(saveGroup);

if (_deleteOriginalUnit) then {
    [_group] call FUNC(deleteGroup);
};

waitUntil _start;

// Main loop
while {_lives != 0} do {
    sleep 1;

    // First loop iteration wait if delay > 0
    if (_initialDelay > 0) then {
        sleep _initialDelay;
        _initialDelay = 0;
    };

    // Execute before spawning code
    waitUntil _beforeSpawning;

    _tmpRespawnPos = selectRandom _respawnPosList;

    waitUntil {
        sleep 5;
        !([_tmpRespawnPos, _unitSide, _pauseRadius] call FUNC(enemyInRadius))
    };

    // Spawn group
    _newGroup = [_groupData, _tmpRespawnPos, _special, _unlimitedAmmo] call FUNC(spawnGroup);
    _newGroup deleteGroupWhenEmpty true;

    // Initiate caching
    if (_cacheRadius != 0) then {
        [_newGroup, _cacheRadius] call FUNC(cache);
    };

    _newGroup allowFleeing 0;

    // Add synchronizations
    (leader _newGroup) synchronizeObjectsAdd _synchronizedObjectsList;

    _newGroup call _spawning;

    sleep 1;

    // Check for condition
    waitUntil _afterSpawningWaitUntil;

    // Respawn delay
    if (_respawnDelay isEqualType []) then {
        _respawnDelay params ["_minTime", "_maxTime"];

        sleep (_minTime + random (_maxTime - _minTime));
    } else {
        sleep _respawnDelay;
    };

    _lives = _lives - 1;

    // Clean up empty group
    deleteGroup _newGroup;

    // Eval exit code
    if (call _exit) exitWith {};
};
