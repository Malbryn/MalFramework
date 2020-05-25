#include "script_component.hpp"


if (hasInterface) then {
    [QGVAR(fpsWarning), {
        params ["_fps"];

        [_fps] call FUNC(fpsNotification);
    }] call CFUNC(addEventHandler);
};


if (isServer) then {
    [{
        GVAR(serverFPS) = diag_fps;

        if (GVAR(serverFPS) < 20) then {
            [QGVAR(fpsWarning), GVAR(serverFPS)] call CFUNC(globalEvent);
        };
    }, 2] call CFUNC(addPerFrameHandler);
};
