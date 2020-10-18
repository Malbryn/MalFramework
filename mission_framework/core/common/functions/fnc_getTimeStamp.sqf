#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Converts seconds to a simple timestamp format (hh:mm:ss).

    Arguments:
        0: SCALAR - Seconds that need to be converted

    Example:
        [3600] call MF_common_fnc_getTimeStamp

    Returns:
        STRING
*/

params [["_inputRaw", 0]];

private _input = ceil _inputRaw;

private _secs = _input % 60;
if (_secs < 10) then {
    _secs = format ["0%1", _secs];
};

private _mins = floor ((_input / 60) % 60);
if (_mins < 10) then {
    _mins = format ["0%1", _mins];
};

private _hours = floor (((_input / 60) / 60) % 24);
if (_hours < 10) then {
    _hours = format ["0%1", _hours];
};

private _output = format ["%1:%2:%3", _hours, _mins, _secs];

_output
