#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Sets the player's radio frequencies

    Arguments:
        0: STRING - Class name of the radio
        1: SCALAR - Channel number

    Example:
        ["ACRE_PRC343", 2] call MF_acre_fnc_setChannels

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params [["_radio", ""], ["_channel", 1]];

if (_radio != "") then {
    private _array = [_radio, _channel];

    GVAR(channels) pushBackUnique _array;
};

[{call acre_api_fnc_isInitialized}, {
    GVAR(channels) apply {
        [([_x#0] call acre_api_fnc_getRadioByType), _x#1] call acre_api_fnc_setRadioChannel;
    };
}] call CFUNC(waitUntilAndExecute);
