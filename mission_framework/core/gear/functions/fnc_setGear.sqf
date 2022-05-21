#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Sets the unit's gear according to their role.
        Roles and their gear are defined in under mission_framework\config\gear\gear.sqf file.

    Arguments:
        0: OBJECT - Player unit
        1: STRING - Role of the unit

    Example:
        [this, "SL"] call MF_gear_fnc_setGear

    Returns:
        void
*/

params [
    ["_unit", objNull, [objNull]],
    ["_role", "", [""]]
];

// Check input
if (isNull _unit) exitWith {
    [
        COMPONENT_STR,
        "ERROR",
        "Cannot set player gear because the unit is not found",
        true,
        1
    ] call EFUNC(main,log);
};

if (_role == "") exitWith {
    [
        COMPONENT_STR,
        "ERROR",
        "Cannot set player gear because the unit role is empty",
        true,
        1
    ] call EFUNC(main,log);
};

// No gear for spectators
if (side _unit == sideLogic) exitWith {
    [
        COMPONENT_STR,
        "INFO",
        "Virtual entity detected, exiting gear script",
        false,
        1
    ] call EFUNC(main,log);
};

// Remove all gear before applying the loadout
removeHeadgear _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeAllWeapons _unit;
removeAllAssignedItems _unit;

// Find the role of the unit
private _gear = [];
private _defaultGear = [
    [],[],[],["U_B_CombatUniform_mcam_tshirt",[]],[],[],"","",[],["ItemMap","","","ItemCompass","ItemWatch",""]
];

if (GVAR(useLoadouts)) then {
    if ((side _unit) == west) then {
        switch _role do {
            #include "..\..\..\config\gear\blufor_gear.sqf"

            // Customised loadout saved in Arsenal
            case "CUSTOM" : {
                _gear = GVAR(customLoadout);
            };

            default {
                // Apply default loadout
                _gear = _defaultGear;

                [
                    COMPONENT_STR,
                    "ERROR",
                    format ["Undefined role (%1) in the loadout (blufor_gear.sqf)", _role],
                    true,
                    1
                ] call EFUNC(main,log);
            };
        };
    } else {
        switch _role do {
            #include "..\..\..\config\gear\redfor_gear.sqf"

            // Customised loadout saved in Arsenal
            case "CUSTOM" : {
                _gear = GVAR(customLoadout);
            };

            default {
                // Apply default loadout
                _gear = _defaultGear;

                [
                    COMPONENT_STR,
                    "ERROR",
                    format ["Undefined role (%1) in the loadout (redfor_gear.sqf)", _role],
                    true,
                    1
                ] call EFUNC(main,log);
            };
        };
    };
} else {
    _gear = _defaultGear;
};

// Apply the selected loadout
if (count _gear == 0) exitWith {
    [
        COMPONENT_STR,
        "ERROR",
        "Cannot apply gear because the gear array is empty",
        true,
        1
    ] call EFUNC(main,log);
};

// Apply the selected loadout
_unit setUnitLoadout _gear;

// Save the current loadout
SETPVAR(_unit,GVAR(currentRole),_role);
SETPVAR(_unit,GVAR(currentGear),_gear);

[
    COMPONENT_STR,
    "DEBUG",
    format ["Assigned loadout: %1", _role],
    true,
    1
] call EFUNC(main,log);
