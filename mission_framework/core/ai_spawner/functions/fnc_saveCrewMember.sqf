#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn)

    Description:
        Saves crew member data.

    Arguments:
        0: OBJECT

    Example:
        [crewman1] call MF_ai_spawner_fnc_saveCrewMember

    Returns:
        ARRAY
*/

if !(isServer) exitWith {};

params ["_crewMember"];
_crewMember params ["_unit", "_role", "_cargoIndex", "_turretPath"];

[[_unit] call FUNC(saveUnit), _role, _cargoIndex, _turretPath]
