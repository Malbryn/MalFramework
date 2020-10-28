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

// Spectators see both sides' briefing
if (side player == sideLogic) exitWith {
    #include "..\..\..\config\briefing\blufor_briefing.sqf"
    #include "..\..\..\config\briefing\redfor_briefing.sqf"
    DISPLAYBRIEFING();
};

if (playerSide == west) then {
    #include "..\..\..\config\briefing\blufor_briefing.sqf"
} else {
    #include "..\..\..\config\briefing\redfor_briefing.sqf"
};

DISPLAYBRIEFING();
