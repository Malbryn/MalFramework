#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn)

    Description:
        -

    Arguments:
        -

    Example:
        [this, 400, false, objNull, "", 10, 2, 0, 0, 10, [], "NONE"] call MF_ai_spawner_fnc_main

    Returns:
        void
*/

if !(isServer) exitWith {};

waitUntil {time > 0};

params [
    "_unit",
    ["_cacheRadius", 0],
    ["_debug", false],
    ["_exitTrigger", objNull],
    ["_initString", ""],
    ["_initialDelay", 0],
    ["_lives", -1],
    ["_pauseRadius", 0],
    ["_reduceRadius", 0],
    ["_respawnDelay", 30],
    ["_respawnMarkers", []],
    ["_special", "NONE"]
];
 
// Make sure unit is a unit and not a group (Thanks to S.Crowe)
if (typeName _unit == "GROUP") then { _unit = leader _unit; };
 
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
    _minLives = _lives select 0;
    _maxLives = _lives select 1;
    _lives = _minLives + floor random (_maxLives - _minLives);
};
 
_syncs = synchronizedObjects _unit;
 
{
    if (_x isKindOf "EmptyDetector") then {
        _trigger = _x;
        if (_debug) then {
            MSG("DEBUG","Synchronized trigger activation present");
        };
    } else {
        _synchronizedObjectsList append [_x];
    };
} forEach _syncs;

// Save unit data and delete
_groupData =  [_unit] call FUNC(saveGroup);
[group _unit] call FUNC(deleteGroup);
 
private _firstLoop = true;
 
// Main loop
while {_lives != 0} do {
    sleep 1;
    
    // Wait for trigger activation (thanks to pritchardgsd)
    if (!isNil "_trigger") then {
        waituntil {
            if (_debug && (floor ((time % 10)) == 0)) then {
                MSG("DEBUG","Waiting for trigger activation");
            };

            sleep 1;
            (triggerActivated _trigger);
        };
    };
   
    if (_firstLoop && _initialDelay > 0) then {
        sleep _initialDelay;
        _firstLoop = false;

        if (_debug) then {
            MSG("DEBUG","First Loop!");
        };
    };

    _tmpRespawnPos = selectRandom _respawnPosList;
 
    while {[_tmpRespawnPos, _unitSide, _pauseRadius] call FUNC(enemyInRadius)} do {
        if (_debug) then {
            MSG_1("DEBUG","%1 - Enemies in pause radius",_displayName);
        };
        sleep 5;
    };
 
    // Spawn group
    _newGroup = [_groupData, _tmpRespawnPos, _special] call FUNC(spawnGroup);
    _displayName = str _newGroup;

    if (_debug) then {
        MSG_1("DEBUG","Spawning group: %1",_displayName);
    };
    
    _newGroup deleteGroupWhenEmpty true;
    
    // Initiate caching
    if (_cacheRadius != 0) then {
        [_newGroup, _cacheRadius, _debug] call FUNC(cache);
    };
   
    // Initiate reducing
    if (_reduceRadius != 0) then {
        [_newGroup, _reduceRadius, _debug] call FUNC(reduce);
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
 
    if (_debug) then {
        MSG_1("DEBUG","%1 eliminated. Waiting for respawn.",_displayName);
    };
 
    // Respawn delay
    if (typeName _respawnDelay == "ARRAY") then {
        _minTime = _respawnDelay select 0;
        _maxTime = _respawnDelay select 1;
        _tempRespawnDelay = _minTime + random (_maxTime - _minTime);

        if (_debug) then {
            MSG_1("DEBUG","Respawn delay = %1 seconds",_tempRespawnDelay)
        };

        sleep _tempRespawnDelay;
    } else {
        if (_debug) then {
            MSG_1("DEBUG","Respawn delay = %1 seconds", _respawnDelay);
        };

        sleep _respawnDelay;
    };
 
    // Check if exit trigger has been activated
    if (!isNil "_exitTrigger") then {
        if (triggerActivated _exitTrigger) then {
            if (_debug) then {
                MSG("DEBUG","Exit trigger activated");
            };

            _lives = 1;
        };
    };
 
    _lives = _lives - 1;
 
    if (_debug) then {
        if (_lives < 0) then {
            MSG("DEBUG","Infinite lives.");
        } else {
            MSG_1("DEBUG","Lives remaining = %1",_lives);
        };
    };
 
    //Clean up empty group
    deleteGroup _newGroup;
};
 
if (_debug) then {
    MSG("DEBUG","Exiting script.");
};
