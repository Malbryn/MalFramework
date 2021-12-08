#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Transfers the SL and CO-related modules to the next person in command when the superior dies with not respawns left.

    Arguments:
        -

    Example:
        call MF_respawn_fnc_transferLeaderModules

    Returns:
        void
*/

if !(hasInterface) exitWith {};

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
if (GETVAR(player,EGVAR(player,isCO),false) && (GVARMAIN(moduleSupplyDrop) || GVARMAIN(moduleRetreat) || GVAR(waveRespawn) == MANUAL)) then {
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

        if (GVAR(waveRespawn) == MANUAL) then {
            [QGVAR(transferRespawnMenu), [], _target] call CFUNC(targetEvent);
        };
    };
};
