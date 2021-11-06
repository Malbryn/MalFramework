#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Initialises the AO limit module.

    Arguments:
        -

    Example:
        call MF_ao_limit_fnc_initAOLimit

    Returns:
        void
*/

if !(hasInterface) exitWith {};

private _ao = [];
private _markers = [];
private _allowedOutside = true;
private _vehicle = vehicle player;

if !(GVAR(aoMarkerAll) == "") then {
    _ao pushBack [sideLogic, GVAR(aoMarkerAll)];
};

if !(GVAR(aoMarkerBlufor) == "") then {
    _ao pushBack [west, GVAR(aoMarkerBlufor)];
};

if !(GVAR(aoMarkerRedfor) == "") then {
    _ao pushBack [east, GVAR(aoMarkerRedfor)];
};

if (count _ao == 0) exitWith {
    [COMPONENT_STR, "ERROR", "AO is not defined in the config", true] call EFUNC(main,log);
};

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

    private _vehicle = vehicle player;
    private _air = _vehicle isKindOf "Air";
    private _allowedOutside = (GVAR(timerLand) < 0 && !_air) || (GVAR(timerAir) < 0 && _air);
    private _outside = true;

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

            titleRsc ["RscAOLimit", "PLAIN", 0.5, false];
        };
    } else {
        _allowedOutside = false;
    };
}, 0.5, [_markers]] call CFUNC(addPerFrameHandler);
