#include "..\script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Reassigns the curator module on the server.

    Arguments:
        0: OBJECT - Player unit who has curator access

    Example:
        [_unit] call MF_admin_fnc_reassignCuratorServer

    Returns:
        void
*/

params ["_unit"];

private _logic = GETVAR(_unit,GVAR(curatorLogic),objNull);

if (isNull _logic) exitWith {
    [
        COMPONENT_STR,
        "ERROR",
        "Curator object does not exist",
        true,
        3,
        _unit
    ] call EFUNC(main,log);
};

// Unassign curator
unassignCurator _logic;

// Assign curator
[{isNull (getAssignedCuratorLogic (_this select 0))}, {
    params ["_unit", "_logic"];

    _unit assignCurator _logic;

    [
        COMPONENT_STR,
        "INFO",
        "Assigned to Curator",
        true,
        3,
        _unit
    ] call EFUNC(main,log);
}, [_unit, _logic]] call CFUNC(waitUntilAndExecute);
