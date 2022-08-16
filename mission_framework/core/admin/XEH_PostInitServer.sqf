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

// FPS monitoring
[QGVAR(requestToggleClientFPS), {
    params ["_unit", "_state"];

    GVAR(toggleFPSCounterHashmap) set [getPlayerUID _unit, _state];

    // Save all FPS counter requests
    private _result = false;

    // See if any clients have requested the FPS counter
    {
        _result = _result || _y;
    } forEach GVAR(toggleFPSCounterHashmap);


    if (_result) then {
        // If a client has requested an FPS counter and there is none already running, then turn it on (JIP compatible)
        if (isNil QGVAR(idJIP)) then {
            GVAR(idJIP) = [QGVAR(onClientFPSDisplayChanged), true] call CFUNC(globalEventJIP);
        };
    } else {
        // If no clients have the FPS counter running and there is one running, then turn it off
        if (!isNil QGVAR(idJIP)) then {
            GVAR(idJIP) call CFUNC(removeGlobalEventJIP);
            GVAR(idJIP) = nil;

            [QGVAR(onClientFPSDisplayChanged), false] call CFUNC(globalEvent);
        };
    };
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

GVAR(toggleFPSCounterHashmap) = createHashMap;
