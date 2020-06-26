#include "script_component.hpp"

/*
    Author:
        Malbryn (based on Diwako's script)

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
private _target = objNull;

// Check if empty
if (count _partGroup == 0) exitWith {_target};

_target = _partGroup select (_partGroup findIf {alive _x});

_target
