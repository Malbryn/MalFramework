#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Returns the current system time in the following format: yyyy-mm-dd hh:mm:ss.

    Arguments:
        0: BOOLEAN - Use UTC time (Optional, default: false)

    Example:
        [false] call MF_common_fnc_getSystemTime

    Returns:
        STRING
*/

params [["_useUTC", false]];

_currentTime = [];

if (_useUTC) then {
    _currentTime = systemTimeUTC;
} else {
    _currentTime = systemTime;
};

private _months = _currentTime#1;
if (_months < 10) then {
    _months = format ["0%1", _months];
};

private _days = _currentTime#2;
if (_days < 10) then {
    _days = format ["0%1", _days];
};

private _hours = _currentTime#3;
if (_hours < 10) then {
    _hours = format ["0%1", _hours];
};

private _mins = _currentTime#4;
if (_mins < 10) then {
    _mins = format ["0%1", _mins];
};

private _returnTime = format ["%1-%2-%3 %4:%5", _currentTime#0, _months, _days, _hours, _mins];

_returnTime
