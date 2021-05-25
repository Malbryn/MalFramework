#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Plays the stand up animation.

    Arguments:
        0: OBJECT - The chair object
        1: OBJECT - The unit who called the action
        2: SCALAR - Action ID
        3: ANY - Additional arguments

    Example:
        [this, player, 2, ""] call MF_common_fnc_standUp

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params ["_target", "_caller", "_actionId", "_arguments"];

// Remove Stand up action
_caller removeAction _actionID;

// Stand up
[QGVAR(playAnim), [_caller, ""]] call CFUNC(globalEvent);

// Offset
//_caller setPosATL (_arguments modelToWorld [1, 0, -0.45]);
_caller setPosATL (getPosATL _arguments);

// Unit is not seated anymore
SETVAR(_caller,GVAR(isSeated),false);

// Reset chair
[_arguments] call FUNC(initChair);
