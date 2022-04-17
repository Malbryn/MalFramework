#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Sets the unit's long-range radio to the selected frequency and stereo setting.
        Default channel / freq. table (can be modified in the CBA settings):

        [Long range]
        Channel 1  |  Freq. 69
        Channel 2  |  Freq. 68
        Channel 3  |  Freq. 67
        Channel 4  |  Freq. 66
        Channel 5  |  Freq. 65
        Channel 6  |  Freq. 64
        Channel 7  |  Freq. 63
        Channel 8  |  Freq. 62
        Channel 9  |  Freq. 61

    Arguments:
        0: OBJECT or GROUP - Player unit or group
        1: SCALAR - Channel between 1 and 9 (Optional, default: 1)
        2: SCALAR - Stereo value: 0 - both, 1 - left, 2 - right (Optional, default: 0)

    Example(s):
        [this, 2, 1] call MF_tfar_fnc_initLRRadio

        [this, 3] call MF_tfar_fnc_initLRRadio

    Returns:
        void
*/

params [
    ["_unit", objNull, [objNull, grpNull]],
    ["_channel", 1, [0]],
    ["_stereo", 0, [0]]
];

// Check channel input
if (_channel < 1 || 9 < _channel) then {
    _channel = 1;

    [
        COMPONENT_STR,
        "DEBUG",
        format [
            "Incorrect long-range radio channel (%1) is assigned to unit (%2), reverting to default",
            _channel,
            _unit
        ],
        true,
        1
    ] call EFUNC(main,log);
};

// Check stereo input
if !(_stereo in STEREO_ARRAY) then {
    _stereo = 0;

    [
        COMPONENT_STR,
        "DEBUG",
        format [
            "Incorrect long-range stereo (%1) is assigned to unit (%2), reverting to default",
            _stereo,
            _unit
        ],
        true,
        1
    ] call EFUNC(main,log);
};

// Check if object or group was passed
switch (typeName _unit) do {
    case "OBJECT": {
        if (local _unit) then {
            SETPVAR(_unit,GVAR(lrChannel),_channel);
            SETPVAR(_unit,GVAR(lrStereo),_stereo);
        };
        
        [
            COMPONENT_STR,
            "INFO",
            format [
                "Long-range radio of unit (%1) is set to channel (%2)", _unit, _channel
            ],
            false,
            1
        ] call EFUNC(main,log);
    };

    case "GROUP": {
        // Save the settings in a group variable so JIP players can access it
        SETPVAR(_unit,GVAR(lrChannelGroup),_channel);
        SETPVAR(_unit,GVAR(lrStereoGroup),_stereo);

        (units _unit) apply {
            if (local _x) then {
                SETPVAR(_x,GVAR(lrChannel),_channel);
                SETPVAR(_x,GVAR(lrStereo),_stereo);
            };

            [
                COMPONENT_STR,
                "INFO",
                format [
                    "Long-range radio of unit (%1) is set to channel (%2)", _unit, _channel
                ],
                false,
                1
            ] call EFUNC(main,log);
        };
    };

    default {
        [
            COMPONENT_STR,
            "ERROR",
            format [
                "Wrong input type (%1) of unit (%2), expected Object or Group", typeName _unit, _unit
            ],
            true,
            1
        ] call EFUNC(main,log);
    };
};
