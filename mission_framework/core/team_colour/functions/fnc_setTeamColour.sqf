#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Sets the player's team colour.

    Arguments:
        -

    Example:
        call MF_team_colour_fnc_setTeamColour

    Returns:
        void
*/

private _teamColour = GETVAR(player,GVAR(teamColour),"MAIN");

if (_teamColour != "MAIN") then {
    player assignTeam _teamColour;
};
