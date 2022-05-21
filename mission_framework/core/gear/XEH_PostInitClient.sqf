#include "script_component.hpp"

if !(GVARMAIN(moduleGear)) exitWith {};

// Add arsenal EH's that overwrite the pre-defined gear
if GVAR(saveGearInArsenal) then {
    ["ace_arsenal_displayClosed", {
        [player, "CUSTOM"] call FUNC(saveGear);
    }] call CFUNC(addEventHandler);

    [missionNamespace, "ArsenalClosed", {
        [player, "CUSTOM"] call FUNC(saveGear);
    }] call BFUNC(addScriptedEventHandler);
};

// Init alternative loadut hash
if GVAR(enableAlternativeLoadouts) then {
    [GVAR(loadoutHash)] call FUNC(createLoadoutHashMap);
};

// Init restricted arsenal objects
if GVAR(useArsenalWhitelist) then {
    call FUNC(initRestrictedArsenalObjects);
};
