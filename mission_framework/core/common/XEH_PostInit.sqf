#include "script_component.hpp"

// View distance
[QGVARMAIN(initFramework), {
    call FUNC(setViewDistance);
}] call CFUNC(addEventHandler);

// Animation change event
[QGVAR(playAnim), {
    params ["_unit", "_anim"];

    _unit switchMove _anim;
}] call CFUNC(addEventHandler);
