#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Monitors the server FPS and if it goes below 15, it sends a notification to the game masters.

    Arguments:
        0: SCALAR - FPS number

    Example:
        [12] call MF_admin_fnc_fpsNotification

    Returns:
        void
*/

if !(hasInterface) exitWith {};

if !(IS_ADMIN_LOGGED || getPlayerUID player == GETPAVAR(GVARMAIN(missionMaker),"")) exitWith {};

params ["_fps"];

private _aiCount = {!isPlayer _x} count allUnits;
private _deadUnits = count allDeadMen;

[COMPONENT_STR, "INFO", format ["Server FPS is low! FPS: %1 | AI count: %2 | Dead units: %3", _fps, _aiCount, _deadUnits], true] call EFUNC(main,log);
