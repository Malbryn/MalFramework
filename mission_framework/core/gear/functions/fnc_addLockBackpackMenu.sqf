#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Creates an ACE self-interaction menu that can be used to lock/unlock the player's backpack.

    Arguments:
        -

    Example:
        call MF_gear_fnc_addLockBackpackMenu

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Lock
private _lockMenu = ['Lock backpack', 'Lock backpack', '\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\backpack_ca.paa', {
    [QGVAR(backpackLocked), [player, true]] call CFUNC(globalEvent);

    ["Backpack locked", 1.5, player, 10] call AFUNC(common,displayTextStructured);
}, {!visibleMap && !isNull unitBackpack player && {isNull objectParent player && !lockedInventory backpackContainer player}}] call AFUNC(interact_menu,createAction);

// Unlock
private _unlockMenu = ['Unlock backpack', 'Unlock backpack', '\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\backpack_ca.paa', {
    [QGVAR(backpackLocked), [player, false]] call CFUNC(globalEvent);

    ["Backpack unlocked", 1.5, player, 10] call AFUNC(common,displayTextStructured);
}, {!visibleMap && !isNull unitBackpack player && {isNull objectParent player && lockedInventory backpackContainer player}}] call AFUNC(interact_menu,createAction);


[player, 1, ["ACE_SelfActions", "ACE_Equipment"], _lockMenu] call AFUNC(interact_menu,addActionToObject);
[player, 1, ["ACE_SelfActions", "ACE_Equipment"], _unlockMenu] call AFUNC(interact_menu,addActionToObject);
