#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Set the player's team colour

    Arguments:
        -

    Example:
        call MF_team_colour_fnc_setTeamColour

    Returns:
        void
*/

private ["_teamColour"];

_teamColour = GETVAR(player,GVAR(teamColour),"MAIN");

if (_teamColour != "MAIN") then {
    player assignTeam _teamColour;
};
