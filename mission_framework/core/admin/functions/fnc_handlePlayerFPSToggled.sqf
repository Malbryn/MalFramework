#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Toggles the players' FPS display.

    Arguments:
        -

    Example:
        call MF_admin_fnc_handlePlayerFPSToggled

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Ensure that despite not being a game master, the FPS can be turned off
if (!GVAR(toggleFPS) && {!call FUNC(isGameMaster)}) exitWith {};

if (GVAR(toggleFPS)) then {
    [QGVAR(requestToggleClientFPS), [player, false]] call CFUNC(serverEvent);

    removeMissionEventHandler ["Draw3D", GVAR(fpsEH)];

    GVAR(fpsEH) = nil;
    GVAR(toggleFPS) = false;

    // Log
    [
        COMPONENT_STR,
        "INFO",
        "Client FPS display is OFF",
        true
    ] call EFUNC(main,log);
} else {
    [QGVAR(requestToggleClientFPS), [player, true]] call CFUNC(serverEvent);

    GVAR(fpsEH) = addMissionEventHandler ["Draw3D", {call FUNC(drawFPS)}];
    GVAR(toggleFPS) = true;

    // Log
    [
        COMPONENT_STR,
        "INFO",
        "Client FPS display is ON",
        true
    ] call EFUNC(main,log);
};
