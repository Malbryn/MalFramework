#include "script_component.hpp"

// Server FPS
[QGVAR(fpsWarning), {
    params ["_fps"];

    [_fps] call FUNC(fpsNotification);
}] call CFUNC(addEventHandler);

// Client FPS
[QGVAR(displayFPS), {
    params ["_toggle"];

    if (GVAR(isMonitoring) && _toggle) exitWith {};
    if (!GVAR(isMonitoring) && !_toggle) exitWith {};

    if (_toggle) then {
        GVAR(fpsMonitor) = [{
            SETPVAR(player,GVAR(clientFPS),round diag_fps);
        }, 1] call CFUNC(addPerFrameHandler);

        GVAR(isMonitoring) = true;
    } else {
        [GVAR(fpsMonitor)] call CFUNC(removePerFrameHandler);

        GVAR(isMonitoring) = false;
    }
}] call CFUNC(addEventHandler);

// Curator
if (GVAR(enableCurator) && (!GVARMAIN(isTvT) || {GVARMAIN(isTvT) && GVARMAIN(debugMode)})) then {
    [QGVARMAIN(initFramework), {
        call FUNC(assignCurator);
    }] call CFUNC(addEventHandler);
};

// Add admin menu
call FUNC(addAdminMenu);
