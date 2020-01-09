/*
 * Author:
 * Malbryn
 *
 * Description:
 * Adds different options to an object ("TP pole") for reinsertion
 *
 * Arguments:
 * _this select 0: OBJECT - Object that acts as a TP pole
 *
 * Return Value:
 * void
 *
 * Example:
 * [this] call MF_fnc_reinsertCore
 *
 */

if (!hasInterface) exitWith {};

params ["_pole"];

// Option #1 - Paradrop
if (MF_var_use_para) then {
    _pole addAction ["Reinsert - Paradrop", {
        cutText ["You are being paradropped back into the AO", "BLACK OUT", 2, true];
        uiSleep 3;
        player setPos (player getVariable "MF_var_death_pos");
        player setPosATL [getposATL player select 0, getpos player select 1, 1000];
        [player] spawn MF_fnc_addParachute;
        cutText ["", "BLACK IN", 2, true];
    }];
};

// Option #2 - MRV
if (MF_var_use_mrv) then {
    _pole addAction ["Reinsert - MRV", {
        cutText ["You are being reinserted back to the AO", "BLACKOUT", 2, true];
        uiSleep 3;
        _mrv = missionNamespace getVariable "MF_var_mrv";
        player moveInCargo _mrv;
        cutText ["", "BLACK IN", 2, true];
    }];
};
