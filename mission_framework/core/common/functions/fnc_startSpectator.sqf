#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Starts the spectator mode according to the selected one in the config.

    Arguments:
        0: BOOLEAN - If every side is available to spectate
        1: BOOLEAN - If free camera is available

    Example:
        [false, false] call MF_common_fnc_startSpectator

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params ["_allowAllSides", "_allowFreeCam"];

private _sidesArray = [[playerSide], []] select _allowAllSides;

if (GVARMAIN(useACESpectator)) then {
    [true, _allowAllSides, _allowFreeCam] call FUNC(initACESpectator);
} else {
    ["Initialize", [player, _sidesArray, false, _allowFreeCam, true, false, true, false, true, true]] call BFUNC(EGSpectator);
};
