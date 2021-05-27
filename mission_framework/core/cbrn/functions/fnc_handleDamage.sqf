#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Handles the damage that is caused to the player.
        At maximum damage it takes 10 minutes to lose enough blood to pass out (3.6 litres) and 5 minutes to reach maximum pain level (1).

    Arguments:
        0: OBJECT - Player unit
        0: SCALAR - The strength of the effect (possible values: 0.00 - 9.99)

    Example:
        [player, 3.6] call MF_cbrn_fnc_handleDamage

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params ["_unit", "_damage"];

// Lower blood level
private _currentbloodVolume = GETVAR(_unit,QUOTE(ace_medical_bloodVolume),6);
private _newbloodVolume = _currentBloodLevel - (0.004 * (_damage / 10));

SETVAR(_unit,QUOTE(ace_medical_bloodVolume),_newbloodVolume);

// Cause pain
private _currentPainLevel = GETVAR(_unit,QUOTE(ace_medical_pain),0);
private _newPainLevel = _currentPainLevel + (0.0033 * (_damage / 10));

SETVAR(_unit,QUOTE(ace_medical_pain),_newPainLevel);
