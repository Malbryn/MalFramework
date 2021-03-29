#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds an event handler that monitors the civilian kills.

    Arguments:
        -

    Example:
        call MF_end_mission_fnc_eventEntityKilled

    Returns:
        void
*/

if !(isServer) exitWith {};

if (GVARMAIN(isTvT)) then {
    addMissionEventHandler ["EntityKilled", {
        params ["_unit", "_killer", "_triggerMan"];

        if (side group _unit == civilian) then {
            private _killerSide = "":

            switch (side _killer) do {
                case west : {
                    INC(EGVAR(end_conditions,civCasBlufor));
                    _killerSide = " (BLUFOR)";
                };

                case east : {
                    INC(EGVAR(end_conditions,civCasRedfor));
                    _killerSide = " (REDFOR)";
                };

                default {
                    INC(EGVAR(end_conditions,civCas));
                };
            };

            // Log the name of the killer
            private _time = [CBA_missionTime] call BFUNC(secondsToString);
            private _text = format ["%1 - A civilian was killed by %2%3", _time, name _killer, _killerSide];

            PUSH(GVAR(civilianKills),_text);
            INFO_1("A civilian was killed by %1%2",name _killer,_killerSide);
        };
    }];
} else {
    addMissionEventHandler ["EntityKilled", {
        params ["_unit", "_killer", "_triggerMan"];

        if ((side group _unit == civilian) && (side _killer == playerSide)) then {
            // Increment the number of the civilian casualties
            INC(EGVAR(end_conditions,civCas));

            // Log the name of the killer
            private _time = [CBA_missionTime] call BFUNC(secondsToString);
            private _text = format ["%1 - A civilian was killed by %2", _time, name _killer];

            PUSH(GVAR(civilianKills),_text);
            INFO_1("A civilian was killed by %1",name _killer);
        };
    }];
};
