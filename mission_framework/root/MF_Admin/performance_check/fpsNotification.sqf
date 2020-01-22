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

if (!hasInterface) exitWith {};

if (serverCommandAvailable "#kick") then {
  [{ !isNil "MF_var_server_fps" },
    {[{
	  if (ServerFPS < 15 && !isServer) then {
	    _aiCount = {!isPlayer _x} count allUnits;
		_objCount = count allMissionObjects "All";
		systemChat format ["[WARNING] Server FPS is low! FPS: %1 | AI count: %2 | Obj count: %3", ServerFPS, _aiCount, _objCount];
	  };
    }, 3] call CBA_fnc_addPerFrameHandler;}
  ] call CBA_fnc_waitUntilAndExecute;
};