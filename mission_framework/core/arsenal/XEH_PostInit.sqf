#include "script_component.hpp"

if (!GVARMAIN(moduleArsenal) || GVARMAIN(isTvT)) exitWith {};

if (hasInterface) then {
    call FUNC(addArsenalMenu);
};
