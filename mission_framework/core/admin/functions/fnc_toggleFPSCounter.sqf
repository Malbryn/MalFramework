#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Toggles the FPS counter.

    Arguments:
        -

    Example:
        call MF_admin_fnc_toggleFPSCounter

    Returns:
        void
*/

if !(hasInterface) exitWith {};

if (GVARMAIN(isTvT) && !GVARMAIN(debugMode)) exitWith {
    [COMPONENT_STR, "INFO", "The FPS display is not available in TvT missions", true] call EFUNC(main,log);
};

// Toggle player FPS
call FUNC(togglePlayerFPS);
