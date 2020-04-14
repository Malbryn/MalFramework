/*
 * Author:
 * Malbryn
 *
 * Description:
 * Starts other scripts to remove the unit's current gear and then applies the custom loadout
 *
 * Arguments:
 * _this select 0: OBJECT - Unit
 * _this select 1: STRING - Role of the unit
 *
 * Return Value:
 * void
 *
 * Example:
 * [this, "SL"] call MF_fnc_setGear
 *
 */

#define GEAR_START  : {
#define GEAR_END ;};

params ["_unit", "_role"];

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
        systemChat format ["[MF WARNING] Undefined role in the loadout: %1", _role];
        diag_log format ["[MF WARNING] Undefined role in the loadout: %1", _role];
    };
};

diag_log format ["[MF LOG] Role found: %1. Applying loadout...", _role];


// Apply the selected loadout
if !(count _gear == 0) then {
    _unit setUnitLoadout _gear;
} else {
    systemChat "[MF ERROR] Empty gear array";
    diag_log "[MF ERROR] Empty gear array";
};

diag_log "[MF LOG] Loadout applied. Saving...";

// Save the current loadout
_unit setVariable ["MF_var_current_loadout", _role, true];

diag_log format ["[MF LOG] Loadout saved: %1. Gear script done.", _unit getVariable "MF_var_current_loadout"];