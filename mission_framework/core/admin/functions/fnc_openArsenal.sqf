#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Opens the Arsenal.

    Arguments:
        -

    Example:
        call MF_admin_fnc_openArsenal

    Returns:
        void
*/

if !(hasInterface) exitWith {};

if (GVARMAIN(isTvT) && !GVARMAIN(debugMode)) exitWith {
    [COMPONENT_STR, "INFO", "Arsenal is not available in TvT missions", true] call EFUNC(main,log);
};

if !GVAR(enableArsenal) exitWith {
    [COMPONENT_STR, "INFO", "Arsenal was disabled by the mission maker", true] call EFUNC(main,log);
};

// Close dialog
call FUNC(closeAdminMenu);

// Open Arsenal
[player, player, true] call AFUNC(arsenal,openBox);
