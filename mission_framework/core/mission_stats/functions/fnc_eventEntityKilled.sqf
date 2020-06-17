#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds an event handler that monitors the civilian kills.

    Arguments:
        -

    Example:
        call MF_mission_stats_fnc_eventEntityKilled

    Returns:
        void
*/

if !(isServer) exitWith {};

if (GVARMAIN(isTvT)) then {
    addMissionEventHandler ["EntityKilled", {
        params ["_unit", "_killer", "_triggerMan"];

        if (side group _unit == civilian) then {
            private ["_time", "_text"];

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
                    _text = format ["%1  :  A civilian was killed by %2<br/>", _time, name _killer];
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
            private ["_time", "_text"];

            // Increment the number of the civilian casualties
            INC(EGVAR(end_conditions,civCas));

            // Log the name of the killer
            _time = [CBA_missionTime] call BFUNC(secondsToString);
            _text = format ["%1  :  A civilian was killed by %2<br/>", _time, name _killer];
            PUSH(GVAR(civilianKills),_text);
            
            INFO_1("A civilian was killed by %1",name _killer);
        };
    }];
};
