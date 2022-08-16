#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn)

    Description:
        Spawns a unit and applies loadout and skill.

    Arguments:
        0: ARRAY - Unit data
        1: GROUP - Unit group
        2: ARRAY - Spawn position

    Example:
        [[...], newGroup, [0, 0, 0]] call MF_ai_spawner_fnc_spawnUnit

    Returns:
        OBJECT
*/

if !(isServer) exitWith {};

params ["_unitData", "_newGroup", "_spawnPos", ["_unlimitedAmmo", true, [false]]];
_unitData params ["_unitType", "_unitPos", "_unitLoadout", "_unitSkill", "_unitVarName"];

private _newUnit = _newGroup createUnit [_unitType, _spawnPos, [], 0, "CAN_COLLIDE"];

waitUntil {alive _newUnit};

_newUnit setUnitLoadout _unitLoadout;
_newUnit setSkill _unitSkill;

if (_unitVarName isNotEqualTo "") then {
    [_newUnit, _unitVarName] remoteExec ["setVehicleVarName", 0, _newUnit];
    missionNamespace setVariable [_unitVarName, _newUnit, true];
};

if (_unlimitedAmmo) then {
    [_newUnit] call FUNC(unlimitedAmmo);
};

_newUnit
