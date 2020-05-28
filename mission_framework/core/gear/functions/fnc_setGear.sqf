#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Set the unit's gear according to their role (defined in mission_framework\config\gear\gear.sqf)

    Arguments:
        0: OBJECT - Player unit
        1: STRING - Role of the unit

    Example:
        [this, "SL"] call MF_gear_fnc_setGear

    Returns:
        void
*/

params ["_unit", "_role"];
private ["_gear"];

// Remove all gear before applying the loadout
removeHeadgear _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeAllWeapons _unit;
removeAllAssignedItems _unit;


// Find the role of the unit
_gear = [];

switch _role do {

    #include "..\..\..\config\gear\gear.sqf"

    default {
        INFO_1("Player init: Undefined role in the loadout: %1",_role);
        MSG_1("WARNING","Player init: Undefined role in the loadout: %1",_role);
    };
};

INFO_1("Role found: %1. Applying loadout...",_role);

// Apply the selected loadout
if !(count _gear == 0) then {
    _unit setUnitLoadout _gear;
} else {
    INFO_1("Player init module: Empty gear array!");
    MSG("ERROR","Player init: Empty gear array!");
};

// Save the current loadout
SETPVAR(_unit,GVAR(currentLoadout),_role);

// Log
INFO_1("Loadout saved: %1. Gear script done",GETVAR(_unit,GVAR(currentLoadout),""));
