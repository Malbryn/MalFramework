#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Calls the reassign Curator module on the server.
        Called from the Admin menu.

    Arguments:
        -

    Example:
        call MF_admin_fnc_reassignCurator

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Reassign Curator
[QGVAR(onCuratorReassigned), [player]] call CFUNC(serverEvent);
