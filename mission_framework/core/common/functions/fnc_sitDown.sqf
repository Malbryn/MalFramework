#include "script_component.hpp"

/*
    Author:
        RickOShay, Malbryn

    Description:
        Plays the sit down animation.

    Arguments:
        0: OBJECT - The chair object
        1: OBJECT - The unit who called the action
        2: SCALAR - Action ID
        3: ANY - Additional arguments

    Example:
        [this, player, 2, ""] call MF_common_fnc_sitDown

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params ["_target", "_caller", "_actionId", "_arguments"];

private _dir = (getDir _target) + 180;

// Set player's pos and dir then play anim
_caller setDir _dir;
[QGVAR(playAnim), [_caller, "HubSittingChairUA_move1"]] call CFUNC(globalEvent);
_caller setPosATL (getPosATL _target);

// Assign statuses
SETPVAR(_target,GVAR(isTaken),true);
SETVAR(_caller,GVAR(isSeated),true);

// Remove sit down action & add stand up action
_target removeAction _actionId;
_caller addAction [
    "<t color='#21749c'>Stand up</t>",
    {call FUNC(standUp)},
    _target,
    5,
    false,
    true,
    "",
    "true",
    3
];
