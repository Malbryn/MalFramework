#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Set up the player's radios

    Arguments:
        -

    Example:
        call MF_tfar_fnc_setChannels

    Returns:
        void
*/

// Short range
[{ [] call TFUNC(haveSWRadio) }, {
    private ["_channels", "_srCh"];

    _channels = GETVAR(player,GVAR(radioChannels),[]);

    if (count _channels == 0) exitWith {};

    _srCh = _channels#0;

    if (0 <= _srCh && _srCh <= 8) then {
        [(call TFUNC(activeSwRadio)), _srCh] call TFUNC(setSwChannel);
    };
}] call CFUNC(waitUntilAndExecute);

// Long range
[{ [] call TFUNC(haveLRRadio) }, {
    private ["_channels", "_lrCh"];

    _channels = GETVAR(player,GVAR(radioChannels),[]);

    if (count _channels == 0) exitWith {};

    _lrCh = _channels#1;

    if (0 <= _lrCh && _lrCh <= 8) then {
        [(call TFUNC(activeLrRadio)), _lrCh] call TFUNC(setLrChannel);
    };
}] call CFUNC(waitUntilAndExecute);
