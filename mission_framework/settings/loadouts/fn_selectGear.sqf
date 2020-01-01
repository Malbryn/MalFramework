/*
 * Author:
 * Malbryn
 *
 * Description:
 * Selects and returns the proper gear depending on the unit's role
 *
 * Defining new roles:
 *   case "role"
 *    GEAR_START
 *     []
 *    GEAR_END
 *
 * Arguments:
 * _this select 0: STRING - Role of the unit
 *
 * Return Value:
 * <ARRAY>
 *
 * Example:
 * ["SL"] call MF_fnc_selectGear
 *
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
