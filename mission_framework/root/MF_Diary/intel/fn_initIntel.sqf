/*
 * Author:
 * Kex (modified by Malbryn)
 *
 * Description:
 * Adds a "Search for intel" option to an intel object
 *
 * Arguments:
 * _this select 0: OBJECT - Intel object
 * _this select 1: SCALAR - ID of the intel (see: intel.sqf in config)
 *
 * Return Value:
 * void
 *
 * Example:
 * // Use this method after mission init
 *   [] call MF_fnc_initIntel
 *
 * // Use this method in the init field of the object
 *   [] execVM "mission_framework\root\MF_Diary\intel\fn_addIntel.sqf"
 *
 */

#include "..\..\..\config\intel\intel.sqf"

params ["_object", "_id"];

_intel = MF_var_intel_list select _id;
_title = _intel select 0;
_text = _intel select 1;
_duration = _intel select 2;
_delete = _intel select 3;

[
  _object,
  "Search for intel",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
  "_this distance _target < 3",
  "_caller distance _target < 3",
  {},
  {},
  {
    params ["_object", "_finder", "_ID", "_arguments"];
    _arguments params ["_title", "_text", "_delete"];

    [_title, _text, name _finder] call MF_fnc_addIntelToDiary;
    ["IntelAdded", [format ["Intel: %1<br/>Found by %2", _title, name _finder]]] call BIS_fnc_showNotification;

    if (_delete) then { deleteVehicle _object };
  },
  {},
  [_title, _text, _delete],
  _duration,
  20,
  true,
  false
] remoteExec ["BIS_fnc_holdActionAdd", 0, _object];
