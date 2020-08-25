#include "script_component.hpp"

// Reload the gear after init is done to prevent issues with overloaded gear
if (hasInterface) then {
    private _loadout = GETVAR(player,EGVAR(gear,currentLoadout),"");
    [player, _loadout] call EFUNC(gear,setGear);
};
