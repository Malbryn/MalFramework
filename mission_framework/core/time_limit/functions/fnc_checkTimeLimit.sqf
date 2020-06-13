#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Display the remaining mission time if there's a time limit set

    Arguments:
        -

    Example:
        call MF_time_limit_fnc_checkTimeLimit

    Returns:
        void
*/

private ["_time"];

_timeSeconds = ceil (EGVAR(end_conditions,timeLimit) - CBA_missionTime);
_timeMinutes = ceil (_timeSeconds / 60);

switch true do {
    case (60 < _timeSeconds) : {
        [format ["Remaining time:<br/>%1 minutes", _timeMinutes], 2, ace_player, 12] call AFUNC(common,displayTextStructured);
    };

    case (0 < _timeSeconds && _timeSeconds <= 60) : {
        [format ["Remaining time:<br/>%1 seconds", _timeSeconds], 2, ace_player, 12] call AFUNC(common,displayTextStructured);
    };

    default {
        [format ["Time's up!"], 2, ace_player, 12] call AFUNC(common,displayTextStructured);
    };
};
