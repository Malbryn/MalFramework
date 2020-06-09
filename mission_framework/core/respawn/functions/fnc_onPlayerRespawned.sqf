#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Eventhandler for when the player respawns

    Arguments:
        -

    Example:
        call MF_respawn_fnc_playerRespawned

    Returns:
        void
*/

params ["_unit", "_corpse"];

// Screen effects
cutText ["", "BLACK FADED", 5, true];

[{
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
    _loadout = GETVAR(_unit,EGVAR(gear,currentLoadout),"");
    [_unit, _loadout] call EFUNC(gear,setGear);

    // Set radios
    call EFUNC(tfar,setChannels);

    // Reassign curator
    if (IS_ADMIN_LOGGED || getPlayerUID _unit == GETPAVAR(GVARMAIN(missionMaker),"")) then {
        [QEGVAR(curator,reassignCurator), [_unit]] call CFUNC(serverEvent);
    };

    // Snow effect
    if (GVARMAIN(moduleSnowfall)) then {
        call EFUNC(snowfall,startSnowfall);
    };

    // Delete old body
    if (GVARMAIN(bodyRemoval)) then {
        hideBody (_corpse);
    };

    // Remaining respawn tickets
    if (GETVAR(_unit,EGVAR(respawn_tickets,amount),-1)) exitWith {};

    _tickets = (GETVAR(_unit,EGVAR(respawn_tickets,amount),-1)) - 1;
    [_unit, _tickets] call EFUNC(respawn_tickets,setRespawnTickets);

    [format ["Respawns available:<br/>%1", _tickets], 2, ace_player, 12] call AFUNC(common,displayTextStructured);
}, [], 1] call CFUNC(waitAndExecute);
