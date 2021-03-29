#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Inits a PFH that is linked to the countdown in the End Screen.

    Arguments:
        -

    Example:
        call MF_end_mission_fnc_startCountdown

    Returns:
        void
*/

if !(hasInterface) exitWith {};

private _initTime = CBA_missionTime;

// Countdown until normal mission end
GVAR(countdown) = [{
    private _tick = CBA_missionTime - _this#0;

    if (_tick <= SKIPTIME) then {
        [_tick] call FUNC(updateProgressBar);
    } else {
        [this#1] call CFUNC(removePerFrameHandler);
        endMission "MissionSuccess";
    };
}, 0, _initTime] call CFUNC(addPerFrameHandler);
