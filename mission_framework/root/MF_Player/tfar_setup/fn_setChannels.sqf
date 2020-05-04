/*
 * Author:
 * Malbryn
 *
 * Description:
 * Sets up the player's radios
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] spawn MF_fnc_setChannels
 *
 */

if (hasInterface) then {
    // Short range
    [{ [] call TFAR_fnc_haveSWRadio }, {
        private _channels = player getVariable ["MF_var_radio_channels", []];

        if (count _channels == 0) exitWith {};

        private _srCh = _channels select 0;

        if (0 <= _srCh && _srCh <= 8) then {
            [(call TFAR_fnc_activeSwRadio), _srCh] call TFAR_fnc_setSwChannel;
        };
    }] call CBA_fnc_waitUntilAndExecute;


    // Long range
    [{ [] call TFAR_fnc_haveLRRadio }, {
        private _channels = player getVariable ["MF_var_radio_channels", []];

        if (count _channels == 0) exitWith {};

        private _lrCh = _channels select 1;

        if (0 <= _lrCh && _lrCh <= 8) then {
            [(call TFAR_fnc_activeLrRadio), _lrCh] call TFAR_fnc_setLrChannel;
        };
    }] call CBA_fnc_waitUntilAndExecute;
};
