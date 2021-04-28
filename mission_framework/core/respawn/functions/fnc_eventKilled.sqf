#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds an event handler that fires when the player dies.

    Arguments:
        1: OBJECT - The unit that died

    Example:
        [player] call MF_respawn_fnc_eventKilled

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params ["_unit"];

// Set timer
setPlayerRespawnTime 10e10;

// Save the killer
private _killer = GETVAR(player,ace_medical_lastDamageSource,objNull);

// Log friendly fire
if (isPlayer _killer && (side _killer) == playerSide) then {
    [QEGVAR(admin,logFF), [name player, name _killer]] call CFUNC(globalEvent);
};

// Side update
if (GVARMAIN(isTvT)) then {
    switch playerSide do {
        case west : {
            private _side = EGVAR(common,sideBlufor);

            if (0 < _side#2) then {
                [QEGVAR(common,sideValueSet), [playerSide, 0, -1, -1]] call CFUNC(serverEvent);
            } else {
                [QEGVAR(common,sideValueSet), [playerSide, 0, -1, 0]] call CFUNC(serverEvent);
            };
        };

        case east : {
            private _side = EGVAR(common,sideRedfor);

            if (0 < _side#2) then {
                [QEGVAR(common,sideValueSet), [playerSide, 0, -1, -1]] call CFUNC(serverEvent);
            } else {
                [QEGVAR(common,sideValueSet), [playerSide, 0, -1, 0]] call CFUNC(serverEvent);
            };
        };

        default {
            [COMPONENT_STR, "ERROR", format ["Cannot calculate side tickets, invalid side of player (%1)", playerSide], true] call EFUNC(main,log);
        };
    };
};

// Screen effects
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [0];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 6;

[{
    params ["_unit", "_killer"];

    cutText  ["", "BLACK OUT", 5, true];

    [{
        params ["_unit", "_killer"];

        // Save death location of the player
        SETVAR(player,EGVAR(reinsertion,deathPos),getPos player);

        if (GETVAR(player,GVAR(tickets),-1) == 0 || (GVARMAIN(moduleWaveRespawn) && EGVAR(respawn_wave,availableWaves) == 0)) then {
            // Check if the mission is ending
            if (EGVAR(end_mission,outroIsRunning)) exitWith {
                setPlayerRespawnTime 10e10;
            };

            // Init spectator screen
            if (GVARMAIN(useACESpectator)) then {
                [true, true, true] call EFUNC(common,initACESpectator);
            } else {
                ["Initialize", [player, [], false, true, true, false, true, false, true, true]] call BFUNC(EGSpectator);
            };

            if (GETVAR(player,GVAR(tickets),-1) == 0) then {
                [QGVARMAIN(notification_2), ["Warning", "You have no more respawn tickets!"]] call CFUNC(localEvent);
            };

            if (EGVAR(respawn_wave,availableWaves) == 0) then {
                [QGVARMAIN(notification_2), ["Warning", "No more reinforcement wave remaining!"]] call CFUNC(localEvent);
            };

            // Screen effects
            cutText  ["", "BLACK IN",  3, true];
            "dynamicBlur" ppEffectAdjust [0];
            "dynamicBlur" ppEffectCommit 3;

            // SL module transfer
            if (GETVAR(player,EGVAR(player,isSL),false) && GVARMAIN(moduleRP)) then {
                private _target = [player] call EFUNC(common,selectTarget);

                if (_target != objNull && {!(GETVAR(_target,EGVAR(player,isSL),false))}) then {
                    SETPVAR(_target,EGVAR(player,isSL),true);
                    [QEGVAR(reinsertion,transferRP), [], _target] call CFUNC(targetEvent);
                    [QGVARMAIN(notification_2), ["Info", "You can now deploy the squad rally point"], _target] call CFUNC(targetEvent);
                };
            };

            // CO modules transfer
            if (GETVAR(player,EGVAR(player,isCO),false) && (GVARMAIN(moduleSupplyDrop) || GVARMAIN(moduleRetreat) || GVARMAIN(moduleWaveRespawn))) then {
                private _target = [player] call EFUNC(common,selectTarget);

                if (_target != objNull && {!(GETVAR(_target,EGVAR(player,isCO),false))}) then {
                    SETPVAR(_target,EGVAR(player,isCO),true);
                    [QGVARMAIN(notification_2), ["Info", "You are now in charge of the platoon"], _target] call CFUNC(targetEvent);

                    if (GVARMAIN(moduleSupplyDrop)) then {
                        [QEGVAR(supply_drop,transferSD), [], _target] call CFUNC(targetEvent);
                    };

                    if (GVARMAIN(moduleRetreat)) then {
                        [QEGVAR(retreat,transferSC), [], _target] call CFUNC(targetEvent);
                    };

                    if (GVARMAIN(moduleHAB)) then {
                        [QEGVAR(reinsertion,transferHAB), [], _target] call CFUNC(targetEvent);
                    };

                    if (GVARMAIN(moduleWaveRespawn)) then {
                        [QEGVAR(respawn_wave,transferWR), [], _target] call CFUNC(targetEvent);
                    };
                };
            };

            // Killcam
            if (GVARMAIN(moduleKillcam)) then {
                [player, _killer] call EFUNC(killcam,initKillcam);
            };

        } else {

            if !(GVARMAIN(moduleWaveRespawn)) then {
                setPlayerRespawnTime GVARMAIN(respawnTimer);
            };

            // Check if the mission is ending
            if (EGVAR(end_mission,outroIsRunning)) exitWith {
                setPlayerRespawnTime 10e10;
            };

            // Init the complainer mode
            if (GVARMAIN(useACESpectator)) then {
                [true] call EFUNC(common,initACESpectator);
            } else {
                ["Initialize", [player, [playerSide], false, false, true, false, true, false, false, true]] call BFUNC(EGSpectator);
            };

            cutText  ["", "BLACK IN",  3, true];
            "dynamicBlur" ppEffectAdjust [0];
            "dynamicBlur" ppEffectCommit 3;
        };

        // Disable snow effect
        if (GVARMAIN(moduleSnowfall)) then {
            [EGVAR(snowfall,snowfallPFH)] call CFUNC(removePerFrameHandler);
        };
    }, [_unit, _killer], 5] call CFUNC(waitAndExecute);
}, [_unit, _killer], 1] call CFUNC(waitAndExecute);
