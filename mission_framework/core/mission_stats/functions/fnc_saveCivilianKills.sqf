#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Saves the civilian kills in a global variable.

    Arguments:
        -

    Example:
        call MF_mission_stats_fnc_saveCivilianKills

    Returns:
        void
*/

if !(hasInterface) exitWith {};

private ["_text"];

// Checking if there's multiple items in the array otherwise it breaks joinString
if (count GVAR(civilianKills) != 1) then {
    _text = GVAR(civilianKills) joinString "<br/>";
} else {
    _text = format ["%1", GVAR(civilianKills)#0];
};

SETPMVAR(GVAR(civilianKills),_text);
