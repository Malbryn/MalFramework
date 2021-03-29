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
    // TODO: CANCEL PENDING TASKS

    // Start countdown progress bar
    // TODO

    // Update listboxes
    call FUNC(updateTaskList);

    // Set text
    call FUNC(setMissionTitle);
    call FUNC(setDebriefingText);
    call FUNC(setPlayerInfo);

    // Block ESC key
    //GVAR(escKeyBlock) = (findDisplay 899) displayAddEventHandler ["KeyDown", "if (((_this select 1) == 1)) then {true};"];
}] call CFUNC(waitUntilAndExecute);
