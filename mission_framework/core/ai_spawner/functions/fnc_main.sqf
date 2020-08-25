#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn)

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
        8: STRING - Init string to run upon spawning. (Use "_proxyThis" where you would usually use "this" in a script or function call) (Optional, default: "")
        9: STRING - Special spawn rules, for example "FLYING" (Optional, default: "NONE")

    Example:
        [this, 400, false, objNull, "", 10, 2, 0, 0, 10, [], "NONE"] call MF_ai_spawner_fnc_main

    Returns:
        void
*/

if !(isServer) exitWith {};

waitUntil {time > 0};

params [
    "_unit",
    ["_lives", -1],
    ["_respawnDelay", 30],
    ["_cacheRadius", 0],
    ["_pauseRadius", 300],
    ["_respawnMarkers", []],
    ["_exitTrigger", objNull],
    ["_initialDelay", 0],
    ["_initString", ""],
    ["_special", "NONE"]
];

// Make sure unit is a unit and not a group (Thanks to S.Crowe)
if (typeName _unit == "GROUP") then {
    _unit = leader _unit;
};

_respawnPos = getPos _unit;
_unitSide = side _unit;
_synchronizedObjectsList = [];
_respawnPosList = [];
_respawnPosList pushBack _respawnPos;

// Add additional respawn positions where applicable
{
    _respawnPosList pushBack (getMarkerPos _x);
} forEach _respawnMarkers;

// Determine number of lives if passed an array
if (typeName _lives == "ARRAY") then {
    _minLives = _lives#0;
    _maxLives = _lives#1;
    _lives = _minLives + floor random (_maxLives - _minLives);
};

_syncs = synchronizedObjects _unit;

{
    if (_x isKindOf "EmptyDetector") then {
        _trigger = _x;
    } else {
        _synchronizedObjectsList append [_x];
    };
} forEach _syncs;

// Save unit data and delete
_groupData = [_unit] call FUNC(saveGroup);
[group _unit] call FUNC(deleteGroup);

private _firstLoop = true;

// Main loop
while {_lives != 0} do {
    sleep 1;

    // Wait for trigger activation (thanks to pritchardgsd)
    if !(isNil "_trigger") then {
        waituntil {
            sleep 1;
            (triggerActivated _trigger);
        };
    };

    if (_firstLoop && _initialDelay > 0) then {
        sleep _initialDelay;
        _firstLoop = false;
    };

    _tmpRespawnPos = selectRandom _respawnPosList;

    while {[_tmpRespawnPos, _unitSide, _pauseRadius] call FUNC(enemyInRadius)} do {
        sleep 5;
    };

    // Spawn group
    _newGroup = [_groupData, _tmpRespawnPos, _special] call FUNC(spawnGroup);
    _displayName = str _newGroup;
    _newGroup deleteGroupWhenEmpty true;

    // Initiate caching
    if (_cacheRadius != 0) then {
        [_newGroup, _cacheRadius] call FUNC(cache);
    };

    _newGroup allowfleeing 0;

    // Add synchonizations and execute init string
    _proxyThis = leader _newgroup;

    {
        _proxyThis synchronizeObjectsAdd [_x];
    } forEach _synchronizedObjectsList;
   
    call compile format [_initString];

    sleep 1;

    //Check every 5 seconds to see if group is eliminated
    waituntil {
        sleep 5;
        {alive _x} count (units _newGroup) < 1;
    };

    // Respawn delay
    if (typeName _respawnDelay == "ARRAY") then {
        _minTime = _respawnDelay#0;
        _maxTime = _respawnDelay#1;
        _tempRespawnDelay = _minTime + random (_maxTime - _minTime);

        sleep _tempRespawnDelay;
    } else {
        sleep _respawnDelay;
    };

    // Check if exit trigger has been activated
    if !(isNil "_exitTrigger") then {
        if (triggerActivated _exitTrigger) then {
            _lives = 1;
        };
    };

    _lives = _lives - 1;

    //Clean up empty group
    deleteGroup _newGroup;
};
