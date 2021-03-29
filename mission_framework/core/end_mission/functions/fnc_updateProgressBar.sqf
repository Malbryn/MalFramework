#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Updates the progress position in the End Screen.

    Arguments:
        0: SCALAR - Current tick

    Example:
        call MF_end_mission_fnc_updateProgressBar

    Returns:
        void
*/

if !(hasInterface) exitWith {};

disableSerialization;

params ["_tick"];

// Update progress bar
private _bar = (findDisplay 899) displayCtrl 808;
_bar progressSetPosition (_tick / SKIPTIME);

// Update text
private _text = format ["Proceeding in %1 seconds...", round (SKIPTIME - _tick)];
ctrlSetText [809, _text];
