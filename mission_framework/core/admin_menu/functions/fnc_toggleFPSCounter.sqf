#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Toggles the FPS counter.

    Arguments:
        -

    Example:
        call MF_admin_menu_fnc_toggleFPSCounter

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Toggle player FPS
call EFUNC(performance,togglePlayerFPS);
