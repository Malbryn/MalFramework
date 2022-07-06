#include "script_component.hpp"

/**************************************************************************************************/
// EVENTS
/**************************************************************************************************/

// Admin state changed
addMissionEventHandler ["OnUserAdminStateChanged", {
    params ["_networkId", "_loggedIn", "_votedIn"];

    [_networkId, _loggedIn, _votedIn] call FUNC(handleAdminStateChanged);
}];

// Admin logged in
[QGVAR(onAdminLoggedIn), {
    params ["_unit"];

    [_unit] call FUNC(handleAdminLoggedIn);
}] call CFUNC(addEventHandler);

// Admin logged out
[QGVAR(onAdminLoggedOut), {
    params ["_unit"];

    [_unit] call FUNC(handleAdminLoggedOut);
}] call CFUNC(addEventHandler);

// Added to admin channel
[QGVAR(onAddedToAdminChannel), {
    params ["_units"];

    [_units] call FUNC(handleAddedToAdminChannel);
}] call CFUNC(addEventHandler);

// Removed from admin channel
[QGVAR(onRemovedFromAdminChannel), {
    params ["_units"];

    [_units] call FUNC(handleRemovedFromAdminChannel);
}] call CFUNC(addEventHandler);

// Curator created
[QGVAR(onCuratorCreated), {
    params ["_unit"];

    [_unit] call FUNC(handleCuratorCreated);
}] call CFUNC(addEventHandler);

// Curator reassigned
[QGVAR(onCuratorReassigned), {
    params ["_unit"];

    [_unit] call FUNC(handleCuratorReassigned);
}] call CFUNC(addEventHandler);


/**************************************************************************************************/
// INIT FUNCTIONS
/**************************************************************************************************/

// Admin array
call FUNC(initGameMasters);

// Admin text channel
call FUNC(initAdminChannel);

// FPS monitoring
call FUNC(initFPSMonitor);
