#include "script_component.hpp"

if (isServer && GVARMAIN(isTvT)) then {
    [QGVARMAIN(initFramework), {
        call FUNC(initSides);
        call FUNC(eventPlayerConnected);
        call FUNC(eventPlayerDisconnected);
    }] call CFUNC(addEventHandler);

    [QGVAR(sideSet), {
        params ["_side", "_changeTotal", "_changeCurrent", "_changeTickets"];

        [_side, _changeTotal, _changeCurrent, _changeTickets] call FUNC(setSides);
    }] call CFUNC(addEventHandler);
};
