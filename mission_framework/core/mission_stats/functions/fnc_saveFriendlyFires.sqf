#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Convert and save the friendly fire incidents in a global variable

    Arguments:
        -

    Example:
        call MF_mission_stats_fnc_saveFriendlyFires

    Returns:
        void
*/

private ["_text"];

_text = GVAR(friendlyFires) joinString "<br/>";

SETPMVAR(GVAR(friendlyFires),_text);
