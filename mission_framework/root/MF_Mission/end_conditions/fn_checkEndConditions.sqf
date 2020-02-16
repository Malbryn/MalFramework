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
    [] call MF_fnc_saveMissionTime;

    ["TimeLimit", false, true, true, true] remoteExec ["BIS_FNC_endMission", 0, true];

    if (MF_var_nd_ending_enabled) then {
      [] remoteExecCall ["MF_fnc_noDamageEnding", 0];
    };

    [MF_EndCheck] call CBA_fnc_removePerFrameHandler;
  };
};


// Casualty check
if (MF_var_end_cas_enabled) then {
  private _alive = { alive _x } count allPlayers;
  private _dead = { !alive _x } count allPlayers;

  private _percentage = (_allPlayers - _alive) / (_allPlayers * 0.01);

  if (_percentage >= MF_var_end_cas_rate) then {
    [] call MF_fnc_saveMissionTime;

    ["CasualtyLimit", false, true, true, true] remoteExec ["BIS_FNC_endMission", 0, true];

    if (MF_var_nd_ending_enabled) then {
      [] remoteExecCall ["MF_fnc_noDamageEnding", 0];
    };

	  [MF_EndCheck] call CBA_fnc_removePerFrameHandler;
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
    [] call MF_fnc_saveMissionTime;

    ["MissionSuccess", true, true, true, true] remoteExec ["BIS_FNC_endMission", 0, true];

    if (MF_var_nd_ending_enabled) then {
      [] remoteExecCall ["MF_fnc_noDamageEnding", 0];
    };

	  [MF_EndCheck] call CBA_fnc_removePerFrameHandler;
  };
};


// Extraction check
if (MF_var_end_ex_enabled) then {
  private _count = {
    side _x == MF_var_player_side && [_x, MF_var_end_ex_marker] call MF_fnc_unitInArea;
  } count allUnits;

  if (_count >= (_allPlayers * 0.5)) then {
    [] call MF_fnc_saveMissionTime;

    ["MissionSuccess", true, true, true, true] remoteExec ["BIS_FNC_endMission", 0, true];

    if (MF_var_nd_ending_enabled) then {
      [] remoteExecCall ["MF_fnc_noDamageEnding", 0];
    };

	  [MF_EndCheck] call CBA_fnc_removePerFrameHandler;
  };
};