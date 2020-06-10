#include "script_component.hpp"

if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(setTeamColour);
    }] call CFUNC(addEventHandler);
};
