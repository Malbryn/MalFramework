#include "script_component.hpp"

if !(GVARMAIN(moduleCBRN)) exitWith {};

// Init module at mission start
[QGVARMAIN(initFramework), {
    call FUNC(initZoneCheck);
    call FUNC(addDetectorControls);
    call FUNC(initSounds);
}] call CFUNC(addEventHandler);

// Refresh time limit after receiving treatment
["ace_medical_FullHeal", {
    GVAR(timeLimitCurrent) = GVAR(timeLimit);
}] call CFUNC(addEventHandler);

// Mask VFX EH
["loadout", {
    params ["_unit", "_newUnitLoadout", "_oldUnitLoadout"];
    
    if ((goggles _unit) in GVAR(protectiveMasks)) then {
        QGVAR(MaskOverlayRsc) cutRsc ["MaskOverlay", "PLAIN", 0.1, true];
    } else {
        QGVAR(MaskOverlayRsc) cutFadeOut 1;
    };
}, true] call CFUNC(addPlayerEventHandler);
