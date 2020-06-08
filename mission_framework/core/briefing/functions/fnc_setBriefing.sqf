#include "script_component.hpp"

/*
    Author:
        Perfks (modified by Pax'Jarome)

    Description:
        Display the "Briefing" diary record

    Arguments:
        -

    Example:
        call MF_briefing_fnc_setBriefing

    Returns:
        void
*/

private ["_briefing"];

_briefing = [];

#include "..\..\..\config\briefing\briefing.sqf"

DISPLAYBRIEFING();
