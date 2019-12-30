// [_role] call MF_fnc_selectLoadout;
// New role syntax:
/*
case "role"
  GEAR_START
    []
  GEAR_END
*/

#define GEAR_START  : { _gear =
#define GEAR_END ;};

params ["_role"];
_gear = [];

switch _role do {
  case "SL"
    GEAR_START
      [[],[],[],["U_Rangemaster",[["FirstAidKit",1]]],["V_Rangemaster_belt",[]],[],"H_Cap_headphones","G_Tactical_Clear",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    GEAR_END

  default {
    systemChat format ["ERROR: Undefined role in the loadout: %1", _role];
  };
};

_gear
