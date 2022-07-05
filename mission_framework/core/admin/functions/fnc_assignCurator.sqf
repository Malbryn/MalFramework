#include "..\script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Assigns curator to the game masters.

    Arguments:
        -

    Example:
        call MF_admin_fnc_assignCurator

    Returns:
        void
*/

if !(hasInterface) exitWith {};

if !(call FUNC(isAdmin)) exitWith {};

[QGVAR(curatorRegistered), [player]] call CFUNC(serverEvent);
