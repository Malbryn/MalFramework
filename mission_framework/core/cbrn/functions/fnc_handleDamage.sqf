#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Handles the damage that is caused to the player.
        At maximum damage it takes 5 minutes to pass out due to bloodloss (3.6 litres).

    Arguments:
        0: OBJECT - Player unit
        1: SCALAR - The strength of the effect (possible values: 0.00 - 9.99)

    Example:
        [player, 3.6] call MF_cbrn_fnc_handleDamage

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params ["_unit", "_damage"];

// Blood volume
private _currentbloodVolume = GETVAR(_unit,ace_medical_bloodVolume,6);
private _newbloodVolume = _currentbloodVolume - (0.008 * (_damage / 10));

SETVAR(_unit,ace_medical_bloodVolume,_newbloodVolume);

// Pain
private _currentPainLevel = GETVAR(_unit,ace_medical_pain,0);
private _newPainLevel = _currentPainLevel + (0.005 * (_damage / 10));

SETVAR(_unit,ace_medical_pain,_newPainLevel);

// Fatigue
private _currentFatigueLevel = GETMVAR(ace_advanced_fatigue_anReserve,2200);
private _newFatigueLevel = _currentFatigueLevel - (6.66 * (_damage / 10));

SETMVAR(ace_advanced_fatigue_anReserve,_newFatigueLevel);
