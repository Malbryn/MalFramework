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

if !(call FUNC(isGameMaster)) exitWith {};

[QGVARMAIN(initFramework), {
    [player] call FUNC(createCurator);
}] call CFUNC(addEventHandler);
