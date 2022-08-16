#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Initialises the setup timer.

    Arguments:
        -

    Example:
        call MF_setup_timer_fnc_initSetupTimer

    Returns:
        void
*/

if !(hasInterface) exitWith {};

if !(isMultiplayer) exitWith {
    [COMPONENT_STR, "ERROR", "Singleplayer session detected, this module will function in multiplayer only", true] call EFUNC(main,log);
};

private _zone = [];

if (GVAR(markerBlufor) != "") then {
    _zone pushBack [west, GVAR(timerBlufor), GVAR(markerBlufor)];
};

if (GVAR(markerRedfor) != "") then {
    _zone pushBack [east, GVAR(timerRedfor), GVAR(markerRedfor)];
};

if (_zone isEqualTo []) exitWith {
    [COMPONENT_STR, "ERROR", "No staging zone marker was defined in the config", true] call EFUNC(main,log);
};

GVAR(marker) = [];

_zone apply {
    if (((_x#0) == playerSide) && (vehicle player) inArea (_x#2)) then {
        GVAR(marker) = [(_x#1), (_x#2)];
    } else {
        (_x#2) setMarkerAlphaLocal 0;
    };
};

if (GVAR(marker) isEqualTo []) exitWith {};

[{!isNil QGVAR(startTime)}, {
    GVAR(pos) = getPosATL (vehicle player);
    GVAR(displayed) = false;

    GVAR(zoneCheck) = [{
        private _startTime = GVAR(startTime);
        private _vehicle = vehicle player;

        if (_vehicle inArea GVAR(marker)#1) then {
            GVAR(pos) = getPosATL _vehicle;
        } else {
            if (((getPos _vehicle) distance [0, 0, 0]) > 10) then {
                _vehicle setPos GVAR(pos);
            };
        };

        private _timeLeft = round (_startTime + (GVAR(marker)#0) - serverTime);

        if (_timeLeft > 0 && !GVAR(displayed)) then {
            GVAR(displayed) = true;
            SETMVAR(GVAR(timeLeft),_timeLeft);

            titleRsc ["RscSetupTimer", "PLAIN", 0.5, false];
        };

        if (_timeLeft <= 0) then {
            GVAR(marker)#1 setMarkerAlphaLocal 0;

            // Remove framehandler
            [GVAR(zoneCheck)] call CFUNC(removePerFrameHandler);

            // Remove GVARs
            GVAR(marker) = nil;
            GVAR(displayed) = nil;
            GVAR(pos) = nil;
            GVAR(startTime) = nil;
        };
    }, 10] call CFUNC(addPerFrameHandler);
}, []] call CFUNC(waitUntilAndExecute);
