#include "..\script_component.hpp"

/*
    Author:
        Commy2 (modified by Malbryn)

    Description:
        Creates a curator logic for the game masters.

    Arguments:
        -

    Example:
        [_unit] call MF_curator_fnc_createCurator

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_unit"];

private _logic = createGroup sideLogic createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];

[_logic, _unit, true] call AFUNC(zeus,bi_moduleCurator);
_unit assignCurator _logic;

_logic addCuratorEditableObjects [allPlayers, true];
_logic addCuratorEditableObjects [(allMissionObjects "Air"), true];
_logic addCuratorEditableObjects [(allMissionObjects "Ship"), true];
_logic addCuratorEditableObjects [(allMissionObjects "LandVehicle"), true];
_logic addCuratorEditableObjects [(allMissionObjects "Man"), true];

SETPVAR(_unit,GVAR(curatorLogic),_logic);

[QGVARMAIN(systemMessage), ["INFO", "Game Master: Registered as Curator"], _unit] call CFUNC(targetEvent);
