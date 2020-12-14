#include "script_component.hpp"

if (!GVARMAIN(moduleIntel) || GVARMAIN(isTvT)) exitWith {};

if (hasInterface) then {
    [QGVARMAIN(intelFound), {
        params ["_title", "_text", "_finder", "_isGlobal"];

        [_title, _text, _finder, _isGlobal] call FUNC(addIntelToDiary);
    }] call CFUNC(addEventHandler);
};
