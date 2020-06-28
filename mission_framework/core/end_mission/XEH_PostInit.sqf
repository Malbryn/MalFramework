#include "script_component.hpp"

[QGVARMAIN(callMission), {
    params ["_ending", "_isVictory", ["_side", sideUnknown]];

    [_ending, _isVictory, _side] call FUNC(callMission);
}] call CFUNC(addEventHandler);

[QGVARMAIN(missionEnd), {
    params ["_ending", "_isVictory", ["_side", sideUnknown]];

    if (_side == playerSide || _side == sideUnknown) then {
        [_ending, _isVictory, true, true, true] call BFUNC(endMission);
    } else {
        [_ending, !_isVictory, true, true, true] call BFUNC(endMission);
    };
}] call CFUNC(addEventHandler);
