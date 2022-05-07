#include "script_component.hpp"

// Add arsenal EH's that overwrite the pre-defined gear
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

// Init alternative loadut hash
if GVAR(enableAlternativeLoadout) then {
    GVAR(loadoutHash) = createHashMapFromArray GVAR(loadoutHash);
};

// Init restricted arsenal objects
call FUNC(initRestrictedArsenal);
