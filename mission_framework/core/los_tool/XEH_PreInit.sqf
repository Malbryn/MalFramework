#include "script_component.hpp"

if !(GVARMAIN(moduleLOSTool)) exitWith {};

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

// Global variables
GVAR(telemetryEnabled) = true;
//GVAR(observerHeight) = 1.8;
GVAR(targetMinHeight) = 1.0;
//GVAR(cellCount) = 10000;
GVAR(disableAfterStart) = true;
GVAR(chartAccuracy) = 5;

[
    QGVAR(cellCount),
    "SLIDER",
    ["Cell count", "Affects ""resolution"" of checked area. Higher is prettier but slower. At 10 000 generation time is 5-10 seconds. Use high values with care."],
    "Check LOS",
    [2000, 50000, 10000, 0],
    nil,
    {call FUNC(removeMarkers)}
] call CBA_Settings_fnc_init;
 
[
    QGVAR(observerHeight),
    "SLIDER",
    ["Observer's elevation", "Altitude of observer above ground level. Increase to for example check LOS from rooftop of a building."],
    "Check LOS",
    [0.1, 20, 1.8, 1]
] call CBA_Settings_fnc_init;

[
    QGVAR(enabled),
    "CHECKBOX",
    ["Enable LOS check tool", "As a mission maker you can force this setting off."],
    "Check LOS",
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(profileEnabled),
    "CHECKBOX",
    ["Enable terrain profile tool", "As a mission maker you can force this setting off."],
    "Check LOS",
    true
] call CBA_Settings_fnc_init;
