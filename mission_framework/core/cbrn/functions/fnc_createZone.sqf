#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Creates a contaminated zone with the given params.

    Arguments:
        0: OBJECT - Object that is the center of the zone (use 'Land_HelipadEmpty_F' if you need an invisible object)
        1: SCALAR - Radius of the zone in metres
        2: SCALAR - Radius of max. contamination (Optional, default: 0)
                    The level of contamination will get lower gradually between this radius and the max. radius
        3: SCALAR - Required level of protection for full protection (possible values: 1, 2, 3) (Optional, default: 1)
                    LVL 1 - Mask
                    LVL 2 - Uniform, mask
                    LVL 3 - Breathing apparatus, uniform, mask
        4: SCALAR - Level of contamination (possible values: 0.00 - 9.99) (Optional, default: 9.99)

    Example:
        [this, 200, 50, 2, 5] call MF_cbrn_fnc_createZone

    Returns:
        BOOLEAN
*/

params ["_object", "_zoneRadius", ["_innerRadius", 0], ["_protectionLevel", 1], ["_contLevel", 5]];

// Input checks
if (isNull _object) exitWith {
    [COMPONENT_STR, "ERROR", "Target object does not exist", true, 0] call EFUNC(main,log);

    false
};

if (_innerRadius > _zoneRadius) then {
    [COMPONENT_STR, "DEBUG", format ["The inner radius (%1) exceeds the zone radius (%2). Adjusting the inner circle range to max range...", _innerRadius, _zoneRadius], true, 0] call EFUNC(main,log);
};

if !(_protectionLevel in [1, 2, 3]) exitWith {
    [COMPONENT_STR, "ERROR", format ["Invalid protection level (%1). Possible values: [1, 2, 3]", _protectionLevel], true, 0] call EFUNC(main,log);

    false
};

if (_contLevel < 0 || 9.99 < _contLevel) exitWith {
    [COMPONENT_STR, "ERROR", format ["Invalid contamination level (%1). Possible values: [0 .. 9.99]", _contLevel], true, 0] call EFUNC(main,log);

    false
};

// Set variables
SETVAR();
