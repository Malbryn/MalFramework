#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Check if any of the end conditions is true

    Arguments:
        -

    Example:
        call MF_end_conditions_fnc_checkEndConditionsCoop

    Returns:
        void
*/

scopeName QGVAR(main);

private ["_allPlayers", "_ended"];

if !(isServer) exitWith {};

_allPlayers = count allPlayers;
_ended = false;

// Time limit check
if (GVARMAIN(moduleTimeLimit) && !_ended) then {
    private ["_time"];

    _time = CBA_missionTime;
    
    if (_time > GVAR(timeLimit)) then {
        [QGVARMAIN(callMission), ["TimeLimit", false]] call CFUNC(localEvent);
        _ended = true;
    };
};


// Friendly casualty check
if (GVARMAIN(modulePlayerCasualties) && _allPlayers != 0 && !_ended) then {
    private ["_dead", "_ratio"];

    _dead = {!alive _x} count allPlayers;
    _ratio = _dead / (_allPlayers * 0.01);

    if (_ratio >= GVAR(playerCasLimit)) then {
        [QGVARMAIN(callMission), ["PlayerCasLimit", false]] call CFUNC(localEvent);
        _ended = true;
    };
};


// Civilian casualty check
if (GVARMAIN(moduleCivilianCasualties) && count GVAR(civs) != 0 && !_ended) then {
    private ["_dead", "_ratio"];

    _dead = GVAR(civCas);
    _ratio = _dead / (count GVAR(civs) * 0.01);

    if (_ratio >= GVAR(civilianCasLimit)) then {
        [QGVARMAIN(callMission), ["CivCasLimit", false]] call CFUNC(localEvent);
        _ended = true;
    };
};


// Task check
if (GVARMAIN(moduleTaskLimit) && !_ended) then {
    private ["_taskList", "_count"];

    _taskList = GVAR(tasks);
    _count = 0;

    _taskList apply {
        _taskState = [_x] call BFUNC(taskState);

        if (_taskState == "SUCCEEDED") then {
            _count = _count + 1
        };
    };

    if (_count >= GVAR(taskLimit)) then {
        [QGVARMAIN(callMission), ["MissionSuccess", true]] call CFUNC(localEvent);
        _ended = true;
    };
};


// Extraction check
if (GVARMAIN(moduleExtraction) && !_ended) then {
    private ["_taskList", "_taskCount", "_playerCount"];

    // Count the rate of the not successful tasks
    _taskList = GVAR(tasks);
    _taskCount = 0;

    _taskList apply {
        private ["_state"];

        _state = _x call BFUNC(taskState);

        if (_state == "SUCCEEDED") then {
            _taskCount = _taskCount + 1;
        };
    };

    _rate = _taskCount / count _taskList;

    // Count the players inside the extraction zone
    _playerCount = {
        _x inArea GVAR(extMarker);
    } count (allPlayers select {alive _x});

    // End the mission accordingly
    if (_playerCount >= (_allPlayers * GVAR(playerThreshold) * 0.01) && (_allPlayers != 0)) then {
        if (_rate >= (GVAR(taskThreshold) * 0.01)) then {
            [QGVARMAIN(callMission), ["MissionSuccess", true]] call CFUNC(localEvent);
        } else {
            [QGVARMAIN(callMission), ["MissionFail", false]] call CFUNC(localEvent);
        };
    };
};
