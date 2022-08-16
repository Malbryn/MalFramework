#include "script_component.hpp"

/*
    Author:
        Malbryn (based on Diwako's script), johnb43

    Description:
        Selects the next unit in the player's group.

    Arguments:
        0: OBJECT - The player object

    Example:
        [player] call MF_common_fnc_selectTarget

    Returns:
        OBJECT
*/

params ["_playerUnit"];

private _partGroup = (units group _playerUnit) - [_playerUnit];

// Find first alive unit; If none exist, return objNull
_partGroup param [_partGroup findIf {alive _x}, objNull];
