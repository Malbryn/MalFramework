#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Sets the player's team colour.

    Arguments:
        -

    Example:
        call MF_player_fnc_setTeamColour

    Returns:
        STRING
*/

private _teamColour = GETVAR(player,GVAR(teamColour),"MAIN");

if (_teamColour != "MAIN") then {
    player assignTeam _teamColour;
};

_teamColour
