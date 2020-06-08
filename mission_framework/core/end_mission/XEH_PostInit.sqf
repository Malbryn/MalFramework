#include "script_component.hpp"

[QGVARMAIN(missionEnd), {
    params ["_ending", "_isVictory"];

    [_ending, _isVictory] call FUNC(endMission);
}] call CFUNC(addEventHandler);
