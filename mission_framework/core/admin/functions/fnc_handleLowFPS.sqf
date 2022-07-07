#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Displays a message about low server FPS along with the AI count and the number of dead objects.

    Arguments:
        0: SCALAR - Current server FPS

    Example:
        [12] call MF_admin_fnc_handleLowFPS

    Returns:
        void
*/

if !(hasInterface) exitWith {};

if !(call FUNC(isGameMaster)) exitWith {};

params [
    ["_fps", -1, [0]]
];

private _aiCount = { !isPlayer _x } count allUnits;
private _deadUnits = count allDeadMen;

// Log
[
    COMPONENT_STR,
    "INFO",
    format [
        "Server FPS is low! FPS: %1 | AI count: %2 | Dead units: %3",
        _fps, _aiCount, _deadUnits
    ],
    true,
    1
] call EFUNC(main,log);
