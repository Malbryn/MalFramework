#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Sets the mission title in the End Screen.

    Arguments:
        -

    Example:
        call MF_end_mission_fnc_setMissionTitle

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Exit if the dialog is not visible
if (isNull findDisplay 899) exitWith {};

private _title = format ["%1 (%2)", briefingName, [missionConfigFile] call BFUNC(overviewAuthor)];
ctrlSetText [801, _title];
