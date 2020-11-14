#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Calls the reassign Curator module on the server.

    Arguments:
        -

    Example:
        call MF_admin_fnc_reassignCuratorClient

    Returns:
        void
*/

if !(hasInterface) exitWith {};

if GVARMAIN(isTvT) exitWith {MSG("INFO","The Curator function is not available in TvT missions")};

if !GVAR(enableCurator) exitWith {MSG("INFO","The Curator function was disabled by the mission maker")};

// Reassign Curator
[QGVAR(curatorReassigned), [player]] call CFUNC(serverEvent);
