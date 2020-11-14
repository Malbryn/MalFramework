#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Sets up the player entity.

    Arguments:
        0: OBJECT - The player unit
        1: STRING - Role of the unit, see: gear script
        2: SCALAR - Unit traits (Optional, default: 0):
            0 - No special ability
            1 - Squad level leadership (SL, FTL), can deploy Rally Poins
            2 - Platoon level leadership (PLTHQ, PLTSGT), can call respawns, resupply and tactical withdrawal
        4: STRING - Assigned fireteam colour (Optional, default: white (= "MAIN"))
        5: SCALAR - Unit's view distance (Optional, default: -1 (default value defined in config.sqf))
        6: STRING - Custom shoulder insignia (Optional, default: "")
        7: SCALART - ACE player variables (Optional, default: 0):
            0 - None
            1 - Medic status
            2 - Pilot status

    Example:
        [this, "MEDIC", 0, "GREEN", 2500, "EAF_5thRegiment", 1] call MF_player_fnc_initPlayer

    Returns:
        void
*/

params ["_unit", "_role", ["_traits", 0], ["_colour", "MAIN"], ["_viewDistance", -1], ["_insignia", ""], ["_aceVars", 0]];

INFO_2("Initialising unit: %1 (Local: %2)",_unit,local _unit);

// Locality check
if !(local _unit) exitWith {};

// Gear script
[_unit, _role] call EFUNC(gear,setGear);

// Assign player traits
[_unit, _traits] call FUNC(setTraits);

// Assign team colour
SETPVAR(_unit,EGVAR(team_colour,teamColour),_colour);

// Assign view distance
SETPVAR(_unit,EGVAR(view_distance,viewDistance),_viewDistance);

// Save insignia
SETPVAR(_unit,GVAR(insignia),_insignia);

// Set ACE player variables
switch (_aceVars) do {
    case 1: { // Medic
        SETPVAR(_unit,ACE_medical_medicClass,1);
        SETPVAR(_unit,ACE_GForceCoef,1);
        SETPVAR(_unit,ACE_isEngineer,0);
    };

    case 2: { // Pilot
        SETPVAR(_unit,ACE_medical_medicClass,0);
        SETPVAR(_unit,ACE_GForceCoef,0.5);
        SETPVAR(_unit,ACE_isEngineer,0);
    };

    default {
        SETPVAR(_unit,ACE_medical_medicClass,0);
        SETPVAR(_unit,ACE_GForceCoef,1);
        SETPVAR(_unit,ACE_isEngineer,0);
    };
};
