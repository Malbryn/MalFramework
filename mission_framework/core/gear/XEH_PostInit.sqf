#include "script_component.hpp"

// Add arsenal EH's that overwrite the pre-defined gear (if it's enabled)
if (hasInterface && GVAR(saveGearInArsenal)) then {
    ["ace_arsenal_displayClosed", {
        GVAR(customLoadout) = getUnitLoadout player;
        SETVAR(player,GVAR(currentLoadout),"CUSTOM");
    }] call CFUNC(addEventHandler);

    [missionNamespace, "ArsenalClosed", {
        GVAR(customLoadout) = getUnitLoadout player;
        SETVAR(player,GVAR(currentLoadout),"CUSTOM");
    }] call BFUNC(addScriptedEventHandler);
};
