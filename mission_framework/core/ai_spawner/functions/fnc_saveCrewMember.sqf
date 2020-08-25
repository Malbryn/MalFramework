#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn)

    Description:
        Saves crew member data.

    Arguments:
        -

    Example:
        call MF_ai_spawner_fnc_saveCrewMember

    Returns:
        ARRAY
*/

if !(isServer) exitWith {};

params ["_crewMember"];

_crewMember params ["_unit", "_role", "_cargoIndex", "_turretPath"];

private _crewMemberData = [];

_crewMemberData pushBack ([_unit] call FUNC(saveUnit));
_crewMemberData pushBack _role;
_crewMemberData pushBack _cargoIndex;
_crewMemberData pushBack _turretPath;

_crewMemberData;
