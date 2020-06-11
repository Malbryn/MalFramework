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

private ["_markers", "_allowedOutside"];

if !(hasInterface) exitWith {};

_ao = [];

_ao set [count _ao, [sideLogic, GVAR(aoMarkerAll)]];
_ao set [count _ao, [west, GVAR(aoMarkerBlufor)]];
_ao set [count _ao, [east, GVAR(aoMarkerRedfor)]];

_markers = [];
_allowedOutside = true;
_vehicle = vehicle player;

{
    if ((_x#0) == playerSide || (_x#0) == sideLogic) then {
        _markers set [count _markers, (_x#1)];

        if (_vehicle inArea (_x#1)) then {
            _allowedOutside = true;
        };
    };
} forEach _ao;

GVAR(aoCheck) = [{
    params ["_markers"];
    private ["_vehicle", "_air", "_allowedOutside", "_outside"];

    _vehicle = vehicle player;
    _air = _vehicle isKindOf "Air";
    _allowedOutside = (GVAR(timerLand) < 0 && !_air) || (GVAR(timerAir) < 0 && _air);
    _outside = true;

    {
        if (_vehicle inArea _x) exitWith {
            _outside = false;
        };
    } forEach _markers;

    _displayed = GETMVAR(GVAR(display),false);
    SETMVAR(GVAR(display),_outside);

    if (_outside) then {
        if (!(_allowedOutside) && !_displayed && (alive _vehicle)) then {
            _timeLeft = if (_air) then {
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
}, 1, _markers] call CFUNC(addPerFrameHandler);
