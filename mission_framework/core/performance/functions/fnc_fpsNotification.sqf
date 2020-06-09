#include "script_component.hpp"

/*
    Author:
        NeilZar (modified by Malbryn)

    Description:
        Monitor the server FPS and if it goes below 15, it send a notification to the game masters

    Arguments:
        none

    Example:
        call MF_performance_fnc_fpsNotification

    Returns:
        void
*/

params ["_fps"];
private ["_aiCount", "_deadUnits"];

_aiCount = {!isPlayer _x} count allUnits;
_deadUnits = count allDeadMen;

MSG_3("INFO","Server FPS is low! FPS: %1 | AI count: %2 | Dead units: %3",_fps,_aiCount,_deadUnits);
