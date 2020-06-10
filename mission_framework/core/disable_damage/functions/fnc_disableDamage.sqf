#include "script_component.hpp"

/*
    Author:
        Starfox64

    Description:
        Add an eventhandler which prevents players from shooting each other during the end mission screen

    Arguments:
        -

    Example:
        call MF_disable_damage_fnc_disableDamage

    Returns:
        void
*/

GVAR(playerFired) = player addEventHandler ["Fired", {
    private ["_p"];

    _p = _this#6;

    deleteVehicle _p;

    if ((_this#5) call BFUNC(isThrowable)) then {
        player addMagazine (_this#5);
    } else {
        player setAmmo [currentWeapon player, (player ammo currentWeapon player) + 1];
    };
}];
