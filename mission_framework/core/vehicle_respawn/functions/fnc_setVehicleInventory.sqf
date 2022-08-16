#include "script_component.hpp"

/*
    Author:
        Fredrik Eriksson, johnb43

    Description:
        Adds items to the vehicle equipment storage.

    Arguments:
        0: OBJECT - Vehicle to add loadout to
        1: ARRAY - Array of items/magazines/weapons/backpacks

    Example:
        [this, [[["Medikit","Toolkit"], [1, 2]], [], [], []]] call MF_vehicle_respawn_fnc_setVehicleInventory

    Returns:
        void
*/

if !(isServer) exitWith {};

params [["_vehicle", objNull, [objNull]], ["_inventoryArray", [], [[]]]];
_inventoryArray params ["_itemArray", "_magazineArray", "_weaponArray", "_backpackArray"];

clearItemCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;

{
    _vehicle addItemCargoGlobal [_x, (_itemArray#1) select _forEachIndex];
} forEach (_itemArray#0);

{
    _vehicle addMagazineCargoGlobal [_x, (_magazineArray#1) select _forEachIndex];
} forEach (_magazineArray#0);

{
    _vehicle addWeaponWithAttachmentsCargoGlobal [_x, 1];
} forEach _weaponArray;

{
    _vehicle addBackpackCargoGlobal [_x, (_backpackArray#1) select _forEachIndex];
} forEach (_backpackArray#0);
