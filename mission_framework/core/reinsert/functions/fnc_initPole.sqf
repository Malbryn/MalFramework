#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds different options to an object ("TP pole") for reinsertion
        Also adds the rally point menu to the squad leader(s)

    Arguments:
        -

    Example:
        call MF_reinsert_fnc_initPole

    Returns:
        void
*/

if !(hasInterface) exitWith {};

if (isNil "tpPole") exitWith {
    MSG("WARNING","Reinsert module: Teleport pole does not exist");
};

// Option #1 - Paradrop
if (GVARMAIN(moduleHALO)) then {
    tpPole addAction ["Reinsert - Paradrop", {
        call FUNC(haloDrop);
    }];
};

// Option #2 - MRV
if (GVARMAIN(moduleMRV)) then {
    tpPole addAction ["Reinsert - MRV", {
        call FUNC(tpToMRV);
    }];
};

// Option #3 - Squad rally point
if (GVARMAIN(moduleRP)) then {
    tpPole addAction ["Reinsert - Squad Rally Point", {
        call FUNC(tpToRP);
    }];
};


// Assigning the RP menu to the squad leaders
if (GVARMAIN(moduleRP) && GETVAR(player,EGVAR(player,isSL),false)) then {
    call FUNC(addRPMenu);
};
