#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Assigns special traits (command level) to a player.

    Arguments:
        0: OBJECT - The unit
        1: SCALAR - Unit traits (Optional, default: 0):
            0 - No special ability
            1 - Squad level leadership (SL, FTL), can deploy Rally Poins
            2 - Platoon level leadership (PLTHQ, PLTSGT), can call respawns, resupply and tactical withdrawal

    Example:
        [player, 2] call MF_player_fnc_setTraits

    Returns:
        void
*/

params ["_unit", ["_traits", 0]];

switch (_traits) do {
    case 0 : {
        SETPVAR(_unit,GVAR(isSL),false);
        SETPVAR(_unit,GVAR(isCO),false);
    };
    case 1 : {
        SETPVAR(_unit,GVAR(isSL),true);
        SETPVAR(_unit,GVAR(isCO),false);
    };
    case 2 : {
        SETPVAR(_unit,GVAR(isSL),true);
        SETPVAR(_unit,GVAR(isCO),true);
    };
    default {
        [COMPONENT_STR, "WARNING", format ["Invalid unit trait value (%1) of unit (%2)", _traits, _unit], true, 2] call EFUNC(main,log);
    };
};
