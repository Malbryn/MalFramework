#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds a "Search for intel" option to an intel object.

    Arguments:
        0: OBJECT - Intel object
        1: SCALAR - ID of the intel (see intel.sqf in config)
        2: STRING - Pick-up action display text (Optional, default: "Search for intel")
        3: STRING - Hold action icons (Optional, default: "holdAction_search_ca")

        Available icons:
            - holdAction_connect_ca.paa
            - holdAction_forceRespawn_ca.paa
            - holdAction_hack_ca.paa
            - holdAction_loadDevice_ca.paa
            - holdAction_passLeadership_ca.paa
            - holdAction_requestLeadership_ca.paa
            - holdAction_revive_ca.paa
            - holdAction_reviveMedic_ca.paa
            - holdAction_search_ca.paa
            - holdAction_secure_ca.paa
            - holdAction_takeOff1_ca.paa
            - holdAction_takeOff2_ca.paa
            - holdAction_thumbsDown_ca.paa
            - holdAction_thumbsUp_ca.paa
            - holdAction_unbind_ca.paa
            - holdAction_unloadDevice_ca.paa

    Example:
        [this, 2, "Hack laptop", "holdAction_hack_ca"] call MF_intel_fnc_initIntel

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params ["_object", "_id", ["_displayText", "Search for intel"], ["_icon", "holdAction_search_ca"]];

#include "..\..\..\config\intel\intel.sqf"

private _intel = GVAR(intelList) select _id;
private _title = _intel#0;
private _text = _intel#1;
private _duration = _intel#2;
private _delete = _intel#3;
private _share = _intel#4;
private _iconPath = format ["\a3\ui_f\data\IGUI\Cfg\holdactions\%1.paa", _icon];

// Set a global variable that we can use in triggers
private _intelID = format ["MF_intel_ID_%1", _id];
missionNamespace setVariable [_intelID, false, true];

[
    _object,
    _displayText,
    _iconPath,
    _iconPath,
    "_this distance _target < 4",
    "_caller distance _target < 4",
    {},
    {},
    {
        params ["_object", "_finder", "_ID", "_arguments"];
        _arguments params ["_title", "_text", "_delete", "_share", "_intelID"];

        if (_share) then {
            [QGVAR(intelFound), [_title, _text, name _finder, true]] call CFUNC(globalEvent);
            [QGVAR(notification_2), ["IntelAdded", format ["Intel: %1<br/>was found by %2", _title, name _finder]]] call CFUNC(globalEvent);
        } else {
            [QGVAR(intelFound), [_title, _text, name _finder, false]] call CFUNC(localEvent);
            [QGVAR(notification_2), ["IntelAdded", format ["Intel: %1", _title]]] call CFUNC(localEvent);
        };

        // Set global variable for triggers
        missionNamespace setVariable [_intelID, true, true];

        if (_delete) then { deleteVehicle _object };
    },
    {},
    [_title, _text, _delete, _share, _intelID],
    _duration,
    20,
    true,
    false
] call BFUNC(holdActionAdd);
