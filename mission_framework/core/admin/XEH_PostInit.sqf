#include "script_component.hpp"

if (isServer) then {
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

    [QGVAR(getAdmin), {
        GVAR(currentAdmin) = allPlayers select {(admin (owner _x)) > 0};
        publicVariable QGVAR(currentAdmin);
    }] call CFUNC(addEventHandler);

    GVAR(adminChannelID) = radioChannelCreate [[0.9, 0.2, 0.1, 1], "Admin channel", "Admin chat (%UNIT_NAME)", [], true];
};

if (hasInterface) then {
    // Add admin menu
    call FUNC(addAdminMenu);

    // Server FPS
    [QGVAR(fpsWarning), {
        params ["_fps"];

        [_fps] call FUNC(fpsNotification);
    }] call CFUNC(addEventHandler);

    // Client FPS
    [QGVAR(displayFPS), {
        params ["_toggle"];

        if (GVAR(isMonitoring) && _toggle) exitWith {};
        if (!GVAR(isMonitoring) && !_toggle) exitWith {};

        if (_toggle) then {
            GVAR(fpsMonitor) = [{
                SETPVAR(player,GVAR(clientFPS),round diag_fps);
            }, 1] call CFUNC(addPerFrameHandler);

            GVAR(isMonitoring) = true;
        } else {
            [GVAR(fpsMonitor)] call CFUNC(removePerFrameHandler);

            GVAR(isMonitoring) = false;
        }
    }] call CFUNC(addEventHandler);
};

// Curator events
if (GVAR(enableCurator) && !GVARMAIN(isTvT)) then {
    if (isServer) then {
        [QGVAR(curatorRegistered), {
            params ["_unit"];

            [_unit] call FUNC(createCurator);
        }] call CFUNC(addEventHandler);
        

        [QGVAR(curatorReassigned), {
            params ["_unit"];

            [_unit] call FUNC(reassignCuratorServer);
        }] call CFUNC(addEventHandler);
    };

    if (hasInterface) then {
        [QGVARMAIN(initFramework), {
            call FUNC(assignCurator);
        }] call CFUNC(addEventHandler);
    };
};
