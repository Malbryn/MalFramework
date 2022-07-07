#include "script_component.hpp"

/**************************************************************************************************/
// EVENTS
/**************************************************************************************************/

// Admin menu closed
[QGVAR(onAdminMenuClosed), {
    call FUNC(handleAdminMenuClosed);
}] call CFUNC(addEventHandler);

// Low FPS notifications
[QGVAR(onLowFPS), {
    params ["_fps"];

    [_fps] call FUNC(handleLowFPS);
}] call CFUNC(addEventHandler);

// Client FPS counter
[QGVAR(onClientFPSDisplayChanged), {
    params ["_toggle"];

    [_toggle] call FUNC(handleClientFPSDisplayChanged);
}] call CFUNC(addEventHandler);

// Client FPS display
[QGVAR(onPlayerFPSToggled), {
    call FUNC(handlePlayerFPSToggled);
}] call CFUNC(addEventHandler);


/**************************************************************************************************/
// INIT FUNCTIONS
/**************************************************************************************************/

// Admin menu
call FUNC(initAdminMenu);

// Init Curator
call FUNC(initCurator);
