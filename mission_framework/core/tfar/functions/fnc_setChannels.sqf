#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Sets up the player's radios.

    Arguments:
        -

    Example:
        call MF_tfar_fnc_setChannels

    Returns:
        void
*/

private ["_channels", "_srCh", "_lrCh"];

if !(isMultiplayer) exitWith {
	MSG("INFO","(TFAR) The module does not work in single player");
};

private _channels = GETVAR(player,GVAR(radioChannels),[]);

if (count _channels == 0) exitWith {};

private _srCh = _channels#0;
private _lrCh = _channels#1;

// Short range
if (_srCh != -1) then {
    [{call TFUNC(haveSWRadio)}, {
        params ["_channels", "_srCh"];

        if (0 <= _srCh && _srCh <= 8) then {
            [(call TFUNC(activeSwRadio)), _srCh] call TFUNC(setSwChannel);
        };
    }, [_channels, _srCh]] call CFUNC(waitUntilAndExecute);
};

// Long range
if (_lrCh != -1) then {
    [{call TFUNC(haveLRRadio)}, {
        params ["_channels", "_lrCh"];

        if (0 <= _lrCh && _lrCh <= 8) then {
            [(call TFUNC(activeLrRadio)), _lrCh] call TFUNC(setLrChannel);
        };
    }, [_channels, _lrCh]] call CFUNC(waitUntilAndExecute);
};
