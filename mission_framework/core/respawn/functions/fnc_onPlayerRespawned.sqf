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
cutText  ["", "BLACK FADED", 5, true];

[{
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
    [_unit, _loadout] call MF_gear_fnc_setGear;

    // Set radios
    call MF_tfar_fnc_setChannels;

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

    private _amount = (GETVAR(_unit,EGVAR(respawn_tickets,amount),-1)) - 1;
    [_unit, _amount] call EFUNC(respawn_tickets,setRespawnTickets);

    [format ["Respawns available:<br/>%1", _amount], 2, ace_player, 12] call AFUNC(common,displayTextStructured);
}, [], 1] call CFUNC(waitAndExecute);
