#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Set up the player entity

    Arguments:
        0: OBJECT - The player unit
        1: STRING - Role of the unit, see: gear script
        2: SCALAR - Unit traits (Optional):
            0 - Default, no special ability
            1 - Squad level leadership (SL, FTL), can deploy Rally Poins
            2 - Platoon level leadership (PLTHQ, PLTSGT), can call respawns, resupply and tactical withdrawal
        4: STRING - Assigned fireteam colour (Optional, default: white (= "MAIN"))
        5: SCALAR - Unit's view distance (Optional, default: -1 (default value defined in config.sqf))

    Example:
        [this, "PLTHQ", 2, "YELLOW", 2500] call MF_player_fnc_initPlayer

    Returns:
        void
*/

params ["_unit", "_role", ["_traits", 0], ["_colour", "MAIN"], ["_viewDistance", -1]];

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


// ACE player variables
// Medic
if ((roleDescription _unit) find "Medic" >= 0) then {
    SETPVAR(_unit,ACE_medical_medicClass,1);
} else {
    SETPVAR(_unit,ACE_medical_medicClass,0);
};

// Pilot
if ((roleDescription _unit) find "Pilot" >= 0) then {
    SETPVAR(_unit,ACE_GForceCoef,0.5);
} else {
    SETPVAR(_unit,ACE_GForceCoef,1);
};

// Engineer
SETPVAR(_unit,ACE_isEngineer,0);
