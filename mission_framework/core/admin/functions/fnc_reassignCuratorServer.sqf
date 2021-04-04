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
    [COMPONENT_STR, "ERROR", "Curator object does not exist", true, 3, _unit] call EFUNC(main,log);
};

unassignCurator _logic;

[{isNull (getAssignedCuratorLogic (_this#0))}, {
    _this#0 assignCurator _this#1;
    [COMPONENT_STR, "INFO", "Assigned to Curator", true, 3, _this#0] call EFUNC(main,log);
}, [_unit, _logic]] call CFUNC(waitUntilAndExecute);
