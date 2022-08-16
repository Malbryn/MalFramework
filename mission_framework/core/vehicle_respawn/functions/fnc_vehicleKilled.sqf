#include "script_component.hpp"

/*
    Author:
        Fredrik Eriksson, johnb43

    Description:
        Triggered when a registered vehicle is killed.

    Arguments:
        -

    Example:
        call MF_vehicle_respawn_fnc_vehicleKilled

    Returns:
        void
*/

if !(isServer) exitWith {};

params [["_vehicle", objNull, [objNull]]];

if (isNull _vehicle) exitWith {};

_vehicle spawn {
    params ["_vehicle"];

    private _vehicleData = GETVAR(_vehicle,GVAR(vehicleData),[]);

    if (_vehicleData isEqualTo []) exitWith {};

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

    // Remove "Killed" EH, as it's no longer necessary
    [QGVAR(unregisterKilledEH), _vehicle] call CFUNC(globalEvent);

    private _respawnCount = GETVAR(_vehicle,GVAR(respawnCount),0);
    private _respawnLimit = GETVAR(_vehicle,GVAR(respawnLimit),0);

    if ((_limitEnabled && {_respawnCount >= _respawnLimit}) || {GETVAR(_vehicle,GVAR(respawnStop),false)}) exitWith {};

    [COMPONENT_STR, "DEBUG", format ["Respawning vehicle (%1) in %2 seconds", _vehicle, _delay], true, 0] call EFUNC(main,log);

    if (_deleteWreck) then {
        deleteVehicle _vehicle;
    } else {
        if ((_vehicle distance _position) < 100) then {
            deleteVehicle _vehicle;
        };
    };

    uiSleep (_delay + 0.1);

    private _newVehicle = _type createVehicle ASLToAGL [0, 0, 100];
    _newVehicle setPosASL _position;
    _newVehicle setDir _direction;

    if (_loadout) then {
        [_newVehicle, _inventory] call FUNC(setVehicleInventory);
    };

    if (_savePaint) then {
        [_newVehicle, _paint, _parts] call BFUNC(initVehicle);
    };

    if (_limitEnabled) then {
        SETPVAR(_newVehicle,GVAR(respawnCount),_respawnCount + 1);
        SETPVAR(_newVehicle,GVAR(respawnLimit),_respawnLimit);
    };

    [_newVehicle, _name] remoteExec ["setVehicleVarName", 0, _newVehicle];

    _newVehicle call _init;

    // Pylons
    if (_newVehicle isKindOf "Air") then {
        [COMPONENT_STR, "DEBUG", "Vehicle is an air vehicle, changing pylons...", true, 0] call EFUNC(main,log);

        {
            _newVehicle removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon");
        } forEach getPylonMagazines _newVehicle;

        {
            _newVehicle setPylonLoadout [_x#0, _x#3, true, _x#2];
        } forEach _pylons;
    };

    SETPVAR(_newVehicle,GVAR(vehicleData),_vehicleData);

    // Execute globally, in case locality of vehicle changes
    private _id = [QGVAR(registerKilledEH), _newVehicle] call CFUNC(globalEventJIP);

    // Remove JIP event when vehicle is deleted
    [_id, _newVehicle] call CFUNC(removeGlobalEventJIP);
};
