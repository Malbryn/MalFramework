#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds an event handler that fires when the player dies.

    Arguments:
        0: OBJECT - Object the event handler is assigned to
        1: OBJECT - Object that killed the unit, contains the unit itself in case of collisions
        2: OBJECT - Person who pulled the trigger
        3: BOOLEAN - Same as useEffects in setDamage alt syntax

    Example:
        [player] call MF_respawn_fnc_eventKilled

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params [["_unit", player], "_killer", "_instigator", "_useEffects"];

// Set timer
setPlayerRespawnTime 10e10;

// Side update
if (GVARMAIN(isTvT)) then {
    call FUNC(updateSides);
};

// Check friendly-fire
private _killer = GETVAR(player,ace_medical_lastDamageSource,objNull);

if (isPlayer _killer && (side _killer) == playerSide) then {
    [QEGVAR(admin,logFF), [name player, name _killer]] call CFUNC(globalEvent);
};

// Screen effects
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [0];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 6;

// Wait for screen effects to finish
[{
    params ["_unit", "_killer"];

    // Screen effects
    cutText  ["", "BLACK OUT", 5, true];

    [{
        params ["_unit", "_killer"];

        // Set respawn timer
        switch (GVAR(waveRespawn)) do {
            case AUTO: {
                private _diff = (CBA_missionTime - 1) % GVAR(timer);
                setPlayerRespawnTime GVAR(timer) - _diff;
            };
            case MANUAL: {
                [QGVARMAIN(notification_2), ["Info", format ["Remaining respawn waves: %1", GVAR(availableWaves)]]] call CFUNC(localEvent);
            };
            default {
                setPlayerRespawnTime GVAR(timer);
            };
        };

        // Check player tickets
        if (GETVAR(player,GVAR(tickets),-1) == 0) then {
            [QGVARMAIN(notification_2), ["Warning", "You have no more respawn tickets!"]] call CFUNC(localEvent);
            setPlayerRespawnTime 10e10;
        };

        // Check side tickets
        if (GETVAR(player,GVAR(tickets),-1) == 0 || (GVAR(waveRespawn) == MANUAL && GVAR(availableWaves) == 0)) then {
            // Killcam
            if (GVARMAIN(moduleKillcam)) then {
                [player, _killer] call EFUNC(killcam,initKillcam);
            };

            // Transfer leader modules (SL & CO)
            call FUNC(transferLeaderModules);
        };

        // Save death location of the player
        SETVAR(player,EGVAR(reinsertion,deathPos),getPos player);

        // Init spectator screen
        call EFUNC(common,startSpectator);

        // Check if the mission is ending
        if (EGVAR(end_mission,outroIsRunning)) then {
            setPlayerRespawnTime 10e10;
        };

        // Disable snow effect
        if (GVARMAIN(moduleSnowfall)) then {
            [EGVAR(snowfall,snowfallPFH)] call CFUNC(removePerFrameHandler);
        };

        // Screen effects
        cutText  ["", "BLACK IN",  3, true];
        "dynamicBlur" ppEffectAdjust [0];
        "dynamicBlur" ppEffectCommit 3;
    }, [_unit, _killer], 5] call CFUNC(waitAndExecute);
}, [_unit, _killer], 1] call CFUNC(waitAndExecute);
