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
    params ["_killed", "_distance"];

    // Increment kill counter
    INC(GVAR(killCount));

    // Add it to kill feed
    private _time = [CBA_missionTime] call BFUNC(secondsToString);
    private _text = format ["%1  Killed %2 [%3m]", _time, _killed, _distance];

    GVAR(killFeed) pushBack [_text, true];
}] call CFUNC(addEventHandler);

// Death event
[QGVAR(death), {
    params ["_killer", "_distance"];

    // Increment death counter
    INC(GVAR(deathCount));

    // Add it to kill feed
    private _time = [CBA_missionTime] call BFUNC(secondsToString);
    private _text = format ["%1  Killed by %2 [%3m]", _time, _killer, _distance];

    GVAR(killFeed) pushBack [_text, false];
}] call CFUNC(addEventHandler);

["ace_killed", {
    params ["_unit", "_causeOfDeath", "_killer", "_instigator"];

    // Locality check
    if !(local _unit) exitWith {};

    private _killerName = "";

    // Distance
    private _distance = round (_killer distance _unit);

    if !(isNull _killer) then {
        // If killer is a vehicle, log the vehicle type
        if (!(_killer isKindof "CAManBase")) then {
            _killerName = getText (configfile >> "CfgVehicles" >> (typeOf _killer) >> "displayName");
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

    // If unit was player then send event to self
    if (_unitIsPlayer) then {
        _killerName = "unknown";

        if ((!isNull _killer) && {_unit != _killer}) then {
            if (_killerIsPlayer) then {
                _killerName = [_killer, true, false] call AFUNC(common,getName);
            } else {
                _killerName = getText (configfile >> "CfgVehicles" >> (typeOf _killer) >> "displayName");
            };
        };

        [QGVAR(death), [_killerName, _distance]] call CFUNC(localEvent);
    };

    // If killer was player then send event to killer
    if (_killerIsPlayer) then {
        private _unitName = "";

        if (_unitIsPlayer) then {
            // Should be same as profileName
            _unitName = [_unit, true, false] call AFUNC(common,getName);
        } else {
            _unitName = getText (configfile >> "CfgVehicles" >> (typeOf _unit) >> "displayName");
        };

        [QGVAR(kill), [_unitName, _distance], _killer] call CFUNC(targetEvent);
    };
}] call CFUNC(addEventHandler);
