#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Convert and save the civilian kills in a global variable

    Arguments:
        -

    Example:
        call MF_mission_stats_fnc_saveCivilianKills

    Returns:
        void
*/

private ["_text"];

_text = GVAR(stat_ck) joinString "<br/>";
SETPMVAR(GVAR(civilianKills),_text);
