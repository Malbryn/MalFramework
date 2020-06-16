#include "script_component.hpp"

if (isServer && GVARMAIN(isTvT)) then {
    call FUNC(initSides);
    call FUNC(eventPlayerConnected);
    call FUNC(eventPlayerDisconnected);

    [QGVAR(sideValueSet), {
        params ["_side", "_changeTotal", "_changeCurrent", "_changeTickets"];

        [_side, _changeTotal, _changeCurrent, _changeTickets] call FUNC(setSideValue);
    }] call CFUNC(addEventHandler);
};

if (hasInterface && GVARMAIN(isTvT) && didJIP) then {
    [QGVAR(sideValueSet), [playerSide, 1, 1, 0]] call CFUNC(localEvent);
};
