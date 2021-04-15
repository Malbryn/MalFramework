#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Refreshes the values when the end mission screen opens.

    Arguments:
        -

    Example:
        call MF_end_mission_fnc_eventEndScreenOpened

    Returns:
        void
*/

if !(hasInterface) exitWith {};

[{!isNull findDisplay 899}, {
    // Start countdown progress bar
    call FUNC(startCountdown);

    // Update list boxes
    call FUNC(updateTaskList);
    call FUNC(updateKillfeed);
    call FUNC(updateFriendlyFires);
    call FUNC(updateCivilianKills);

    // Set text boxes
    call FUNC(setMissionTitle);
    call FUNC(setDebriefingText);
    call FUNC(setPlayerInfo);
    call FUNC(setStats);

    // Block ESC key
    GVAR(escKeyBlock) = (findDisplay 899) displayAddEventHandler ["KeyDown", "if (((_this select 1) == 1)) then {true};"];
}] call CFUNC(waitUntilAndExecute);
