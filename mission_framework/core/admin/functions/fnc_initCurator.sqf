#include "..\script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Assigns curator to the game masters at the start of the mission.

    Arguments:
        -

    Example:
        call MF_admin_fnc_initCurator

    Returns:
        void
*/

if !(hasInterface) exitWith {};

[QGVARMAIN(initFramework), {
    if (call FUNC(isGameMaster)) then {
        [QGVAR(onCuratorCreated), player] call CFUNC(serverEvent);
    };
}] call CFUNC(addEventHandler);
