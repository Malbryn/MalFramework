#include "..\script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Checks the performance of the server and the mission

    Arguments:
        0: STRING - Performance category (available: server, mission, units, objects)

    Example:
        call MF_performance_fnc_checkPerformance

    Returns:
        void
*/

params ["_category"];

if (!hasInterface) exitWith {};

switch (_category) do {
    case "server" : {
        private ["_serverFps", "_serverMinFps", "_serverTime", "_missionTime"];

        _serverFps = GVARMAIN(server_fps);
        _serverMinFps = GVARMAIN(server_fps_min);
        _serverTime = ceil (serverTime / 60);
        _missionTime = ceil (CBA_missionTime / 60);

        [[
            "--- SERVER ---<br/>
                Current server FPS: %1<br/>
                Minimum server FPS: %2<br/>
                Server uptime: %3 minutes<br/>
                Mission time: %4 minutes
            ", _serverFps, _serverMinFps, _serverTime, _missionTime
        ], 5, ace_player, 12] call AFUNC(common,displayTextStructured);
    };

    case "mission" : {
        private ["_date", "_missionTime", "_viewDistancePlayer", "_viewDistanceServer"];

        _date = format ["%1-%2-%3",
        date select 0,
        (if (date select 1 < 10) then { "0" } else { "" }) + str (date select 1),
        (if (date select 2 < 10) then { "0" } else { "" }) + str (date select 2)];
        _missionTime = ceil (CBA_missionTime / 60);
        _viewDistancePlayer = GVARMAIN(view_distance_player);
        _viewDistanceServer = GVARMAIN(view_distance_server);

        [[
            "--- MISSION ---<br/>
                Date: %1<br/>
                Mission time: %2 minutes<br/>
                View distance (player): %3m<br/>
                View distance (server): %4m
            ", _date, _missionTime, _viewDistancePlayer, _viewDistanceServer
        ], 5, ace_player, 12] call AFUNC(common,displayTextStructured);
    };

    case "units" : {
        private ["_units", "_players", "_unitsBlufor", "_unitsRedfor", "_unitsGreenfor", "_unitsCivfor", "_unitsDead"];

        _units = count allUnits;
        _players = playersNumber playerSide;
        _unitsBlufor = west countSide allUnits;
        _unitsRedfor = east countSide allUnits;
        _unitsGreenfor = resistance countSide allUnits;
        _unitsCivfor = civilian countSide allUnits;
        _unitsDead = count allDeadMen;

        [[
            "--- UNITS ---<br/>
                All units: %1<br/>
                Players: %2<br/>
                Units (BLUFOR): %3<br/>
                Units (REDFOR): %4<br/>
                Units (INDFOR): %5<br/>
                Units (CIVFOR): %6<br/>
                Dead units: %7<br/>
            ", _units, _players, _unitsBlufor, _unitsRedfor, _unitsGreenfor, _unitsCivfor, _unitsDead
        ], 5, ace_player, 12] call AFUNC(common,displayTextStructured);
    };

    case "objects" : {
        private ["_objects", "_objectsVehicles"];

        _objects = count allMissionObjects "All";
        _objectsVehicles = (count (vehicles select {_x isKindOf "Tank" || _x isKindOf "Car" || _x isKindOf "Air"}));

        [[
            "--- OBJECTS ---<br/>
                Objects: %1<br/>
                Vehicles: %2<br/>
            ", _objects, _objectsVehicles
        ], 5, ace_player, 12] call ace_common_fnc_displayTextStructured;
    };
};
