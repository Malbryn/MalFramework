#include "script_component.hpp"

// Mission end call event (Server event) - DEPRECATED
[QGVAR(callMission), {
    params ["_ending", "_isVictory", ["_side", sideUnknown]];

    [_ending, _isVictory, _side] call FUNC(callMission);
}] call CFUNC(addEventHandler);

// Outro event (Global event)
[QGVAR(runOutro), {
    params ["_ending", "_isVictory"];

    [_ending, _isVictory] call FUNC(runOutro);
}] call CFUNC(addEventHandler);

// Mission end event
[QGVAR(endMission), {
    params ["_ending"];

    endMission _ending;
}] call CFUNC(addEventHandler);

// Init kill tracker
call FUNC(initKillTracker);
