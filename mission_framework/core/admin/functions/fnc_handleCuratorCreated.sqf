#include "..\script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Creates a curator logic for the game masters.

    Arguments:
        0: OBJECT - Player to assign the curator access to

    Example:
        [_unit] call MF_admin_fnc_handleCuratorCreated

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
        "Cannot create curator object, the unit is null",
        false,
        1
    ] call EFUNC(main,log);
};

// Create curator logic
private _logic = (createGroup sideLogic) createUnit [
    "ModuleCurator_F",
    [0, 0, 0],
    [],
    0,
    "CAN_COLLIDE"
];

// Assign the curator logic
[_logic, _unit, true] call AFUNC(zeus,bi_moduleCurator);
_unit assignCurator _logic;

// Manage editable objects in the zeus interface
_logic addCuratorEditableObjects [allPlayers, true];
_logic addCuratorEditableObjects [(allMissionObjects "Air"), true];
_logic addCuratorEditableObjects [(allMissionObjects "Ship"), true];
_logic addCuratorEditableObjects [(allMissionObjects "LandVehicle"), true];
_logic addCuratorEditableObjects [(allMissionObjects "Man"), true];

// Save the reference to the curator object
SETPVAR(_unit,GVAR(curatorLogic),_logic);

// Log
[
    COMPONENT_STR,
    "INFO",
    "Assigned curator",
    false,
    3,
    _unit
] call EFUNC(main,log);
