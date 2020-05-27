#include "script_component.hpp"

/*
    Author:
        Fredrik Eriksson

    Description:
        Add items to the vehicle equipment storage

    Arguments:
        0: OBJECT - Vehicle to add loadout to
        1: ARRAY - Array of items/magazines/weapons/backpacks

    Example:
        [this, [[["Medikit","Toolkit"], [1, 2]], [], [], []]] call MF_vehicle_respawn_fnc_setVehicleInventory

    Returns:
        void
*/

if (!isServer) exitWith {};

params [["_vehicle", objNull, [objNull]], ["_inventoryArray", [], [[]]]];

private ["_itemArray", "_magazineArray", "_weaponArray", "_backpackArray"];

clearItemCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;

_itemArray = _inventoryArray#0;
{
    _vehicle addItemCargoGlobal [_x, ((_itemArray#1) select ((_itemArray#0) find _x))];
} count (_itemArray#0);

_magazineArray = _inventoryArray#1;
{
    _vehicle addMagazineCargoGlobal [_x, ((_magazineArray#1) select ((_magazineArray#0) find _x))];
} count (_magazineArray#0);

_weaponArray = _inventoryArray#2;
{
    _vehicle addWeaponCargoGlobal [_x, ((_weaponArray#1) select ((_weaponArray#0) find _x))];
} count (_weaponArray#0);

_backpackArray = _inventoryArray#3;
{
    _vehicle addBackpackCargoGlobal [_x, ((_backpackArray#1) select ((_backpackArray#0) find _x))];
} count (_backpackArray#0);
