#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds a restricted ACE Arsenal to an object based on the player's role.

    Arguments:
        0: OBJECT - The object used as the Arsenal

    Example:
        [this] call MF_arsenal_fnc_initArsenal

    Returns:
        void
*/

if (!hasInterface) exitWith {};

params [
    "_object", objectNull, [objectNull]
];
