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

// Close dialog
[QGVAR(onAdminMenuClosed), []] call CFUNC(localEvent);

// Open Arsenal
[player, player, true] call AFUNC(arsenal,openBox);
