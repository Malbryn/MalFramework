#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Sets the unit's gear according to their role (roles are defined in mission_framework\config\gear\gear.sqf).

    Arguments:
        0: OBJECT - Player unit
        1: STRING - Role of the unit

    Example:
        [this, "SL"] call MF_gear_fnc_setGear

    Returns:
        BOOLEAN
*/

params ["_unit", "_role"];

if (isNil "_unit") exitWith {
    [COMPONENT_STR, "ERROR", "Unit is not found", true] call EFUNC(main,log);
    false
};

// No gear for spectators
if (side _unit == sideLogic) exitWith {};

// Remove all gear before applying the loadout
removeHeadgear _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeAllWeapons _unit;
removeAllAssignedItems _unit;

// Find the role of the unit
private _gear = [];

if ((side _unit) == west) then {
    switch _role do {
        #include "..\..\..\config\gear\blufor_gear.sqf"

        default {
            [COMPONENT_STR, "ERROR", format ["Undefined role (%1) in the loadout (blufor_gear.sqf)", _role], true] call EFUNC(main,log);
        };
    };
} else {
    switch _role do {
        #include "..\..\..\config\gear\redfor_gear.sqf"

        default {
            [COMPONENT_STR, "ERROR", format ["Undefined role (%1) in the loadout (redfor_gear.sqf)", _role], true] call EFUNC(main,log);
        };
    };
};

// Apply the selected loadout
if (count _gear == 0) exitWith {
    [COMPONENT_STR, "ERROR", "Gear array is empty", true] call EFUNC(main,log);
    false
};

// Apply the selected loadout
_unit setUnitLoadout _gear;

// Save the current loadout
SETPVAR(_unit,GVAR(currentLoadout),_role);

[COMPONENT_STR, "DEBUG", format ["Assigned role: %1", _role], true] call EFUNC(main,log);

true
