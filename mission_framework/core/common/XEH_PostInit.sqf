#include "script_component.hpp"

if (isServer && GVARMAIN(isTvT)) then {
    [QGVARMAIN(initFramework), {
        call FUNC(eventHandleDisconnect);
    }] call CFUNC(addEventHandler);

    [QGVAR(sideValueSet), {
        params ["_side", "_changeTotal", "_changeCurrent", "_changeTickets"];

        [_side, _changeTotal, _changeCurrent, _changeTickets] call FUNC(setSideValue);
    }] call CFUNC(addEventHandler);
};

if (hasInterface && GVARMAIN(isTvT)) then {
    [QGVARMAIN(initFramework), {
        [QGVAR(sideValueSet), [playerSide, 1, 1, 0]] call CFUNC(serverEvent);
    }] call CFUNC(addEventHandler);
};
