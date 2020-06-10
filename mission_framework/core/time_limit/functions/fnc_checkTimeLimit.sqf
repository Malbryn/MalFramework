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

_time = ceil ((EGVAR(end_conditions,timeLimit) - CBA_missionTime) / 60);

[format ["Remaining time:<br/>%1 minutes", _time], 2, ace_player, 12] call AFUNC(common,displayTextStructured);
