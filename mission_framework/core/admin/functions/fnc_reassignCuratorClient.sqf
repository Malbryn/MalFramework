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

if (GVARMAIN(isTvT) && !GVARMAIN(debugMode)) exitWith {
    [
        COMPONENT_STR,
        "INFO",
        "Curator function is not available in TvT missions",
        true
    ] call EFUNC(main,log);
};

if !GVAR(enableCurator) exitWith {
    [
        COMPONENT_STR,
        "INFO",
        "Curator was disabled by the mission maker",
        true
    ] call EFUNC(main,log);
};

// Reassign Curator
[QGVAR(curatorReassigned), [player]] call CFUNC(serverEvent);
