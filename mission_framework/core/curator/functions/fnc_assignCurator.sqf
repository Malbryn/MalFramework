#include "..\script_component.hpp"

/*
    Author:
        Commy2

    Description:
        Assigns curator to the game masters.

    Arguments:
        -

    Example:
        call MF_curator_fnc_assignCurator

    Returns:
        void
*/

if !(hasInterface) exitWith {};

if !(IS_ADMIN_LOGGED || getPlayerUID player == GETPAVAR(GVARMAIN(missionMaker),"")) exitWith {};

[QGVAR(curatorRegistered), [player]] call CFUNC(serverEvent);
