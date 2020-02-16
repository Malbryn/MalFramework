if (hasInterface) then {
  [] spawn {
    if (didJIP) then {
      uiSleep MF_var_title_delay;
    };

    [{CBA_missionTime > MF_var_title_delay}, {
      #include "runIntro.sqf"
    }] call CBA_fnc_waitUntilAndExecute;
  };
};