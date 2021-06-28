#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Updates the player sides in a TvT mission when the player dies.

    Arguments:
        -

    Example:
        call MF_respawn_fnc_updateSides

    Returns:
        void
*/

if !(hasInterface) exitWith {};

if !(GVARMAIN(isTvT)) exitWith {
    [COMPONENT_STR, "WARNING", "Cannot update player sides in a Coop mission", true] call EFUNC(main,log);
};

switch playerSide do {
    case west : {
        private _side = EGVAR(common,sideBlufor);

        if (0 < _side#2) then {
            [QEGVAR(common,sideValueSet), [playerSide, 0, -1, -1]] call CFUNC(serverEvent);
        } else {
            [QEGVAR(common,sideValueSet), [playerSide, 0, -1, 0]] call CFUNC(serverEvent);
        };
    };

    case east : {
        private _side = EGVAR(common,sideRedfor);

        if (0 < _side#2) then {
            [QEGVAR(common,sideValueSet), [playerSide, 0, -1, -1]] call CFUNC(serverEvent);
        } else {
            [QEGVAR(common,sideValueSet), [playerSide, 0, -1, 0]] call CFUNC(serverEvent);
        };
    };

    default {
        [COMPONENT_STR, "ERROR", format ["Cannot calculate side tickets, invalid side of player (%1)", playerSide], true] call EFUNC(main,log);
    };
};
