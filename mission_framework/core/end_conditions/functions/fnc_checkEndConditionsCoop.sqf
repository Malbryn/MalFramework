#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Checks if any of the end conditions is true (in Coop missions)

    Arguments:
        -

    Example:
        call MF_end_conditions_fnc_checkEndConditionsCoop

    Returns:
        void
*/

if !(isServer) exitWith {};

scopeName QGVAR(main);

private _allPlayers = count allPlayers;
private _ended = false;

// Calculate task rate if Time limit or Extraction is enabled
private _taskList = GVAR(tasks);
private _taskCount = 0;

_taskList apply {
    private _state = _x call BFUNC(taskState);

    if (_state == "SUCCEEDED") then {
        _taskCount = _taskCount + 1;
    };
};

private _rate = _taskCount / count _taskList;

// Time limit check
if (GVARMAIN(moduleTimeLimit) && !_ended) then {
    private _time = CBA_missionTime;

    // End the mission accordingly
    if (_time > GVAR(timeLimit)) then {
        switch (true) do {
            case (_rate == 1) : {
                [QGVARMAIN(callMission), ["MissionSuccess", true, playerSide]] call CFUNC(serverEvent);
                _ended = true;
            };
            case ((GVARMAIN(taskThreshold) * 0.01) <= _rate && _rate < 1) : {
                [QGVARMAIN(callMission), ["TimeLimitMinorSuccess", true, playerSide]] call CFUNC(serverEvent);
                _ended = true;
            };
            case (0 < _rate && _rate < GVARMAIN(taskThreshold) * 0.01) : {
                [QGVARMAIN(callMission), ["TimeLimitMinorFail", false, playerSide]] call CFUNC(serverEvent);
                _ended = true;
            };
            case (_rate == 0) : {
                [QGVARMAIN(callMission), ["MissionFail", false, playerSide]] call CFUNC(serverEvent);
                _ended = true;
            };
        };
    };
};

// Friendly casualty check
if (GVARMAIN(modulePlayerCasualties) && _allPlayers != 0 && !_ended) then {
    private _dead = {!alive _x} count allPlayers;
    private _ratio = _dead / (_allPlayers * 0.01);

    if (_ratio >= GVAR(playerCasLimit)) then {
        [QGVARMAIN(callMission), ["PlayerCasLimit", false]] call CFUNC(localEvent);
        _ended = true;
    };
};

// Civilian casualty check
if (GVARMAIN(moduleCivilianCasualties) && count GVAR(civs) != 0 && !_ended) then {
    private _dead = GVAR(civCas);
    private _ratio = _dead / (count GVAR(civs) * 0.01);

    if (_ratio >= GVAR(civilianCasLimit)) then {
        [QGVARMAIN(callMission), ["CivCasLimit", false]] call CFUNC(localEvent);
        _ended = true;
    };
};

// Task check
if (GVARMAIN(moduleTaskLimit) && !_ended) then {
    private _taskList = GVAR(tasks);
    private _count = 0;

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
    // Count the players inside the extraction zone
    _playerCount = {
        _x inArea GVAR(extMarker);
    } count (allPlayers select {alive _x});

    // End the mission accordingly
    if (_playerCount >= (_allPlayers * GVAR(playerThreshold) * 0.01) && (_allPlayers != 0)) then {
        switch (true) do {
            case (_rate == 1) : {
                [QGVARMAIN(callMission), ["MissionSuccess", true, playerSide]] call CFUNC(serverEvent);
                _ended = true;
            };
            case ((GVARMAIN(taskThreshold) * 0.01) <= _rate && _rate < 1) : {
                [QGVARMAIN(callMission), ["MinorSuccess", true, playerSide]] call CFUNC(serverEvent);
                _ended = true;
            };
            case (0 < _rate && _rate < GVARMAIN(taskThreshold) * 0.01) : {
                [QGVARMAIN(callMission), ["MinorFail", false, playerSide]] call CFUNC(serverEvent);
                _ended = true;
            };
            case (_rate == 0) : {
                [QGVARMAIN(callMission), ["MissionFail", false, playerSide]] call CFUNC(serverEvent);
                _ended = true;
            };
        };
    };
};
