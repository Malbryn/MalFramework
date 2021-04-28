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
        0: OBJECT or GROUP - Player unit or group
        1: SCALAR - Short range radio channel (between 1 and 9) (Optional, default: -1)
        2: SCALAR - Long range radio channel (between 1 and 9) (Optional, default: -1)

    Example:
        [this, 6, 3] call MF_tfar_fnc_setRadios

    Returns:
        void
*/

params [["_unit", objNull], ["_srCh", -1], ["_lrCh", -1]];

switch (typeName _unit) do {
    case "OBJECT": {
        if (local _unit) then {
            private _channels = GETVAR(_unit,GVAR(radioChannels),[ARR_2(-1, -1)]);

            if (_srCh != -1) then { _channels set [0, _srCh - 1] };
            if (_lrCh != -1) then { _channels set [1, _lrCh - 1] };

            SETPVAR(_unit,GVAR(radioChannels),_channels);
        };
    };

    case "GROUP": {
        private _channelsGroup = GETVAR(_unit,GVAR(radioChannels),[ARR_2(-1, -1)]);

        if (_srCh != -1) then { _channelsGroup set [0, _srCh - 1] };
        if (_lrCh != -1) then { _channelsGroup set [1, _lrCh - 1] };

        SETPVAR(_unit,GVAR(radioChannels),_channelsGroup);

        (units _unit) apply {
            if (local _x) then {
                private _channels = GETVAR(_x,GVAR(radioChannels),[ARR_2(-1, -1)]);

                if (_srCh != -1) then { _channels set [0, _srCh - 1] };
                if (_lrCh != -1) then { _channels set [1, _lrCh - 1] };

                SETPVAR(_x,GVAR(radioChannels),_channels);
            };
        };
    };

    default {
        [COMPONENT_STR, "ERROR", format ["Wrong input type (%1), expected Object or Group", typeName _unit], true, 1] call EFUNC(main,log);
    };
};
