if (hasInterface) then {
  [{!isNull player}, {
    [] spawn MF_fnc_setOrbat;
  }] call CBA_fnc_waitUntilAndExecute;
};