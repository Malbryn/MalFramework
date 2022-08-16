#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Calls reinforcements upon request by the CO.

    Arguments:
        -

    Example:
        call MF_respawn_fnc_callReinforcements

    Returns:
        void
*/

if !(hasInterface) exitWith {};

private _deadPlayers = allPlayers select {!alive _x};
private _count = 0;

// Check if the player has respawn tickets left
if (GETVAR(player,EGVAR(respawn,playerTickets),-1) != -1) then { // Respawn tickets are enabled - count players with remaining tickets only
    _deadPlayers apply {
        if (GETVAR(_x,EGVAR(respawn,playerTickets),-1) > 0) then {
            INC(_count);
        };
    };
} else { // Respawn tickets are disabled - count every dead player
    _count = count _deadPlayers;
};

if (_count == 0) exitWith {
    [["There are no dead players or dead players with respawn tickets"], 2, ace_player, 12] call AFUNC(common,displayTextStructured);
};

[["Reinforcements:<br/>%1 player(s)", _count], 2, ace_player, 12] call AFUNC(common,displayTextStructured);

[QGVAR(respawnPlayer), [], _deadPlayers] call CFUNC(targetEvent);

DEC(GVAR(availableWaves));
publicVariable QGVAR(availableWaves);
