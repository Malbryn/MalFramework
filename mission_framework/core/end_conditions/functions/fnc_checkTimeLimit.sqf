#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Displays the remaining mission time if there's a time limit set.

    Arguments:
        -

    Example:
        call MF_end_conditions_fnc_checkTimeLimit

    Returns:
        void
*/

if !(hasInterface) exitWith {};

private _timeSeconds = ceil (GVAR(timeLimit) - CBA_missionTime);
private _timeMinutes = ceil (_timeSeconds / 60);

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
