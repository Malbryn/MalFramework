#include "script_component.hpp"

if (hasInterface) then {
    // Add arsenal EH's that overwrite the pre-defined gear (if it's enabled)
    if GVAR(saveGearInArsenal) then {
        ["ace_arsenal_displayClosed", {
            GVAR(customLoadout) = getUnitLoadout player;
            SETVAR(player,GVAR(currentLoadout),"CUSTOM");
        }] call CFUNC(addEventHandler);

        [missionNamespace, "ArsenalClosed", {
            GVAR(customLoadout) = getUnitLoadout player;
            SETVAR(player,GVAR(currentLoadout),"CUSTOM");
        }] call BFUNC(addScriptedEventHandler);
    };

    // Add lock backpack option (if it's enabled)
    if GVAR(enableBackpackLock) then {
        call FUNC(addLockBackpackMenu);

        [QGVAR(backpackLocked), {
            params ["_unit", "_state"];

            [_unit, _state] call FUNC(lockBackpack);
        }] call CFUNC(addEventHandler);

        // Disable the ACE Extension mod
        if (isClass (configfile >> "CfgVehicles" >> "CAManBase" >> "ACE_Actions" >> "UPSL_aime_inventory_backpack_action_3d")) then {
            [typeOf player, 0, ["UPSL_aime_inventory_backpack_action_3d"]] call AFUNC(interact_menu,removeActionFromClass);
            [typeOf player, 0, ["ACE_MainActions", "UPSL_aime_inventory_backpack_action"]] call AFUNC(interact_menu,removeActionFromClass);
        };
    };
};
