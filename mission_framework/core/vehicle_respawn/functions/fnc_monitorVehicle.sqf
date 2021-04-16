#include "script_component.hpp"

/*
    Author:
        Fredrik Eriksson

    Description:
        Vehicle respawn status monitoring.

    Arguments:
        -

    Example:
        call MF_vehicle_respawn_fnc_monitorVehicle

    Returns:
        void
*/

if !(isServer) exitWith {};

{
    if !(alive (_x#0)) then {
        [COMPONENT_STR, "DEBUG", format ["Respawning vehicle: %1", _x#0], true, 0] call EFUNC(main,log);

        _x spawn {
            params [
                ["_vehicle", objNull, [objNull]],
                ["_vehicleData", [], [[]]]
            ];

            _vehicleData params [
                "_delay",
                "_init",
                "_loadout",
                "_name",
                "_position",
                "_direction",
                "_type",
                "_inventory",
                "_savePaint",
                "_paint",
                "_parts",
                "_deleteWreck",
                "_limitEnabled",
                "_pylons"
            ];

            private _respawnCount = GETVAR(_vehicle,GVAR(respawnCount),0);
            private _respawnLimit = GETVAR(_vehicle,GVAR(respawnLimit),0);
        
            if (_respawnCount >= _respawnLimit || {GETVAR(_vehicle,GVAR(respawnStop),false)}) exitWith {};

            if _deleteWreck then {
                deleteVehicle _vehicle;
            } else {
                if (_vehicle distance _position < 100) then {
                    deleteVehicle _vehicle;
                };
            };

            uiSleep (_delay + 0.1);

            private _newVehicle = _type createVehicle ASLToAGL [0, 0, 100];
            _newVehicle setPosASL _position;
            _newVehicle setDir _direction;

            if _loadout then {
                [_newVehicle, _inventory] call FUNC(setVehicleInventory);
            };

            if _savePaint then {
                [_newVehicle, _paint, _parts] call BFUNC(initVehicle);
            };

            if _limitEnabled then {
                SETPVAR(_newVehicle,GVAR(respawnCount),_respawnCount + 1);
                SETPVAR(_newVehicle,GVAR(respawnLimit),_respawnLimit);
            };

            [_newVehicle, _name] remoteExec ["setVehicleVarName", 0, _newVehicle];

            _newVehicle call _init;

            // Pylons
            if (_newVehicle isKindOf "Air") then {
                [COMPONENT_STR, "DEBUG", "Vehicle is an air vehicle, changing pylons...", true, 0] call EFUNC(main,log);

                private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _newVehicle >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {
                    getArray (_x >> "turret")
                };

                {
                    _newVehicle removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon")
                } forEach getPylonMagazines _newVehicle;

                {
                    _newVehicle setPylonLoadout [_x#0, _x#3, true, _x#2]
                } forEach _pylons;
            };

            GVAR(totalArray) pushBack [_newVehicle, _vehicleData];
        };

        GVAR(totalArray) set [_forEachIndex, ["DELETE"]];
    };

} forEach GVAR(totalArray);

GVAR(totalArray) = GVAR(totalArray) select {!(typeName (_x#0) == "STRING")};
