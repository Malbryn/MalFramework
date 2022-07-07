#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds a button to the pause menu that opens the Admin menu.

    Arguments:
        -

    Example:
        call MF_admin_fnc_handlePauseMenuOpened

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// FUNC(isGameMaster) doesn't work here
if !(IS_ADMIN_LOGGED || getPlayerUID player == GETPAVAR(GVARMAIN(missionMaker),"")) exitWith {};

disableSerialization;

params ["_pauseMenu"];

private _button = _pauseMenu ctrlCreate ["RscButtonMenu", 798];
_button ctrlSetPosition [safeZoneX + safeZoneW * 0.0125, safeZoneY + safeZoneH * 0.02777778, safeZoneW * 0.125, safeZoneH * 0.04];
_button ctrlSetScale 0.9;
_button ctrlSetText "Open Admin Menu";
_button ctrlSetBackgroundColor [0.1, 0.1, 0.1, 1];
_button ctrlSetForegroundColor [0.2, 0.2, 0.2, 1];
_button ctrlSetTextColor [0.902, 0.902, 0.902, 1];
_button ctrlSetActiveColor [0.1294, 0.4549, 0.6118, 1];
_button ctrlSetFont "PuristaMedium";
_button ctrlAddEventHandler ["ButtonClick", {
    params ["_ctrl"];
    _display = ctrlParent _ctrl;

    createDialog QGVARMAIN(AdminMenu);
    _display closeDisplay 1;
}];

_button ctrlCommit 0;
