#include "script_component.hpp"
#include "..\..\config\config.sqf"  // Import framework settings

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

// Log events
[QGVAR(log), {
    params ["_msg", "_syschatEnabled"];

    [_msg, _syschatEnabled] call FUNC(writeRPT);
}] call CFUNC(addEventHandler);

private _version = VERSION_BUILD;

[COMPONENT_STR, "DEBUG", "*** DEBUG MODE IS ACTIVE ***", true] call FUNC(log);
[COMPONENT_STR, "INFO", format ["MalFramework v%1", _version], false] call FUNC(log);
