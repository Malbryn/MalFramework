#include "script_component.hpp"

if (isServer) then {
    [{
        GVAR(serverFPS) = parseNumber (diag_fps toFixed 2);

        private _tempMin = parseNumber (diag_fpsMin toFixed 2);
        if (_tempMin < GVAR(serverFPSMin) && CBA_MissionTime > 3) then {
            GVAR(serverFPSMin) = _tempMin;
        };

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

    call FUNC(addCheckPerformanceMenu);

    // Client FPS (disable client FPS check during TvT's)
    if (GVARMAIN(isTvT)) exitWith {};

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

    call FUNC(addPlayerFPSMenu);
};
