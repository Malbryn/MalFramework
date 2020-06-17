#include "script_component.hpp"

/*
    Author:
        Kex (modified by Malbryn)

    Description:
        Adds a "Search for intel" option to an intel object.

    Arguments:
        0: OBJECT - Intel object
        1: SCALAR - ID of the intel (see intel.sqf in config)

    Example:
        [objName, 2] call MF_intel_fnc_initIntel

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params ["_object", "_id"];

#include "..\..\..\config\intel\intel.sqf"

private _intel = GVAR(intelList) select _id;
private _title = _intel#0;
private _text = _intel#1;
private _duration = _intel#2;
private _delete = _intel#3;

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

        [QGVARMAIN(intelFound), [_title, _text, name _finder]] call CFUNC(globalEvent);
        [QGVARMAIN(notification_2), ["IntelAdded", format ["Intel: %1<br/>was found by %2", _title, name _finder]]] call CFUNC(globalEvent);

        if (_delete) then { deleteVehicle _object };
    },
    {},
    [_title, _text, _delete],
    _duration,
    20,
    true,
    false
] call BFUNC(holdActionAdd);
