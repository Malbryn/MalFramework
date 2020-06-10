#include "..\script_component.hpp"

/*
    Author:
        Commy2

    Description:
        Assign curator to the game masters

    Arguments:
        -

    Example:
        call MF_curator_fnc_assignCurator

    Returns:
        void
*/

if !(IS_ADMIN_LOGGED || getPlayerUID player == GETPAVAR(GVARMAIN(missionMaker),"")) exitWith {};

[QGVARMAIN(registerCurator), [player]] call CFUNC(serverEvent);
