#include "script_component.hpp"

if !(GVARMAIN(moduleIntroText)) exitWith{};

if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(runIntro);
    }] call CFUNC(addEventHandler);
};
