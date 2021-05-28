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
    [COMPONENT_STR, "DEBUG", "Contamination zones array is empty!", true, 1] call EFUNC(main,log);
};

GVAR(zoneCheckPFH) = [{
    // Reset detector if player leaves the zones
    if !(GVAR(isInZone)) then {
        [0] call FUNC(setDetectorDisplay);
    };

    GVAR(zones) apply {
        GETVAR(_x,GVAR(zoneParams),[]) params ["_zoneRadius", "_innerRadius", "_protectionLevel", "_contLevel"];

        private _currentContLevel = _contLevel;
        private _dist = player distance _x;

        // Check the player's distance
        if (_dist <= _zoneRadius) then {
            GVAR(isInZone) = true;

            // Check if player is alive
            if (!alive player) exitWith {};

            // Use linear conversion if between the max radius and inner radius
            if (_dist > _innerRadius) then {
                _currentContLevel = linearConversion [_innerRadius, _zoneRadius, _dist, 9.99, 0];
            };

            // SFX
            if ("ChemicalDetector_01_watch_F" in (assignedItems player) && {!GVAR(isMuted)} && {_currentContLevel > GVAR(alertThreshold)}) then {
                playSound QGVARMAIN(DetectorBeep);
            };

            // Set detector display
            [_currentContLevel] call FUNC(setDetectorDisplay);

            // Check the player's protection
            private _playerProtection = [player] call FUNC(getProtectionLevel);

            if (_playerProtection >= _protectionLevel) exitWith {};

            // Check time limit
            if (GVAR(timeLimitCurrent) < 0) then {
                // Calculate damage (player is inside the zone with insufficient level of protection)
                private _dps = _contLevel * (_protectionLevel - _playerProtection) / _protectionLevel;

                // Inflict damage
                [player, _dps] call FUNC(handleDamage);
            } else {
                GVAR(timeLimitCurrent) = GVAR(timeLimitCurrent) - 1;
            };
        } else {
            GVAR(isInZone) = false;
        };
    };
}, 1] call CFUNC(addPerFrameHandler);
