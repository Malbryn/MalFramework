#include "script_component.hpp"

/*
    Author:
        Malbryn (based on PabstMirror's script from ACEX)

    Description:
        Adds an event handler that tracks the player kills.

    Arguments:
        -

    Example:
        call MF_end_mission_fnc_initKillTracker

    Returns:
        void
*/

// Kill event
[QGVAR(kill), {
    params ["_killed"];

    // Increment kill counter
    INC(GVAR(killCount));

    // Add it to kill feed
    
}] call CFUNC(addEventHandler);

// Death event
[QGVAR(death), {
    params ["_killer"];

    // Increment death counter
    INC(GVAR(deathCount));
}] call CFUNC(addEventHandler);

["ace_killed", {
    params ["_unit", "_causeOfDeath", "_killer", "_instigator"];

    if !(isNull _killer) then {
        // If killer is a vehicle, log the vehicle type
        if (!(_killer isKindof "CAManBase")) then {
            _killInfo pushBack format ["Vehicle: %1", getText (configfile >> "CfgVehicles" >> (typeOf _killer) >> "displayName")];
        };

        if (isNull _instigator) then {
            _instigator = effectiveCommander _killer;
        };
    };

    // isPlayer check will fail at this point
    _unitIsPlayer = hasInterface && {_unit in [player, ace_player]};
    _killerIsPlayer = (!isNull _instigator) && {_unit != _instigator} && {[_instigator] call AFUNC(common,isPlayer)};

    // Don't do anything if neither are players
    if (!(_unitIsPlayer || _killerIsPlayer)) exitWith {};

    // Parse info into text
    _killInfo = if (_killInfo isEqualTo []) then {
        ""
    } else {
        format [" - [%1]", (_killInfo joinString ", ")];
    };

    // If unit was player then send event to self
    if (_unitIsPlayer) then {
        private _killerName = "Self";

        if ((!isNull _killer) && {_unit != _killer}) then {
            if (_killerIsPlayer) then {
                _killerName = [_killer, true, false] call AFUNC(common,getName);
            } else {
                _killerName = format ["*AI* - %1", getText (configfile >> "CfgVehicles" >> (typeOf _killer) >> "displayName")];
            };
        };

        [QGVAR(death), [_killerName, _killInfo]] call CFUNC(localEvent);
    };

    // If killer was player then send event to killer
    if (_killerIsPlayer) then {
        private _unitName = "";

        if (_unitIsPlayer) then {
            // Should be same as profileName
            _unitName = [_unit, true, false] call AFUNC(common,getName);
        } else {
            _unitName = format ["*AI* - %1", getText (configfile >> "CfgVehicles" >> (typeOf _unit) >> "displayName")];
        };

        [QGVAR(kill), [_unitName, _killInfo], _killer] call CFUNC(targetEvent);
    };
}] call CFUNC(addEventHandler);
