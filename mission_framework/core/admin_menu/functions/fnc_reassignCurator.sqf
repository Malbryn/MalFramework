#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Reassigns the Curator logic.

    Arguments:
        -

    Example:
        call MF_admin_menu_fnc_reassignCurator

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Reassign Curator
[QEGVAR(curator,curatorReassigned), [player]] call CFUNC(serverEvent);
