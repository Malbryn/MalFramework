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

// Find first alive unit
private _index = _partGroup findIf {alive _x};

if (_index == -1) exitWith {_target};

// If any was found, then it's the target
_target = _partGroup select _index;

_target
