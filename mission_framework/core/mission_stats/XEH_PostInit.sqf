#include "script_component.hpp"

if (isServer) then {
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
