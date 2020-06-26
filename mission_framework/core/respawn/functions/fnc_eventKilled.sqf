#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds an event handler that fires when the player dies.

    Arguments:
        -

    Example:
        call MF_respawn_fnc_eventKilled

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params ["_unit", "_killer", "_instigator", "_useEffects"];

setPlayerRespawnTime 999999;

// Friendly fire
if (side _instigator == playerSide) then {
    private _nameKiller = name _instigator;
    private _nameKilled = name player;

    [QEGVAR(friendly_fire,logFF), [_nameKilled, _nameKiller]] call CFUNC(globalEvent);
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
            MSG_1("ERROR","(Side tickets) Invalid side of player (%1)",playerSide);
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

        if (GETVAR(player,EGVAR(respawn_tickets,amount),-1) == 0 || (GVARMAIN(moduleWaveRespawn) && EGVAR(respawn_wave,availableWaves) == 0)) then {
            // Init spectator screen
            ["Initialize", [player, [], false, true, true, false, true, false, true, true]] call BFUNC(EGSpectator);

            if (GETVAR(player,EGVAR(respawn_tickets,amount),-1) == 0) then {
                [QGVARMAIN(notification_2), ["Warning", "You have no more respawn tickets!"]] call CFUNC(localEvent);
            };

            if (EGVAR(respawn_wave,availableWaves) == 0) then {
                [QGVARMAIN(notification_2), ["Warning", "No more reinforcement wave ramaining!"]] call CFUNC(localEvent);
            };

            // Screen effects
            cutText  ["", "BLACK IN",  3, true];
            "dynamicBlur" ppEffectAdjust [0];
            "dynamicBlur" ppEffectCommit 3;

            // SL module transfer
            if (GETVAR(player,EGVAR(player,isSL),false) && GVARMAIN(moduleRP)) then {
                private _target = [player] call EFUNC(common,selectTarget);

                if (_target != objNull && {GETVAR(_target,EGVAR(player,isSL),false)}) then {
                    SETPVAR(_target,EGVAR(player,isSL,true));
                    [QEGVAR(reinsertion,transferRP), [], _target] call CFUNC(targetEvent);
                    [QGVARMAIN(notification_2), ["Info", "You can now deploy the squad rally point"], _unit] call CFUNC(targetEvent);
                };
            };

            // CO modules transfer
            if (GETVAR(player,EGVAR(player,isCO),false) && (GVARMAIN(moduleSupplyDrop) || GVARMAIN(moduleScenarioControl))) then {
                private _target = [player] call EFUNC(common,selectTarget);

                if (_target != objNull && {GETVAR(_target,EGVAR(player,isCO),false)}) then {
                    if (GVARMAIN(moduleSupplyDrop)) then {
                        SETPVAR(_target,EGVAR(player,isCO,true));
                        [QEGVAR(supply_drop,transferSD), [], _target] call CFUNC(targetEvent);
                        [QGVARMAIN(notification_2), ["Info", "You can now call in supply drops"], _unit] call CFUNC(targetEvent);
                    };

                    if (GVARMAIN(moduleScenarioControl)) then {
                        SETPVAR(_target,EGVAR(player,isCO,true));
                        [QEGVAR(scenario_control,transferSC), [], _target] call CFUNC(targetEvent);
                        [QGVARMAIN(notification_2), ["Info", "You can now call tactical withdrawal"], _unit] call CFUNC(targetEvent);
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

            // Init the complainer mode
            ["Initialize", [player, [playerSide], false, false, true, false, true, false, false, true]] call BFUNC(EGSpectator);

            cutText  ["", "BLACK IN",  3, true];
            "dynamicBlur" ppEffectAdjust [0];
            "dynamicBlur" ppEffectCommit 3;
        };

        // Transfer respawn wave module
        if (GETVAR(player,EGVAR(player,isCO),false) && GVARMAIN(moduleWaveRespawn)) then {
            private _target = [player] call EFUNC(common,selectTarget);

            if (_target != objNull && {GETVAR(_target,EGVAR(player,isCO),false)}) then {
                SETPVAR(_target,EGVAR(player,isCO,true));
                [QGVARMAIN(transferWR), [], _target] call CFUNC(targetEvent);
                [QGVARMAIN(notification_2), ["Info", "You can now call in reinforcements"], _unit] call CFUNC(targetEvent);
            };
        };

        // Disable snow effect
        if (GVARMAIN(moduleSnowfall)) then {
            [EGVAR(snowfall,snowfallPFH)] call CFUNC(removePerFrameHandler);
        };
    }, [_unit, _killer], 5] call CFUNC(waitAndExecute);
}, [_unit, _killer], 1] call CFUNC(waitAndExecute);
