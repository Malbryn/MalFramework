#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Starts the zone check PFH.

    Arguments:
        -

    Example:
        call MF_cbrn_fnc_initZoneCheck

    Returns:
        void
*/

if !(hasInterface) exitWith {};

if (count GVAR(zones) == 0) exitWith {
    [COMPONENT_STR, "WARNING", "Contamination zones array is empty!", true, 1] call EFUNC(main,log);
};

GVAR(zoneCheckPFH) = [{
    GVAR(zones) apply {
        GETVAR(_x,GVAR(zoneParams),[]) params ["_zoneRadius", "_innerRadius", "_protectionLevel", "_contLevel"];

        // Check the player's distance
        if (player distance _x > _zoneRadius) exitWith {};

        // SFX

        // Set detector display
        call FUNC(setDetectorDisplay);

        // Check the player's protection
        private _playerProtection = [player] call FUNC(getProtectionLevel);

        if (_playerProtection >= _protectionLevel) exitWith {};

        // Calculate damage (player is inside the zone with insufficient level of protection)
        private _dps = _contLevel * (_protectionLevel - _playerProtection) / _protectionLevel;

        // Inflict damage
        [_dps] call FUNC(handleDamage);
    };
}, 1] call CFUNC(addPerFrameHandler);
