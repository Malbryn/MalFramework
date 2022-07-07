#include "script_component.hpp"

/**************************************************************************************************/
// EVENTS
/**************************************************************************************************/

// Low FPS notifications
[QGVAR(onLowFPS), {
    params ["_fps"];

    [_fps] call FUNC(handleLowFPS);
}] call CFUNC(addEventHandler);

// Client FPS display
[QGVAR(onClientFPSDisplayChanged), {
    params ["_toggle"];

    [_toggle] call FUNC(handleClientFPSDisplayChanged);
}] call CFUNC(addEventHandler);

/**************************************************************************************************/
// INIT FUNCTIONS
/**************************************************************************************************/

// Admin menu
call FUNC(initAdminMenu);

// Init Curator
call FUNC(initCurator);
