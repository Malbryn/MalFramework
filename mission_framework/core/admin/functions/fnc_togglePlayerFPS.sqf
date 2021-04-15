#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Toggles the players' FPS display

    Arguments:
        -

    Example:
        call MF_admin_fnc_togglePlayerFPS

    Returns:
        void
*/

if !(hasInterface) exitWith {};

if !(IS_ADMIN_LOGGED || getPlayerUID player == GETPAVAR(GVARMAIN(missionMaker),"")) exitWith {};

_toggle = GVAR(toggleFPS);

if (_toggle) then {
    [QGVAR(displayFPS), false] call CFUNC(globalEvent);
    removeMissionEventHandler ["Draw3D", GVAR(fpsEH)];
    GVAR(fpsEH) = nil;

    GVAR(toggleFPS) = false;
    [COMPONENT_STR, "INFO", "Client FPS display is OFF", true] call EFUNC(main,log);
} else {
    [QGVAR(displayFPS), true] call CFUNC(globalEvent);
    GVAR(fpsEH) = addMissionEventHandler ["Draw3D", {call FUNC(drawFPS)}];

    GVAR(toggleFPS) = true;
    [COMPONENT_STR, "INFO", "Client FPS display is ON", true] call EFUNC(main,log);
};
