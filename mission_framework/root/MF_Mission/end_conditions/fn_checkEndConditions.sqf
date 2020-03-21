/*
 * Author:
 * Malbryn
 *
 * Description:
 * Checks if any of the end conditions is true
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] spawn MF_fnc_checkEndConditions
 *
 */

if (!isServer) exitWith {};

// Terminate the end condition checking loop if there's no condition defined
if !(MF_var_end_time_enabled || MF_var_end_cas_enabled || MF_var_end_task_enabled || MF_var_end_ex_enabled) then {
    [MF_EndCheck] call CBA_fnc_removePerFrameHandler;
};

_allPlayers = count allPlayers;

// Time limit check
if (MF_var_end_time_enabled) then {
    private _time = CBA_missionTime;

    if (_time > MF_var_end_time_limit) then {
        ["TimeLimit", false] call MF_fnc_endMission;
    };
};


// Casualty check
if (MF_var_end_cas_enabled) then {
    private _dead = { !alive _x } count allPlayers;

    private _percentage = _dead / (_allPlayers * 0.01);

    if (_percentage >= MF_var_end_cas_rate) then {
        ["CasualtyLimit", false] call MF_fnc_endMission;
    };
};


// Task check
if (MF_var_end_task_enabled) then {
    private _taskList = MF_var_tasks;
    private _count = 0;
    {
        _taskState = [_x] call BIS_fnc_taskState;
        if (_taskState == "SUCCEEDED") then {
            _count = _count + 1
        };
    } forEach _taskList;

    if (_count >= MF_var_end_task_number) then {
        ["MissionSuccess", true] call MF_fnc_endMission;
    };
};


// Extraction check
if (MF_var_end_ex_enabled) then {

    // Count the rate of the not successful tasks
    private _taskList = MF_var_tasks;

    private _taskCount = 0;
    {
        private _state = _x call BIS_fnc_taskState;
        if (_state == "SUCCEEDED") then {
            _taskCount = _taskCount + 1;
        };
    } forEach _taskList;

    _rate = _taskCount / count _taskList;

    // Count the players inside the extraction zone
    private _playerCount = {
        _x inArea MF_var_end_ex_marker;
    } count allPlayers;

    // End the mission accordingly
    if (_playerCount >= (_allPlayers * MF_var_end_ex_threshold * 0.01) && (_allPlayers != 0)) then {
        if (_rate >= (MF_var_end_task_threshold * 0.01)) then {
            ["MissionSuccess", true] call MF_fnc_endMission;
        } else {
            ["MissionFail", false] call MF_fnc_endMission;
        };
    };
};
