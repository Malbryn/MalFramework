#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Checks the server performance and other mission related stats.

    Arguments:
        0: STRING - Performance category (available: server, mission, units, objects)

    Example:
        ["units"] call MF_performance_fnc_checkPerformance

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params ["_category"];

switch (_category) do {
    case "server" : {
        private _serverFps = GVAR(serverFPS);
        private _serverMinFps = GVAR(serverFPSMin);
        private _serverTime = ceil (serverTime / 60);
        private _missionTime = ceil (CBA_missionTime / 60);

        [[
            "--- SERVER ---<br/><br/>Current server FPS: %1<br/>Minimum server FPS: %2<br/>Server uptime: %3 minutes<br/>Mission time: %4 minutes",
            _serverFps, _serverMinFps, _serverTime, _missionTime
        ], 4, ace_player, 12] call AFUNC(common,displayTextStructured);
    };

    case "mission" : {
        private _date = format ["%1-%2-%3",
        date#0,
        (if (date#1 < 10) then { "0" } else { "" }) + str (date#1),
        (if (date#2 < 10) then { "0" } else { "" }) + str (date#2)];
        private _missionTime = ceil (CBA_missionTime / 60);
        private _viewDistancePlayer = GVARMAIN(playerViewDistance);
        private _viewDistanceServer = GVARMAIN(serverViewDistance);

        [[
            "--- MISSION ---<br/><br/>Date: %1<br/>Mission time: %2 minutes<br/>View distance (player): %3m<br/>View distance (server): %4m",
            _date, _missionTime, _viewDistancePlayer, _viewDistanceServer
        ], 4, ace_player, 12] call AFUNC(common,displayTextStructured);
    };

    case "units" : {
        private _units = count allUnits;
        private _players = playersNumber playerSide;
        private _unitsBlufor = west countSide allUnits;
        private _unitsRedfor = east countSide allUnits;
        private _unitsGreenfor = resistance countSide allUnits;
        private _unitsCivfor = civilian countSide allUnits;
        private _unitsDead = count allDeadMen;

        [[
            "--- UNITS ---<br/><br/>All units: %1<br/>Players: %2<br/>Units (BLUFOR): %3<br/>Units (REDFOR): %4<br/>Units (INDFOR): %5<br/>Units (CIVFOR): %6<br/>Dead units: %7<br/>",
            _units, _players, _unitsBlufor, _unitsRedfor, _unitsGreenfor, _unitsCivfor, _unitsDead
        ], 5.5, ace_player, 12] call AFUNC(common,displayTextStructured);
    };

    case "objects" : {
        private _objects = count allMissionObjects "All";
        private _objectsVehicles = (count (vehicles select {_x isKindOf "Tank" || _x isKindOf "Car" || _x isKindOf "Air"}));

        [[
            "--- OBJECTS ---<br/><br/>Objects: %1<br/>Vehicles: %2<br/>",
            _objects, _objectsVehicles
        ], 3, ace_player, 12] call AFUNC(common,displayTextStructured);
    };
};
