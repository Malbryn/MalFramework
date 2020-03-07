/*
 * Author:
 * NeilZar
 *
 * Description:
 * Initializes the FPS monitor on the server
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] execVM "mission_framework\root\MF_Admin\performance_check\initFpsCheck.sqf"
 *
 */

if (isServer) then {
    [{
        MF_var_server_fps = diag_fps;
        MF_var_server_fps_min = diag_fpsMin;
        publicVariable "MF_var_server_fps";
        publicVariable "MF_var_server_fps_min";
    }, 2] call CBA_fnc_addPerFrameHandler;
};