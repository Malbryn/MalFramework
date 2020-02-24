/*
 * Author:
 * NeilZar (modified by Malbryn)
 *
 * Description:
 * Monitors the server FPS. If it goes below 15, it sends a notification to the logged in admin.
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] execVM "mission_framework\root\MF_Admin\performance_check\fpsNotification.sqf"
 *
 */

if (hasInterface && serverCommandAvailable "#kick") then {
  [{!isNil "MF_var_server_fps"}, {
    [{
	    if (MF_var_server_fps < 15 && !isServer) then {
	      _aiCount = {!isPlayer _x} count allUnits;
         _deadUnits = count allDeadMen;

		    systemChat format ["[WARNING] Server FPS is low! FPS: %1  |  AI count: %2  |  Dead units: %3", MF_var_server_fps, _aiCount, _deadUnits];
	    };
    }, 3] call CBA_fnc_addPerFrameHandler;
  }] call CBA_fnc_waitUntilAndExecute;
};