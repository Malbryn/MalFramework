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

switch (side player) do {
    case west : {
        #include "..\..\..\config\briefing\west_briefing.sqf"
    };

    case east : {
        #include "..\..\..\config\briefing\east_briefing.sqf"
    };

    case independent : {
        #include "..\..\..\config\briefing\independent_briefing.sqf"
    };
};

DISPLAYBRIEFING();
