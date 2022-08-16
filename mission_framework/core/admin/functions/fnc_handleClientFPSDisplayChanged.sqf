#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Handles the displaying of client FPS in 3D.
        If the state is true, the client FPS will be transmitted over the network.

    Arguments:
        0: BOOLEAN - If the FPS counter is visible

    Example:
        [true] call MF_admin_fnc_handleClientFPSDisplayChanged

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params [
    ["_toggle", false, [true]]
];

// Check state, exit if current and requested states are the same
if (GVAR(isMonitoring) && _toggle) exitWith {};
if (!GVAR(isMonitoring) && !_toggle) exitWith {};

if (_toggle) then {
    // Start monitoring the client FPS
    GVAR(fpsMonitor) = [{
        SETPVAR(player,GVAR(clientFPS),round diag_fps);
    }, 1] call CFUNC(addPerFrameHandler);

    GVAR(isMonitoring) = true;
} else {
    // Stop  monitoring the client FPS
    [GVAR(fpsMonitor)] call CFUNC(removePerFrameHandler);

    GVAR(isMonitoring) = false;
};
