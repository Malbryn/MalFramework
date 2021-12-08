#include "script_component.hpp"

// Current logged-in admin check
[QGVAR(getAdmin), {
    GVAR(currentAdmin) = allPlayers select {(admin (owner _x)) > 0};
    publicVariable QGVAR(currentAdmin);
}] call CFUNC(addEventHandler);

// Curator
if (GVAR(enableCurator) && (!GVARMAIN(isTvT) || {GVARMAIN(isTvT) && GVARMAIN(debugMode)})) then {
    [QGVAR(curatorRegistered), {
        params ["_unit"];

        [_unit] call FUNC(createCurator);
    }] call CFUNC(addEventHandler);
    

    [QGVAR(curatorReassigned), {
        params ["_unit"];

        [_unit] call FUNC(reassignCuratorServer);
    }] call CFUNC(addEventHandler);
};

// FPS check
[{
    GVAR(serverFPS) = parseNumber (diag_fps toFixed 2);

    // Save the lowest framerate
    // Delay it by few seconds to ignore the usual lag spike at mission start
    private _tempMin = parseNumber (diag_fpsMin toFixed 2);
    if (_tempMin < GVAR(serverFPSMin) && CBA_MissionTime > 5) then {
        GVAR(serverFPSMin) = _tempMin;
    };

    publicVariable QGVAR(serverFPS);
    publicVariable QGVAR(serverFPSMin);

    if (GVAR(serverFPS) < 20) then {
        [QGVAR(fpsWarning), GVAR(serverFPS)] call CFUNC(globalEvent);
    };
}, 2] call CFUNC(addPerFrameHandler);

// Admin text channel
GVAR(adminChannelID) = radioChannelCreate [[0.9, 0.2, 0.1, 1], "Admin channel", "Admin chat (%UNIT_NAME)", [], true];
publicVariable QGVAR(adminChannelID);
