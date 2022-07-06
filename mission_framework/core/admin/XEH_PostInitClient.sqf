#include "script_component.hpp"

/**************************************************************************************************/
// EVENTS
/**************************************************************************************************/

// Curator
[QGVARMAIN(initFramework), {
    call FUNC(handleCuratorAssigned);
}] call CFUNC(addEventHandler);

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
