#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Locks/unlocks the unit's backpack.

    Arguments:
        0: OBJECT - The unit
        1: BOOLEAN - State where true = lock / false = unlock (Optional, default: true)

    Example:
        [player, true] call MF_gear_fnc_lockBackpack

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params ["_unit", ["_state", true]];

backpackContainer _unit lockInventory _state;
