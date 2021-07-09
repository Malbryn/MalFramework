#include "script_component.hpp"

[QGVARMAIN(initFramework), {
    if (GVARMAIN(isTvT)) then {
        // Disconnected event
        call FUNC(eventHandleDisconnect);
    };
}] call CFUNC(addEventHandler);

[QGVAR(sideValueSet), {
    params ["_side", "_changeTotal", "_changeCurrent", "_changeTickets"];

    [_side, _changeTotal, _changeCurrent, _changeTickets] call FUNC(setSideValue);
}] call CFUNC(addEventHandler);
