#include "script_component.hpp"

if !(GVARMAIN(moduleTimeLimitCheck)) exitWith {};

if (hasInterface) then {
    call FUNC(addTimeLimitCheckMenu);
};
