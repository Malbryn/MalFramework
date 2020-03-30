/*
 * Author:
 * Malbryn
 *
 * Description:
 * Saves the unit's pre-set radio channels
 * Default channel / freq. table:
 * 
 * [Short range]						[Long range]
 * Channel 1  |  Freq. 110				Channel 1  |  Freq. 69
 * Channel 2  |  Freq. 120				Channel 2  |  Freq. 68
 * Channel 3  |  Freq. 130				Channel 3  |  Freq. 67
 * Channel 4  |  Freq. 140				Channel 4  |  Freq. 66
 * Channel 5  |  Freq. 150				Channel 5  |  Freq. 65
 * Channel 6  |  Freq. 160				Channel 6  |  Freq. 64
 * Channel 7  |  Freq. 170				Channel 7  |  Freq. 63
 * Channel 8  |  Freq. 180				Channel 8  |  Freq. 62
 * Channel 9  |  Freq. 190				Channel 9  |  Freq. 70
 *
 * Arguments:
 * _this select 0: OBJECT - Player unit
 * _this select 1: INTEGER - Short range radio channel (between 1 and 9) (Optional, default: -1)
 * _this select 2: INTEGER - Long range radio channel (between 1 and 9) (Optional, default: -1)
 *
 * Return Value:
 * void
 *
 * Example:
 * [this, 6, 3] call MF_fnc_setRadios
 *
 */

params ["_unit", ["_srCh", -1], ["_lrCh", -1]];

if !(local _unit) exitWith {};

// Convert the channel number to an array pointer
_srCh = _srCh - 1;
_lrCh = _lrCh - 1;

private _channels = [_srCh, _lrCh];
_unit setVariable ["MF_radio_channels", _channels];