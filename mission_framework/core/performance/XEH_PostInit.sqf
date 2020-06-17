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
    [QGVAR(fpsWarning), {
        params ["_fps"];

        [_fps] call FUNC(fpsNotification);
    }] call CFUNC(addEventHandler);

    call FUNC(addCheckPerformanceMenu);
};
