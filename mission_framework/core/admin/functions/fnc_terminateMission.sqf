#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Terminates the mission.
        To be executed from the Admin menu.

    Arguments:
        -

    Example:
        call MF_admin_fnc_terminateMission

    Returns:
        void
*/

if !(hasInterface) exitWith {};

[] spawn {
    private _confirm = [
        "Are you sure you want to terminate the mission?", 
        "Confirm action",
        true,
        true,
        findDisplay 799
    ] call BFUNC(guiMessage);

    if (_confirm) then {
        [
            QEGVAR(end_mission,callMission),
            [
                "MissionTerminated",
                false,
                playerSide
            ]
        ] call CFUNC(serverEvent);

        // Close the dialog
        [{!isNull findDisplay 799}, {
            [QGVAR(onAdminMenuClosed)] call CFUNC(localEvent);
        }] call CFUNC(waitUntilAndExecute);
    };
};
