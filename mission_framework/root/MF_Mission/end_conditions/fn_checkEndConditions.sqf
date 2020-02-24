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


// Task check --- NEEDS FIXING
if (MF_var_end_task_enabled) then {
  private _taskList = player call BIS_fnc_tasksUnit;
  private _count = 0;
  {
    if (_x call BIS_fnc_taskCompleted) then {
	  _count = _count + 1
	  };
  } forEach _taskList;

  if (_count >= MF_var_end_task_number) then {
    ["MissionSuccess", true] call MF_fnc_endMission;
  };
};


// Extraction check
if (MF_var_end_ex_enabled) then {
  private _count = {
    [_x, MF_var_end_ex_marker] call MF_fnc_unitInArea;
  } count _allPlayers;

  if (_count >= (_allPlayers * MF_var_end_ex_threshold * 0.01)) then {
    ["MissionSuccess", true] call MF_fnc_endMission;
  };
};