#include "script_component.hpp"

[QGVARMAIN(initFramework), {
    call FUNC(setViewDistance);
}] call CFUNC(addEventHandler);
