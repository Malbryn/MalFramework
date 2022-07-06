#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Initialises the FPS monitor.

    Arguments:
        -

    Example:
        call MF_admin_fnc_initFPSMonitor

    Returns:
        void
*/

if !(isServer) exitWith {};

[{
    GVAR(serverFPS) = parseNumber (diag_fps toFixed 2);

    // Save the lowest framerate
    // Delay it by few seconds to ignore any lag spikes at mission start
    private _tempMin = parseNumber (diag_fpsMin toFixed 2);
    
    if (_tempMin < GVAR(serverFPSMin) && CBA_MissionTime > 5) then {
        GVAR(serverFPSMin) = _tempMin;
    };

    publicVariable QGVAR(serverFPS);
    publicVariable QGVAR(serverFPSMin);

    if (GVAR(serverFPS) < 20) then {
        [QGVAR(onLowFPS), GVAR(serverFPS)] call CFUNC(globalEvent);
    };
}, 2] call CFUNC(addPerFrameHandler);
