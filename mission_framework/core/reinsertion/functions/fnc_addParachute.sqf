#include "script_component.hpp"

/*
    Author:
        Kex (based on cobra4v320's AI HALO Jump script), johnb43

    Description:
        Adds a parachute to the unit then deletes it once the unit is on the ground.

    Arguments:
        0: OBJECT - Unit that performs the HALO drop

    Example:
        [player] call MF_reinsertion_fnc_addParachute

    Returns:
        void
*/

params ["_unit"];

private _backpackClass = backpack _unit;

// If the unit already has a chute
if (_backpackClass != "" && {getText (configfile >> "CfgVehicles" >> _backpackClass >> "backpackSimulation") == "ParachuteSteerable"}) then {
    _backpackClass = "";
};

// If the unit doesn't have a chute, give one to unit
if (_backpackClass != "") then {
    // This script does not account for backpacks within backpacks
    private _container = backpackContainer _unit;
    private _weaponItemsCargo = weaponsItemsCargo _container;
    private _magazinesAmmoCargo = magazinesAmmoCargo _container;
    private _itemCargo = getItemCargo _container;

    // Add parachute to unit
    removeBackpack _unit;
    _unit addBackpack "B_Parachute";

    private _packHolder = createVehicle ["groundWeaponHolder", [0, 0, 0], [], 0, "CAN_COLLIDE"];
    _packHolder addBackpackCargoGlobal [_backpackClass, 1];

    // If player has changes into free fall animation, add old backpack model to the front of the player and attach it there
    [{animationState (_this#1) == "HaloFreeFall_non" || !(alive (_this#1))}, {
        params ["_packHolder", "_unit"];

        _packHolder attachTo [_unit, [-0.12, -0.02, -0.74], "pelvis"];
        [_packHolder, [[0, -1, -0.05], [0, 0, -1]]] remoteExecCall ["setVectorDirAndUp", 0, _packHolder];

        // If unit has deployed parachute (or has crashed, but survived), change attaching position of the backpack
        [{animationState (_this#1) == "para_pilot" || isTouchingGround (_this#1) || (getPos (_this#1))#2 < 1 || !(alive (_this#1))}, {
            params ["_packHolder", "_unit"];

            _packHolder attachTo [vehicle _unit, [-0.07, 0.67, -0.13], "pelvis"];
            [_packHolder, [[0, -0.2, -1], [0, 1, 0]]] remoteExecCall ["setVectorDirAndUp", 0, _packHolder];

            // When unit lands, remove parachute as well as backpack displayed on the unit's front and add old backpack on unit's back
            [{isTouchingGround (_this#1) || (getPos (_this#1))#2 < 1 || !(alive (_this#1))}, {
                params ["_packHolder", "_unit", "_backpackClass", "_weaponItemsCargo", "_magazinesAmmoCargo", "_itemCargo"];
                _itemCargo params ["_items", "_itemsCount"];

                removeBackpack _unit;
                deleteVehicle _packHolder;

                // Add old backpack, make sure to remove any linked items in class
                _unit addBackpack _backpackClass;
                clearAllItemsFromBackpack _unit;

                // Add all old items back
                private _container = backpackContainer _unit;

                {
                    _container addWeaponWithAttachmentsCargoGlobal [_x, 1];
                } forEach _weaponItemsCargo;

                {
                    _container addMagazineAmmoCargo [_x select 0, 1, _x select 1];
                } forEach _magazinesAmmoCargo;

                {
                    _container addItemCargoGlobal [_x, _itemsCount select _forEachIndex];
                } forEach _items;
            }, _this] call CFUNC(waitUntilAndExecute);
        }, _this] call CFUNC(waitUntilAndExecute);
    }, [_packHolder, _unit, _backpackClass, _weaponItemsCargo, _magazinesAmmoCargo, _itemCargo]] call CFUNC(waitUntilAndExecute);
} else {
    // If the unit already has one, don't do anything except remove the backpack when he lands
    _unit addBackpack "B_Parachute";

    [{isTouchingGround _this || (getPos _this)#2 < 1 || (!alive _this)}, {
        removeBackpack _this;
    }, _unit] call CFUNC(waitUntilAndExecute);
};
