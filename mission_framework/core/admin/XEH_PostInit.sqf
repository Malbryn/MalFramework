#include "script_component.hpp"

/**************************************************************************************************/
// EVENTS
/**************************************************************************************************/

// Friendly fire
[QGVAR(onFriendlyFire), {
    params ["_unit", "_killer"];

    [_unit, _killer] call FUNC(handleFriendlyFire);
}] call CFUNC(addEventHandler);
