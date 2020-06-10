#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Set the unit's gear according to their role (roles are defined in mission_framework\config\gear\gear.sqf)

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

switch (side _unit) do {
    case west : {
        switch _role do {
            #include "..\..\..\config\gear\west_gear.sqf"

            default {
                MSG_1("WARNING","Player init: Undefined role in the loadout: %1 (west_gear.sqf)",_role);
            };
        };
    };

    case east : {
        switch _role do {
            #include "..\..\..\config\gear\east_gear.sqf"

            default {
                MSG_1("WARNING","Player init: Undefined role in the loadout: %1 (east_gear.sqf)",_role);
            };
        };
    };

    case independent : {
        switch _role do {
            #include "..\..\..\config\gear\independent_gear.sqf"

            default {
                MSG_1("WARNING","Player init: Undefined role in the loadout: %1 (independent_gear.sqf)",_role);
            };
        };
    };
};

// Apply the selected loadout
if !(count _gear == 0) then {
    _unit setUnitLoadout _gear;
} else {
    MSG("ERROR","Player init: Empty gear array!");
};

// Save the current loadout
SETPVAR(_unit,GVAR(currentLoadout),_role);

// Log
INFO_1("Player loadout saved: %1",GETVAR(_unit,GVAR(currentLoadout),""));
