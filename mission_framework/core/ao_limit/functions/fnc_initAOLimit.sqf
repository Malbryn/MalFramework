#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        blank

    Arguments:
        -

    Example:
        call MF_blank_fnc_blank

    Returns:
        void
*/

private ["_markers", "_allowedOutside", "_ao"];

if !(hasInterface) exitWith {};

_ao = [];

if !(GVAR(aoMarkerAll) == "") then {
    _ao pushBack [sideLogic, GVAR(aoMarkerAll)];
};

if !(GVAR(aoMarkerBlufor) == "") then {
    _ao pushBack [sideLogic, GVAR(aoMarkerBlufor)];
};

if !(GVAR(aoMarkerRedfor) == "") then {
    _ao pushBack [sideLogic, GVAR(aoMarkerRedfor)];
};

if (count _ao == 0) exitWith {
    MSG("WARNING","AO limit module: No AO was defined in the config");
};

_markers = [];
_allowedOutside = true;
_vehicle = vehicle player;

_ao apply {
    if ((_x#0) == playerSide || (_x#0) == sideLogic) then {
        _markers pushBack _x#1;

        if (_vehicle inArea (_x#1)) then {
            _allowedOutside = true;
        };
    };
};

if (count _markers == 0) exitWith {};

GVAR(aoCheck) = [{
    _this#0 params ["_markers"];
    private ["_vehicle", "_air", "_allowedOutside", "_outside"];

    _vehicle = vehicle player;
    _air = _vehicle isKindOf "Air";
    _allowedOutside = (GVAR(timerLand) < 0 && !_air) || (GVAR(timerAir) < 0 && _air);
    _outside = true;

    _markers apply {
        if (_vehicle inArea _x) exitWith {
            _outside = false;
        };
    };

    _displayed = GETMVAR(GVAR(display),false);
    SETMVAR(GVAR(display),_outside);

    if (_outside) then {
        if (!(_allowedOutside) && !_displayed && (alive _vehicle)) then {
            private _timeLeft = if (_air) then {
                GVAR(timerAir)
            } else {
                GVAR(timerLand)
            };

            SETMVAR(GVAR(timeLeft),_timeLeft);

            cutRsc ["RscAOLimit", "PLAIN", 0.5, false];
        };
    } else {
        _allowedOutside = false;
    };
}, 0.5, [_markers]] call CFUNC(addPerFrameHandler);
