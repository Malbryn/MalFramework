/*
 * Author:
 * Malbryn
 *
 * Description:
 * Selects and returns the proper gear depending on the unit's role
 *
 * Arguments:
 * _this select 0: STRING - Role of the unit
 *
 * Return Value:
 * ARRAY
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

  #include "..\..\..\config\gear\gear.sqf"

  default {
    systemChat format ["ERROR: Undefined role in the loadout: %1", _role];
  };
};

_gear
