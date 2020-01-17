[] spawn {
  [{CBA_missionTime > MF_var_title_delay}, {
    #include "runIntro.sqf"
  }] call CBA_fnc_waitUntilAndExecute;
};
