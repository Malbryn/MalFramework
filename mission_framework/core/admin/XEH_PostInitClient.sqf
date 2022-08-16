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
    // -1 == toggle, 0 == turn off, 1 == turn on
    params [
        ["_toggle", -1, [0]]
    ];

    if (_toggle == -1) then {
        call FUNC(handlePlayerFPSToggled);
    } else {
        // Guarantees the turning on or off of FPS counter
        if (_toggle == 0 && {GVAR(toggleFPS)} || {_toggle == 1 && {!GVAR(toggleFPS)}}) then {
            call FUNC(handlePlayerFPSToggled);
        };
    };
}] call CFUNC(addEventHandler);


/**************************************************************************************************/
// INIT FUNCTIONS
/**************************************************************************************************/

// Admin menu
call FUNC(initAdminMenu);

// Curator
call FUNC(initCurator);

// Chat commands
call FUNC(initChatCommands);
