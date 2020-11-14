#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Updates the progress position in the Admin Menu.

    Arguments:
        -

    Example:
        call MF_admin_fnc_updateProgressBar

    Returns:
        void
*/

if !(hasInterface) exitWith {};

disableSerialization;

_bar = (findDisplay 799) displayCtrl 719;
_bar progressSetPosition (CBA_missionTime / EGVAR(end_conditions,timeLimit));
