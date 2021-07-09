#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Sets the display of the chemical detector to show the current hazard level.

    Arguments:
        0: SCALAR - Threat level (possible values: 0.00 - 9.99)

    Example:
        [3.6] call MF_cbrn_fnc_setDetectorDisplay

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params ["_threatLevel"];

disableSerialization;

"ThreatDisplay" cutRsc ["RscWeaponChemicalDetector", "PLAIN", 1, false];

private _ui = uiNamespace getVariable "RscWeaponChemicalDetector";
private _obj = _ui displayCtrl 101;

_obj ctrlAnimateModel ["Threat_Level_Source", _threatLevel, true];
