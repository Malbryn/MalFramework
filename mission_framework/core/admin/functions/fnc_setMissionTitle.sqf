#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Sets the mission title in the Admin Menu.

    Arguments:
        -

    Example:
        call MF_admin_fnc_setMissionTitle

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Exit if the dialog is not visible
if (isNull findDisplay 799) exitWith {};

private _title = format [
    "%1 (%2)",
    briefingName, [missionConfigFile] call BFUNC(overviewAuthor)
];

ctrlSetText [713, _title];
