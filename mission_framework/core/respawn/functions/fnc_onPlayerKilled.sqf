#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Eventhandler for when the player dies

    Arguments:
        -

    Example:
        call MF_respawn_fnc_playerKilled

    Returns:
        void
*/

params ["_unit", "_killer", "_instigator", "_useEffects"];

setPlayerRespawnTime 999999;

// Friendly fire
if (side _instigator == playerSide) then {
    _nameKiller = name _instigator;
    _nameKilled = name player;

    [QEGVAR(friendly_fire,logFF), [_nameKilled, _nameKiller]] call CFUNC(globalEvent);
};

// Screen effects
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [0];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 6;

[{
    cutText  ["", "BLACK OUT", 5, true];

    [{
        // Save death location of the player
        SETVAR(player,EGVAR(reinsert,deathPos),getPos player);

        if (GETVAR(player,EGVAR(respawn_tickets,amount),-1) == 0 || EGVAR(respawn_wave,availableWaves) == 0) then {
            // Init spectator screen
            ["Initialize", [player, [], false, true, true, false, true, false, false, true]] call BFUNC(EGSpectator);

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
                private ["_partGroup", "_target"];

                _partGroup = (units group player) - [player];
                _target = objNull;

                // Check if empty
                if (count _partGroup == 0) exitWith {};

                _target = _partGroup select (_partGroup findIf {alive _x});
                
                if !(GETVAR(_target,EGVAR(player,isSL),false)) then {
                    SETPVAR(_target,EGVAR(player,isSL,true));
                    [QGVARMAIN(transferRP), [], _target] call CFUNC(targetEvent);
                    [QGVARMAIN(notification_2), ["Info", "You can now deploy the squad rally point"], _unit] call CFUNC(targetEvent);
                };
            };

            // CO modules transfer
            if (GETVAR(player,EGVAR(player,isCO),false) && (GVARMAIN(moduleSupplyDrop) || GVARMAIN(moduleScenarioControl))) then {
                private ["_partGroup", "_target"];

                _partGroup = (units group player) - [player];
                _target = objNull;

                // Check if empty
                if (count _partGroup == 0) exitWith {};

                _target = _partGroup select (_partGroup findIf {alive _x});

                if !(GETVAR(_target,EGVAR(player,isCO),false) && GVARMAIN(moduleSupplyDrop)) then {
                    SETPVAR(_target,EGVAR(player,isCO,true));
                    [QGVARMAIN(transferSD), [], _target] call CFUNC(targetEvent);
                    [QGVARMAIN(notification_2), ["Info", "You can now call in supply drops"], _unit] call CFUNC(targetEvent);
                };

                if !(GETVAR(_target,EGVAR(player,isCO),false) && GVARMAIN(moduleScenarioControl)) then {
                    SETPVAR(_target,EGVAR(player,isCO,true));
                    [QGVARMAIN(transferSC), [], _target] call CFUNC(targetEvent);
                    [QGVARMAIN(notification_2), ["Info", "You can now call tactical withdrawal"], _unit] call CFUNC(targetEvent);
                };
            };

        } else {
            if !(GVARMAIN(moduleWaveRespawn)) then {
                setPlayerRespawnTime GVARMAIN(respawnTimer);
            };
            
            // Init the complainer mode
            ["Initialize", [player, [], false, false, true, false, true, false, false, true]] call BFUNC(EGSpectator);

            cutText  ["", "BLACK IN",  3, true];
            "dynamicBlur" ppEffectAdjust [0];
            "dynamicBlur" ppEffectCommit 3;
        };

        // Transfer respawn wave module
        if (GETVAR(player,EGVAR(player,isCO),false) && GVARMAIN(moduleWaveRespawn)) then {
            private ["_partGroup", "_target"];

            _partGroup = (units group player) - [player];
            _target = objNull;

            // Check if empty
            if (count _partGroup == 0) exitWith {};

            _target = _partGroup select (_partGroup findIf {alive _x});

            if !(GETVAR(_target,EGVAR(player,isCO),false)) then {
                SETPVAR(_target,EGVAR(player,isCO,true));
                [QGVARMAIN(transferWR), [], _target] call CFUNC(targetEvent);
                [QGVARMAIN(notification_2), ["Info", "You can now call in reinforcements"], _unit] call CFUNC(targetEvent);
            };
        };

        // Disable snow effect
        if (GVARMAIN(moduleSnowfall)) then {
            [EGVAR(snowfall,snowfallPFH)] call CFUNC(removePerFrameHandler);
        };
    }, [], 5] call CFUNC(waitAndExecute);
}, [], 1] call CFUNC(waitAndExecute);
