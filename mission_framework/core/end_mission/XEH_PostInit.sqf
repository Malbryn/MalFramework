#include "script_component.hpp"

[QGVARMAIN(missionEnd), {
    params ["_ending", "_isVictory"];

    [_ending, _isVictory, true, true, true] call BFUNC(endMission);
}] call CFUNC(addEventHandler);
