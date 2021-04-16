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
            1 - Squad level leadership (SL, FTL) -> can deploy Rally Poins
            2 - Platoon level leadership (PLTHQ, PLTSGT) -> can call respawns, resupply and tactical withdrawal
        3: ARRAY - ACE player variables (Optional, default: [false, false, false]):
            0 - Medic status
            1 - Pilot status
            2 - Engineer status
        4: STRING - Assigned fireteam colour (Optional, default: white (= "MAIN"))
        5: SCALAR - Unit's custom view distance (Optional, default: -1 (default value defined in config.sqf))
        6: STRING - Custom shoulder insignia (Optional, default: "")

    Example:
        [this, "MEDIC", 0, [true, false, false], "GREEN", 2500, "EAF_5thRegiment"] call MF_player_fnc_initPlayer

    Returns:
        void
*/

params ["_unit", "_role", ["_traits", 0], ["_aceVars", [false, false, false]], ["_colour", "MAIN"], ["_viewDistance", -1], ["_insignia", ""]];

// 20:10:11 [MF] (player) INFO: Initialising unit: [B ALPHA 1-1] [Malbryn] [AR] [0] [false, false, false] [1200m]
[COMPONENT_STR, "INFO", format [
    "Initialising unit: [%1] [%2] [%3] [%4] %5 [%6m]",
    group _unit, name _unit, _role, _traits, _aceVars, _viewDistance
]] call EFUNC(main,log);

// Locality check
if !(local _unit) exitWith {};

// Gear script
[_unit, _role] call EFUNC(gear,setGear);

// Assign player traits
[_unit, _traits] call FUNC(setTraits);

// Assign team colour
SETPVAR(_unit,GVAR(teamColour),_colour);

// Assign view distance
SETPVAR(_unit,EGVAR(common,viewDistance),_viewDistance);

// Save insignia
SETPVAR(_unit,GVAR(insignia),_insignia);

// Set ACE variables
// Medic status
SETPVAR(_unit,ACE_medical_medicClass,if (_aceVars select 0) then {1} else {0});

// Pilot status
SETPVAR(_unit,ACE_GForceCoef,if (_aceVars select 1) then {0.5} else {1});

// Engineer status
SETPVAR(_unit,ACE_isEngineer,if (_aceVars select 2) then {1} else {0});
