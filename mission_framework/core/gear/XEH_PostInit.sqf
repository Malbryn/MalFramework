#include "script_component.hpp"

// Add arsenal EH's if enabled that overwrite the pre-defined gear
if (hasInterface && GVAR(saveGearInArsenal)) then {
    ["ace_arsenal_displayClosed", {
        GVAR(customLoadout) = getUnitLoadout player;
        SETVAR(player,GVAR(currentLoadout),"CUSTOM");
    }] call CBA_fnc_addEventHandler;

    [missionNamespace, "ArsenalClosed", {
        GVAR(customLoadout) = getUnitLoadout player;
        SETVAR(player,GVAR(currentLoadout),"CUSTOM");
    }] call BIS_fnc_addScriptedEventHandler;
};
