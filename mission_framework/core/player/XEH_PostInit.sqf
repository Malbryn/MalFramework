#include "script_component.hpp"

// Reload the gear after init is done to prevent issues with overloaded gear
if (hasInterface) then {
    private _loadout = GETVAR(player,EGVAR(gear,currentLoadout),"");
    [player, _loadout] call EFUNC(gear,setGear);

    [QGVARMAIN(initFramework), {
        // Assign insignia
        private _insignia = GETVAR(player,GVAR(insignia),"");

        if (_insignia != "") then {
            [player, _insignia] call BFUNC(setUnitInsignia);
        };
    }] call CFUNC(addEventHandler);

    [QGVAR(setInsignia), {
        params ["_unit", "_insignia"];

        if (_insignia != "") then {
            [_unit, ""] call BFUNC(setUnitInsignia);
            [_unit, _insignia] call BFUNC(setUnitInsignia);
        };
    }] call CFUNC(addEventHandler);
};
