#include "script_component.hpp"

/*
    Author:
        Kex (based on cobra4v320's AI HALO Jump script)

    Description:
        Add a parachute to the unit then delete it once the unit is on the ground

    Arguments:
        0: OBJECT - Unit that performs the HALO drop

    Example:
        [player] call MF_reinsert_fnc_addParachute

    Returns:
        void
*/

params ["_unit"];

private ["_backpackClass"];

_backpackClass = backpack _unit;

// If the unit already has a chute
if (backpack _unit != "" and {getText (configfile >> "CfgVehicles" >> backpack _unit >> "backpackSimulation") isEqualTo "ParachuteSteerable"}) then {
    _backpackClass = "";
};

if (_backpackClass != "") then {
    private ["_container", "_weaponCargo", "_magazineCargo", "_itemCargo", "_packHolder"];

    _container = backpackContainer _unit;
    _weaponCargo = getWeaponCargo _container;
    _magazineCargo = getMagazineCargo _container;
    _itemCargo = getItemCargo _container;

    removeBackpack _unit;
    _unit addBackpack "b_parachute";
    _packHolder = createVehicle ["groundWeaponHolder", [0,0,0], [], 0, "can_collide"];
    _packHolder addBackpackCargoGlobal [_backpackClass, 1];

    [{animationState _unit == "HaloFreeFall_non" or (!alive _unit)}, {
        params ["_packHolder", "_unit", "_backpackClass", "_container", "_weaponCargo", "_magazineCargo", "_itemCargo"];

        _packHolder attachTo [_unit, [-0.12, -0.02, -.74], "pelvis"];
        [_packHolder, [[0, -1, -0.05], [0, 0, -1]]] remoteExecCall ["setVectorDirAndUp", 0, _packHolder];

        [{animationState _unit == "para_pilot" or (!alive _unit)}, {
            params ["_packHolder", "_unit", "_backpackClass", "_container", "_weaponCargo", "_magazineCargo", "_itemCargo"];

            _packHolder attachTo [vehicle _unit, [-0.07, 0.67, -0.13], "pelvis"];
            [_packHolder, [[0, -0.2, -1], [0, 1, 0]]] remoteExecCall ["setVectorDirAndUp", 0, _packHolder];

            [{isTouchingGround _unit or (getPos _unit#2) < 1 or (!alive _unit)}, {
                params ["_packHolder", "_unit", "_backpackClass", "_container", "_weaponCargo", "_magazineCargo", "_itemCargo"];

                removeBackpack _unit;
                deleteVehicle _packHolder;
                _unit addBackpack _backpackClass;
                clearAllItemsFromBackpack _unit;
                _container = backpackContainer _unit;
                {_container addWeaponCargo [_x, (_weaponCargo#1) select _forEachIndex]} forEach (_weaponCargo#0);
                {_container addMagazineCargo [_x, (_magazineCargo#1) select _forEachIndex]} forEach (_magazineCargo#0);
                {_container addItemCargo [_x, (_itemCargo#1) select _forEachIndex]} forEach (_itemCargo#0);
            }, [_packHolder, _unit, _backpackClass, _container, _weaponCargo, _magazineCargo, _itemCargo]] call CFUNC(waitUntilAndExecute);
        }, [_packHolder, _unit, _backpackClass, _container, _weaponCargo, _magazineCargo, _itemCargo]] call CFUNC(waitUntilAndExecute);
    }, [_packHolder, _unit, _backpackClass, _container, _weaponCargo, _magazineCargo, _itemCargo]] call CFUNC(waitUntilAndExecute);

} else {
    _unit addBackpack "b_parachute";

    [{isTouchingGround _unit or (getPos _unit#2) < 1 or (!alive _unit)}, {
        removeBackpack _unit;
    }, []] call CFUNC(waitUntilAndExecute);
};
