/*
 * Author:
 * Malbryn
 *
 * Description:
 * Reassign the curator module
 *
 * Arguments:
 * _this select 0: OBJECT - Player unit who has curator access
 *
 * Return Value:
 * void
 *
 * Example:
 * [player] remoteExec ["MF_fnc_reassignCurator", 2]
 *
 */

params ["_unit"];

_curatorObj = _unit getVariable ["MF_curator", objNull];

if (isNull _curatorObj) exitWith {
    ["[MF ERROR] Admin curator module: Curator object does not exist!"] remoteExec ["systemChat", _unit];
};

unassignCurator _curatorObj;

[{ isNull (getAssignedCuratorLogic (_this select 0)) }, {
    (_this select 0) assignCurator (_this select 1);
}, [_unit, _curatorObj]] call CBA_fnc_waitUntilAndExecute;
