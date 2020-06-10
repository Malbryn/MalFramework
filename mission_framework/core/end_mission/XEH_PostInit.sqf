#include "script_component.hpp"

[QGVARMAIN(callMission), {
    params ["_ending", "_isVictory"];

    [_ending, _isVictory] call FUNC(callMission);
}] call CFUNC(addEventHandler);


[QGVARMAIN(missionEnd), {
    params ["_ending", "_isVictory"];

    [_ending, _isVictory, true, true, true] call BFUNC(endMission);
}] call CFUNC(addEventHandler);
