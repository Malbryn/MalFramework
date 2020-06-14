#include "script_component.hpp"

if (!GVARMAIN(moduleArsenal) || GVARMAIN(isTvT)) exitWith {};

if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(addArsenalMenu);
    }] call CFUNC(addEventHandler);
};
