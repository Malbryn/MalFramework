#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Toggles the players' FPS display

    Arguments:
        -

    Example:
        call MF_admin_fnc_handlePlayerFPSToggled

    Returns:
        void
*/

if !(hasInterface) exitWith {};

if !(call FUNC(isGameMaster)) exitWith {};

private _toggle = GVAR(toggleFPS);

if (_toggle) then {
    [QGVAR(onClientFPSDisplayChanged), false] call CFUNC(globalEvent);
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
    [QGVAR(onClientFPSDisplayChanged), true] call CFUNC(globalEvent);

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
