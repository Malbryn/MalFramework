#include "script_component.hpp"

if !(GVARMAIN(moduleLogistics)) exitWith {};

private _filter = "isClass (_x >> 'Components' >> 'TransportPylonsComponent') && {(getNumber (_x >> 'scope')) > 0}";
private _aircraftWithPylons = (_filter configClasses (configFile >> "CfgVehicles")) apply {configName _x};

{
    [_x, "init", {
        params ["_aircraft"];

        private _loadoutAction = [
            "Configure Pylons",
            "Configure Pylons",
            "",
            {[_target] call AFUNC(pylons,showDialog)},
            {
                // Prevent duplicates caused by ammo trucks
                private _vehicles = nearestObjects [_target, ["Air", "LandVehicle", "Slingload_base_F", "ReammoBox_F"], 20];
                private _filter = ["transportAmmo", "ACE_rearm_defaultSupply"] select (["ace_rearm"] call AFUNC(common,isModLoaded));
                private _rearmVehicles = {(getNumber (configFile >> "CfgVehicles" >> typeOf _x >> _filter)) > 0} count _vehicles;

                if (_rearmVehicles > 0) exitWith {false};

                // Searching for the custom logi facility
                private _objects = nearestObjects [_target, [], 20];
                private _filter = _objects findIf {GETVAR(_x,GVAR(allowPylons),false)};

                if (_filter != -1) exitWith {true};
                
                false
            }
        ] call AFUNC(interact_menu,createAction);

        [_aircraft, 0, ["ACE_MainActions"], _loadoutAction] call AFUNC(interact_menu,addActionToObject);
    }, false, [], true] call CFUNC(addClassEventHandler);
} forEach _aircraftWithPylons;
