#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds an event handler that fires when the player respawns.

    Arguments:
        1: OBJECT - The unit that died
        2: OBJECT - The old body of the unit

    Example:
        [player] call MF_respawn_fnc_eventRespawned

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params [["_unit", objNull], ["_corpse", objNull]];

// Side update
if (GVARMAIN(isTvT)) then {
    [QEGVAR(common,sideValueSet), [playerSide, 0, 1, 0]] call CFUNC(serverEvent);
};

// Remove radios
call EFUNC(common,removeRadios);

// Screen effects
cutText ["", "BLACK FADED", 5, true];

// Wait for screen effects to finish
[{
    params ["_unit", "_corpse"];

    private ["_loadout", "_tickets"];

    // Screen effects
    cutText  ["", "BLACK IN", 5, true];
    "dynamicBlur" ppEffectEnable true;
    "dynamicBlur" ppEffectAdjust [6];
    "dynamicBlur" ppEffectCommit 0;
    "dynamicBlur" ppEffectAdjust [0.0];
    "dynamicBlur" ppEffectCommit 3;

    // Stop spectator screen
    call EFUNC(common,stopSpectator);

    // Re-assigning gear and insignia
    private _loadout = GETVAR(_unit,EGVAR(gear,currentLoadout),"");
    [_unit, _loadout] call EFUNC(gear,setGear);

    [{
        params ["_unit"];

        private _insignia = GETVAR(_unit,EGVAR(player,insignia),"");
        [QEGVAR(player,setInsignia), [_unit, _insignia]] call CFUNC(globalEvent);
    }, [_unit], 3] call CFUNC(waitAndExecute);

    // Set radios
    if GVARMAIN(moduleACRE) then {
        call EFUNC(acre,setChannels);
    } else {
        call EFUNC(tfar,setChannels);
    };

    // Reassign curator
    if (IS_ADMIN_LOGGED || getPlayerUID _unit == GETPAVAR(GVARMAIN(missionMaker),"")) then {
        [QEGVAR(admin,curatorReassigned), [player]] call CFUNC(serverEvent);
    };

    // Snow effect
    if (GVARMAIN(moduleSnowfall) && EGVAR(snowfall,enabled)) then {
        call EFUNC(snowfall,startSnowfall);
    };

    // Delete old body
    if (GVARMAIN(removePlayerCorpses)) then {
        hideBody _corpse;
    };

    // Re-add custom channels
    if (count EGVAR(custom_channel,playerCustomChannels) != 0) then {
        EGVAR(custom_channel,playerCustomChannels) apply {
            _x radioChannelAdd [_unit];
        };
    };

    // Remaining respawn tickets
    private _tickets = GETVAR(_unit,GVAR(tickets),-1);

    if (_tickets == -1) exitWith {};

    [_tickets] call FUNC(setRespawnTickets);
}, [_unit, _corpse], 1] call CFUNC(waitAndExecute);
