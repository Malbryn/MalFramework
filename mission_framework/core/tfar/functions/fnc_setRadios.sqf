#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Saves the unit's pre-set radio channels.
        Default channel / freq. table:

        [Short range]                        [Long range]
        Channel 1  |  Freq. 110              Channel 1  |  Freq. 69
        Channel 2  |  Freq. 120              Channel 2  |  Freq. 68
        Channel 3  |  Freq. 130              Channel 3  |  Freq. 67
        Channel 4  |  Freq. 140              Channel 4  |  Freq. 66
        Channel 5  |  Freq. 150              Channel 5  |  Freq. 65
        Channel 6  |  Freq. 160              Channel 6  |  Freq. 64
        Channel 7  |  Freq. 170              Channel 7  |  Freq. 63
        Channel 8  |  Freq. 180              Channel 8  |  Freq. 62
        Channel 9  |  Freq. 190              Channel 9  |  Freq. 70

    Arguments:
        0: OBJECT - Player unit
        1: SCALAR - Short range radio channel (between 1 and 9) (Optional, default: -1)
        2: SCALAR - Long range radio channel (between 1 and 9) (Optional, default: -1)

    Example:
        [this, 6, 3] call MF_tfar_fnc_setRadios

    Returns:
        void
*/

params ["_unit", ["_srCh", -1], ["_lrCh", -1]];

if !(local _unit) exitWith {};

// Convert the channel number to an array pointer
if (_srCh != -1) then {
    _srCh = _srCh - 1;
};

if (_lrCh != -1) then {
    _lrCh = _lrCh - 1;
};

private _channels = [_srCh, _lrCh];
SETPVAR(_unit,GVAR(radioChannels),_channels);
