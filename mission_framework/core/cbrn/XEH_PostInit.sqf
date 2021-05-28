#include "script_component.hpp"

if !(GVARMAIN(moduleCBRN)) exitWith {};

// Start check event
if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(initZoneCheck);
        call FUNC(addDetectorControls);
        call FUNC(initSounds);
    }] call CFUNC(addEventHandler);
};

// Refresh time limit after receiving treatment
["ace_medical_FullHeal", {
    GVAR(timeLimitCurrent) = GVAR(timeLimit);
}] call CFUNC(addEventHandler);
