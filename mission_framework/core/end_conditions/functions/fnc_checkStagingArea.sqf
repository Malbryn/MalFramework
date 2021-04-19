#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Checks if the players are inside the staging area.
        If somebody leaves, then it starts the mission timer.

    Arguments:
        -

    Example:
        call MF_end_conditions_fnc_checkStagingArea

    Returns:
        VOID
*/

if !(isServer) exitWith {};

private _stagingArea = GVAR(stagingAreaMarker);

if (_stagingArea == "") exitWith {
    [COMPONENT_STR, "ERROR", "Staging area marker does not exist", true, 2] call EFUNC(main,log);

    GVAR(stagingEnabled) = false;
    publicVariable QGVAR(stagingEnabled);

    [GVAR(checkStaging)] call CFUNC(removePerFrameHandler);
};

// Add the elapsed time to the time limit
GVAR(timeLimit) = GVAR(timeLimitOriginal) + CBA_missionTime;
publicVariable QGVAR(timeLimit);

if (allPlayers findIf {!(_x inArea _stagingArea)} != -1) then {
    [QGVARMAIN(notification_2), ["Info", "Left the staging area.<br/>Starting mission timer."]] call CFUNC(globalEvent);

    GVAR(stagingEnabled) = false;
    publicVariable QGVAR(stagingEnabled);

    [GVAR(checkStaging)] call CFUNC(removePerFrameHandler);
};
