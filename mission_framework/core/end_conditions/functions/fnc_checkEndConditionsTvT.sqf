#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Checks if any of the end conditions is true (in TvT missions)

    Arguments:
        -

    Example:
        call MF_end_conditions_fnc_checkEndConditionsTvT

    Returns:
        void
*/

if !(isServer) exitWith {};

scopeName QGVAR(main);

private _allPlayers = count allPlayers;
private _ended = false;

// Time limit check
if (GVARMAIN(moduleTimeLimit) && !_ended) then {
    private _time = CBA_missionTime;

    if (_time > GVAR(timeLimit)) then {
        switch (GVAR(favouredSide)) do {
            case 0 : {
                [QEGVAR(end_mission,callMission), ["MissionFail", false]] call CFUNC(localEvent);
                _ended = true;
            };

            case 1 : {
                [QEGVAR(end_mission,callMission), ["TimeLimitBlufor", true, west]] call CFUNC(localEvent);
                _ended = true;
            };

            case 2 : {
                [QEGVAR(end_mission,callMission), ["TimeLimitRedfor", true, east]] call CFUNC(localEvent);
                _ended = true;
            };

            case 3 : {
                private _bluforCount = west countSide playableUnits;
                private _redforCount = east countSide playableUnits;

                if (_bluforCount > _redforCount) then {
                    [QEGVAR(end_mission,callMission), ["TimeLimitBlufor", true, west]] call CFUNC(localEvent);
                    _ended = true;
                } else {
                    if (_bluforCount < _redforCount) then {
                        [QEGVAR(end_mission,callMission), ["TimeLimitRedfor", true, east]] call CFUNC(localEvent);
                        _ended = true;
                    } else {
                        [QEGVAR(end_mission,callMission), ["TimeLimitDraw", false]] call CFUNC(localEvent);
                        _ended = true;
                    };
                };
            };

            default {
                [COMPONENT_STR, "ERROR", "Wrong favoured side code in Time limit settings", true, 0] call EFUNC(main,log);
                _ended = true;
            };
        };
    };
};

// Player casualty check
if (GVARMAIN(modulePlayerCasualties) && !_ended) then {
    private _sideBlufor = EGVAR(common,sideBlufor);
    private _sideRedfor = EGVAR(common,sideRedfor);

    _sideBlufor params ["_bluforTotal", "_bluforCurrent"];
    _sideRedfor params ["_redforTotal", "_redforCurrent"];

    private _bluforDead = _bluforTotal - _bluforCurrent;
    private _redforDead = _redforTotal - _redforCurrent;

    if (_bluforTotal == 0) exitWith {
        [COMPONENT_STR, "WARNING", "Cannot calculate player casualty, the BLUFOR side has no players", true, 0] call EFUNC(main,log);
        GVARMAIN(modulePlayerCasualties) = false;
    };

    if (_redforTotal == 0) exitWith {
        [COMPONENT_STR, "WARNING", "Cannot calculate player casualty, the REDFOR side has no players", true, 0] call EFUNC(main,log);
        GVARMAIN(modulePlayerCasualties) = false;
    };

    private _bluforRatio = _bluforDead / (_bluforTotal * 0.01);
    private _redforRatio = _redforDead / (_redforTotal * 0.01);

    if (_bluforRatio >= GVAR(bluforCasLimit)) then {
        [QEGVAR(end_mission,callMission), ["PlayerCasLimitRedfor", true, east]] call CFUNC(localEvent);
        _ended = true;
        breakTo QGVAR(main);
    };

    if (_redforRatio >= GVAR(redforCasLimit)) then {
        [QEGVAR(end_mission,callMission), ["PlayerCasLimitBlufor", true, west]] call CFUNC(localEvent);
        _ended = true;
    };
};

// Civilian casualty check
if (GVARMAIN(moduleCivilianCasualties) && !_ended) then {
    private _killedByBlufor = GVAR(civCasBlufor);
    private _ratioBlufor = _killedByBlufor / (count GVAR(civs) * 0.01);

    private _killedByRedfor = GVAR(civCasRedfor);
    private _ratioRedfor = _killedByRedfor / (count GVAR(civs) * 0.01);

    if (_ratioBlufor >= GVAR(civilianCasLimit)) then {
        [QEGVAR(end_mission,callMission), ["CivCasLimitRedfor", true, east]] call CFUNC(localEvent);
        _ended = true;
        breakTo QGVAR(main);
    };

    if (_ratioRedfor >= GVAR(civilianCasLimit)) then {
        [QEGVAR(end_mission,callMission), ["CivCasLimitBlufor", true, west]] call CFUNC(localEvent);
        _ended = true;
    };
};

// Respawn tickets check
if (GVARMAIN(moduleRespawnTickets) && !_ended) then {
    if (GVARMAIN(respawnTicketsBlufor) != -1 && EGVAR(common,sideBlufor)#2 == 0) then {
        [QEGVAR(end_mission,callMission), ["TicketsRedfor", true, east]] call CFUNC(localEvent);
        _ended = true;
        breakTo QGVAR(main);
    };

    if (GVARMAIN(respawnTicketsRedfor) != -1 && EGVAR(common,sideRedfor)#2 == 0) then {
        [QEGVAR(end_mission,callMission), ["TicketsBlufor", true, west]] call CFUNC(localEvent);
        _ended = true;
    };
};
