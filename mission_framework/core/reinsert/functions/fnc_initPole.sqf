#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds different options to an object ("TP pole") for reinsertion.
        Also adds the rally point menu to the squad leader(s).

    Arguments:
        -

    Example:
        call MF_reinsert_fnc_initPole

    Returns:
        void
*/

if !(hasInterface) exitWith {};

private _tpPoles = GVAR(TPPoles);

if (count _tpPoles == 0) exitWith {
    MSG("WARNING","(Reinsert) The teleport pole array is empty");
};

_tpPoles apply {
    if (isNil _x) exitWith {
        MSG_1("ERROR","(Reinsert) Teleport pole object (%1) does not exist",_x);
    }

    // Option #1 - Paradrop
    if (GVARMAIN(moduleHALO)) then {
        _x addAction ["Reinsert - Paradrop", {
            call FUNC(haloDrop);
        }];
    };

    // Option #2 - MRV
    if (GVARMAIN(moduleMRV)) then {
        _x addAction ["Reinsert - MRV", {
            call FUNC(tpToMRV);
        }];
    };

    // Option #3 - Squad rally point
    if (GVARMAIN(moduleRP)) then {
        _x addAction ["Reinsert - Squad Rally Point", {
            call FUNC(tpToRP);
        }];
    };
};

// Assigning the RP menu to the squad leaders
if (GVARMAIN(moduleRP) && GETVAR(player,EGVAR(player,isSL),false)) then {
    call FUNC(addRPMenu);
};
