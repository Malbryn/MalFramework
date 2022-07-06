#include "..\script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Reassigns the curator module on the server.

    Arguments:
        0: OBJECT - Player to assign the curator access to

    Example:
        [player1] call MF_admin_fnc_handleCuratorReassigned

    Returns:
        void
*/

if !(isServer) exitWith {};

params [
    ["_unit", objNull, [objNull]]
];

// Check input
if (isNull _unit) exitWith {
    [
        COMPONENT_STR,
        "ERROR",
        "Cannot reassign curator, the unit is null",
        false,
        1
    ] call EFUNC(main,log);
};

// Get curator logic
private _logic = GETVAR(_unit,GVAR(curatorLogic),objNull);

if (isNull _logic) exitWith {
    [
        COMPONENT_STR,
        "ERROR",
        "Cannot reassign curator, the curator object does not exist",
        true,
        3,
        _unit
    ] call EFUNC(main,log);
};

// Unassign curator
unassignCurator _logic;

// Assign curator
[{ isNull (getAssignedCuratorLogic (_this select 0)) }, {
    params ["_unit", "_logic"];

    _unit assignCurator _logic;

    // Log
    [
        COMPONENT_STR,
        "INFO",
        "Reassigned curator",
        true,
        3,
        _unit
    ] call EFUNC(main,log);
}, [_unit, _logic]] call CFUNC(waitUntilAndExecute);
