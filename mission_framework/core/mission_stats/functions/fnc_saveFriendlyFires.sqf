#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Saves the friendly fire incidents in a global variable.

    Arguments:
        -

    Example:
        call MF_mission_stats_fnc_saveFriendlyFires

    Returns:
        void
*/

if !(isDedicated) exitWith {};

private ["_text"];

// Checking if there's multiple items in the array otherwise it breaks joinString
if (count GVAR(friendlyFires) != 1) then {
    _text = GVAR(friendlyFires) joinString "<br/>";
} else {
    _text = format ["%1", GVAR(friendlyFires)#0];
};

SETPMVAR(GVAR(friendlyFires),_text);
