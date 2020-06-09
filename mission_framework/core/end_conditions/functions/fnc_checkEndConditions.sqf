#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Check if any of the end conditions is true

    Arguments:
        -

    Example:
        call MF_end_conditions_fnc_checkEndConditions

    Returns:
        void
*/

private ["_allPlayers"];

if !(isServer) exitWith {};

_allPlayers = count allPlayers;

// Time limit check
if (GVARMAIN(moduleTimeLimit)) then {
    private ["_time"];

    _time = CBA_missionTime;
    
    if (_time > GVAR(timeLimit)) then {
        [QGVARMAIN(missionEnd), ["TimeLimit", false]] call CFUNC(localEvent);
    };
};


// Friendly casualty check
if (GVARMAIN(moduleFriendlyCasualties)) then {
    private ["_dead", "_ratio"];

    _dead = {!alive _x} count allPlayers;
    _percentage = _dead / (_allPlayers * 0.01);

    if (_percentage >= GVAR(friendlyCasLimit)) then {
        [QGVARMAIN(missionEnd), ["CasualtyLimit", false]] call CFUNC(localEvent);
    };
};


// Civilian casualty check
if (GVARMAIN(moduleCivilianCasualties) && count GVAR(civs) != 0) then {
    private ["_dead", "_ratio"];

    _dead = GVAR(civCas);
    _percentage = _dead / (count GVAR(civs) * 0.01);

    if (_percentage >= GVAR(civilianCasLimit)) then {
        [QGVARMAIN(missionEnd), ["CivCasualtyLimit", false]] call CFUNC(localEvent);
    };
};


// Task check
if (GVARMAIN(moduleTaskLimit)) then {
    private ["_taskList", "_count"];

    _taskList = GVAR(tasks);
    _count = 0;

    {
        _taskState = [_x] call BFUNC(taskState);

        if (_taskState == "SUCCEEDED") then {
            _count = _count + 1
        };
    } forEach _taskList;

    if (_count >= GVAR(taskLimit)) then {
        [QGVARMAIN(missionEnd), ["MissionSuccess", true]] call CFUNC(localEvent);
    };
};


// Extraction check
if (GVARMAIN(moduleExtraction)) then {
    private ["_taskList", "_taskCount", "_playerCount"];

    // Count the rate of the not successful tasks
    _taskList = GVAR(tasks);
    _taskCount = 0;

    {
        private ["_state"];

        _state = _x call BFUNC(taskState);

        if (_state == "SUCCEEDED") then {
            _taskCount = _taskCount + 1;
        };
    } forEach _taskList;

    _rate = _taskCount / count _taskList;

    // Count the players inside the extraction zone
    _playerCount = {
        _x inArea GVAR(extMarker);
    } count allPlayers;

    // End the mission accordingly
    if (_playerCount >= (_allPlayers * GVAR(playerThreshold) * 0.01) && (_allPlayers != 0)) then {
        if (_rate >= (GVAR(taskThreshold) * 0.01)) then {
            [QGVARMAIN(missionEnd), ["MissionSuccess", true]] call CFUNC(localEvent);
        } else {
            [QGVARMAIN(missionEnd), ["MissionFail", false]] call CFUNC(localEvent);
        };
    };
};
