#include "script_component.hpp"

/*
    Author:
        Perfks (modified by Pax'Jarome)

    Description:
        Displays the "Briefing" diary record for each side.

    Arguments:
        -

    Example:
        call MF_briefing_fnc_setBriefing

    Returns:
        void
*/

if (!hasInterface) exitWith {};

private _briefing = [];

if (playerSide == west) then {
    #include "..\..\..\config\briefing\blufor_briefing.sqf"
} else {
    #include "..\..\..\config\briefing\redfor_briefing.sqf"
};

DISPLAYBRIEFING();
