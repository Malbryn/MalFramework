#include "script_component.hpp"

if (isServer) then {
    if (GVARMAIN(isTvT)) then {
        addMissionEventHandler ["EntityKilled", {
            params ["_unit", "_killer", "_triggerMan"];

            if (side group _unit == civilian) then {
                switch (side _killer) do {
                    case west : {
                        INC(EGVAR(end_conditions,civCasBlufor));

                        // Log the name of the killer
                        _time = [CBA_missionTime] call BFUNC(secondsToString);
                        _text = format ["%1  :  A civilian was killed by %2 (BLUFOR)<br/>", _time, name _killer];
                        PUSH(GVAR(civilianKills),_text);
                
                        INFO_1("A civilian was killed by %1 (BLUFOR)",name _killer);
                    };

                    case east : {
                        INC(EGVAR(end_conditions,civCasRedfor));

                        // Log the name of the killer
                        _time = [CBA_missionTime] call BFUNC(secondsToString);
                        _text = format ["%1  :  A civilian was killed by %2 (REDFOR)<br/>", _time, name _killer];
                        PUSH(GVAR(civilianKills),_text);
                
                        INFO_1("A civilian was killed by %1 (REDFOR)",name _killer);
                    };

                    default {
                        INC(EGVAR(end_conditions,civCas));

                        // Log the name of the killer
                        _time = [CBA_missionTime] call BFUNC(secondsToString);
                        _text = format ["%1  :  A civilian was killed by %2 <br/>", _time, name _killer];
                        PUSH(GVAR(civilianKills),_text);
                        
                        INFO_1("A civilian was killed by %1",name _killer);
                    };
                };
            };
        }];
    } else {
        addMissionEventHandler ["EntityKilled", {
            params ["_unit", "_killer", "_triggerMan"];

            if ((side group _unit == civilian) && (side _killer == playerSide)) then {
                // Increment the number of the civilian casualties
                INC(EGVAR(end_conditions,civCas));

                // Log the name of the killer
                _time = [CBA_missionTime] call BFUNC(secondsToString);
                _text = format ["%1  :  A civilian was killed by %2 <br/>", _time, name _killer];
                PUSH(GVAR(civilianKills),_text);
                
                INFO_1("A civilian was killed by %1",name _killer);
            };
        }];
    };
};


// Author: PabstMirror (from ACEX)
if (GVARMAIN(moduleKillTracker)) then {
    [QGVAR(kill), {
        params ["_name", "_killInfo"];

        // Increment kill counter
        GVAR(killCount) = GVAR(killCount) + 1;
        GVAR(eventsArray) pushBack format ["KILLED: %1 %2", _name, _killInfo];
        GVAR(kills) = (format ["Total Kills: %1<br/>", GVAR(killCount)]) + (GVAR(eventsArray) joinString "<br/>");
    }] call CFUNC(addEventHandler);

    [QGVAR(death), {
        params ["_name", "_killInfo"];

        GVAR(eventsArray) pushBack format ["DIED: %1 %2", _name, _killInfo];
        GVAR(kills) = (format ["Total Kills: %1<br/>", GVAR(killCount)]) + (GVAR(eventsArray) joinString "<br/>");
    }] call CFUNC(addEventHandler);

    ["ace_killed", {
        params ["_unit", "_causeOfDeath", "_killer", "_instigator"];
        private ["_killInfo", "_unitIsPlayer", "_killerIsPlayer", "_fnc_getSideFromConfig"];

        if !(local _unit) exitWith {};

        _killInfo = [];

        if !(isNull _killer) then {
            // If killer is a vehicle log the vehicle type
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

        // Rough cause of death from statemachine (e.g. "CardiacArrest:Timeout"), could parse this to be more human readable
        _killInfo pushBack _causeOfDeath;

        // Parse info into text
        _killInfo = if (_killInfo isEqualTo []) then {
            ""
        } else {
            format [" - [%1]", (_killInfo joinString ", ")];
        };

        // If unit was player then send event to self
        if (_unitIsPlayer) then {
            private _killerName = "Self?";

            if ((!isNull _killer) && {_unit != _killer}) then {
                if (_killerIsPlayer) then {
                    _killerName = [_killer, true, false] call AFUNC(common,getName);
                } else {
                    // Allow setting a custom AI name (e.g. VIP Target)
                    _killerName = _killer getVariable [QGVAR(aiName), ""];

                    if (_killerName == "") then {
                        _killerName = format ["*AI* - %1", getText (configfile >> "CfgVehicles" >> (typeOf _killer) >> "displayName")];
                    };
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
                // Allow setting a custom AI name (e.g. VIP Target)
                _unitName = _unit getVariable [QGVAR(aiName), ""];

                if (_unitName == "") then {
                    _unitName = format ["*AI* - %1", getText (configfile >> "CfgVehicles" >> (typeOf _unit) >> "displayName")];
                };
            };

            [QGVAR(kill), [_unitName, _killInfo], _killer] call CFUNC(targetEvent);
        };
    }] call CFUNC(addEventHandler);
};
