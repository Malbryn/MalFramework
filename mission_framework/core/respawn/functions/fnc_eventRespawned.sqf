#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds an event handler that fires when the player respawns.

    Arguments:
        -

    Example:
        call MF_respawn_fnc_eventRespawned

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params ["_unit", "_corpse"];

// Side update
if (GVARMAIN(isTvT)) then {
    [QEGVAR(common,sideValueSet), [playerSide, 0, 1, 0]] call CFUNC(serverEvent);
};

// Screen effects
cutText ["", "BLACK FADED", 5, true];

[{
    params ["_unit", "_corpse"];
    private ["_loadout", "_tickets"];

    cutText  ["", "BLACK IN", 5, true];
    "dynamicBlur" ppEffectEnable true;
    "dynamicBlur" ppEffectAdjust [6];
    "dynamicBlur" ppEffectCommit 0;
    "dynamicBlur" ppEffectAdjust [0.0];
    "dynamicBlur" ppEffectCommit 3;

    // Close the spectator mode
    ["Terminate"] call BFUNC(EGSpectator);

    // Load the gear
    private _loadout = GETVAR(_unit,EGVAR(gear,currentLoadout),"");
    [_unit, _loadout] call EFUNC(gear,setGear);

    // Set radios
    call EFUNC(tfar,setChannels);

    // Reassign curator
    if (IS_ADMIN_LOGGED || getPlayerUID _unit == GETPAVAR(GVARMAIN(missionMaker),"")) then {
        [QEGVAR(curator,curatorReassigned), [player]] call CFUNC(serverEvent);
    };

    // Snow effect
    if (GVARMAIN(moduleSnowfall) && EGVAR(snowfall,enabled)) then {
        call EFUNC(snowfall,startSnowfall);
    };

    // Delete old body
    if (GVARMAIN(removePlayerCorpses)) then {
        hideBody (_corpse);
    };

    // Remaining respawn tickets
    if (GETVAR(_unit,EGVAR(respawn_tickets,amount),-1) == -1) exitWith {};

    private _tickets = (GETVAR(_unit,EGVAR(respawn_tickets,amount),-1)) - 1;
    [_unit, _tickets] call EFUNC(respawn_tickets,setRespawnTickets);

    [format ["Respawns available:<br/>%1", _tickets], 2, ace_player, 12] call AFUNC(common,displayTextStructured);
}, [_unit, _corpse], 1] call CFUNC(waitAndExecute);
