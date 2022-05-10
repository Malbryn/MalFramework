#include "script_component.hpp"

[QGVARMAIN(initFramework), {
    // Assign insignia
    private _insignia = GETVAR(player,GVAR(insignia),"");

    if (_insignia != "") then {
        [player, _insignia] call BFUNC(setUnitInsignia);
    };

    // Set team colour
    call FUNC(setTeamColour);
}] call CFUNC(addEventHandler);

[QGVAR(setInsignia), {
    params ["_unit", "_insignia"];

    if (_insignia != "") then {
        [_unit, ""] call BFUNC(setUnitInsignia);
        [_unit, _insignia] call BFUNC(setUnitInsignia);
    };
}] call CFUNC(addEventHandler);

// Reload the gear after init is done to prevent issues with overloaded gear
private _role = GETVAR(player,EGVAR(gear,currentRole),"");
[player, _role] call EFUNC(gear,setGear);
