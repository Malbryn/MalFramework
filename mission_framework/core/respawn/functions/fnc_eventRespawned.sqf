#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds an event handler that fires when the player respawns.

    Arguments:
        1: OBJECT - The unit that respawned
        2: OBJECT - The old body of the unit

    Example:
        [player] call MF_respawn_fnc_eventRespawned

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params [["_unit", player], ["_corpse", objNull]];

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

    // Re-assigning gear
    private _role = GETVAR(_unit,EGVAR(gear,currentRole),"");
    private _gear = GETVAR(_unit,EGVAR(gear,currentGear),[]);

    if (count _gear != 0) then {
        _unit setUnitLoadout _gear;
    } else {
        [_unit, _role] call EFUNC(gear,setGear);
    };

    // Reassign insignia
    [{
        params ["_unit"];

        private _insignia = GETVAR(_unit,EGVAR(_unit,insignia),"");
        [QEGVAR(_unit,setInsignia), [_unit, _insignia]] call CFUNC(globalEvent);
    }, [_unit], 3] call CFUNC(waitAndExecute);

    // Set radios
    if GVARMAIN(moduleACRE) then {
        call EFUNC(acre,setChannels);
    } else {
        [QEGVAR(tfar,setRadios)] call CFUNC(localEvent);
    };

    // Reassign curator
    if (call EFUNC(admin,isAdmin)) then {
        [QEGVAR(admin,curatorReassigned), [_unit]] call CFUNC(serverEvent);
    };

    // Snow effect
    if (GVARMAIN(moduleSnowfall) && EGVAR(snowfall,enabled)) then {
        call EFUNC(snowfall,startSnowfall);
    };

    // Delete old body
    if (GVAR(removePlayerCorpses)) then {
        hideBody _corpse;
    };

    // Re-add custom channels
    if (count EGVAR(custom_channel,playerCustomChannels) != 0) then {
        EGVAR(custom_channel,playerCustomChannels) apply {
            _x radioChannelAdd [_unit];
        };
    };

    // Register player's status
    SETVAR(_unit,GVAR(isDead),false);

    // Remaining respawn tickets
    private _tickets = GETVAR(_unit,GVAR(playerTickets),-1);

    if (_tickets == -1) exitWith {};

    [_unit, _tickets - 1] call FUNC(setRespawnTickets);
}, [_unit, _corpse], 1] call CFUNC(waitAndExecute);
