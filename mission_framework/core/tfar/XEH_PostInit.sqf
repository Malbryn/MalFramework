#include "script_component.hpp"

if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(setChannels);
    }] call CFUNC(addEventHandler);
};

// TODO: Respawn eventhandler
