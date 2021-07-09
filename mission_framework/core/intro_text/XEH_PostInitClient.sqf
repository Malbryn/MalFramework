#include "script_component.hpp"

if !(GVARMAIN(moduleIntroText)) exitWith {};

// Run intro at mission start
[QGVARMAIN(initFramework), {
    call FUNC(runIntro);
}] call CFUNC(addEventHandler);
