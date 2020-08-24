#include "script_component.hpp"

if (isServer) then {
    [{
        GVAR(serverFPS) = parseNumber (diag_fps toFixed 2);
        GVAR(serverFPSMin) = parseNumber (diag_fpsMin toFixed 2);
        publicVariable QGVAR(serverFPS);
        publicVariable QGVAR(serverFPSMin);

        if (GVAR(serverFPS) < 20) then {
            [QGVAR(fpsWarning), GVAR(serverFPS)] call CFUNC(globalEvent);
        };
    }, 2] call CFUNC(addPerFrameHandler);
};

if (hasInterface) then {
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

    // Menus
    call FUNC(addCheckPerformanceMenu);
    call FUNC(addPlayerFPSMenu);
};
