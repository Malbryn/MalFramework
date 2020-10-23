#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Opens the Arsenal.

    Arguments:
        -

    Example:
        call MF_admin_menu_fnc_openArsenal

    Returns:
        void
*/

if !(hasInterface) exitWith {};

if GVARMAIN(isTvT) exitWith {MSG("INFO","The Arsenal function is not available in TvT missions")};

if !GVAR(enableArsenal) exitWith {MSG("INFO","The Arsenal function was disabled by the mission maker")};

// Close dialog
call FUNC(closeAdminMenu);

// Open Arsenal
[player, player, true] call AFUNC(arsenal,openBox);
