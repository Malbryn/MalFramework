#include "..\script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Reassign the curator module

    Arguments:
        0: OBJECT - Player unit who has curator access

    Example:
        [_unit] call MF_curator_fnc_reassignCurator

    Returns:
        void
*/

params ["_unit"];
private ["_logic"];

_logic = GETVAR(GVARMAIN(_unit),GVARMAIN(curator),objNull);

if (isNull _logic) exitWith {
    INFO_2("Curator object does not exist!",_unit,_logic);
    [QGVARMAIN(systemMessage), ["[MF ERROR] (curator) Curator object does not exist!"], _unit] call CFUNC(targetEvent);
};

unassignCurator _logic;

[{isNull (getAssignedCuratorLogic (_this select 0))}, {
    (_this select 0) assignCurator (_this select 1);
    [QGVARMAIN(systemMessage), ["[MF INFO] Registered as Curator."], _unit] call CFUNC(targetEvent);
}, [_unit, _logic]] call CFUNC(waitUntilAndExecute);
