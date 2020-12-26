#include "script_component.hpp"

if !(GVARMAIN(moduleSitting)) exitWith {};

[QGVAR(playAnim), {
    params ["_unit", "_anim"];

    _unit switchMove _anim;
}] call CFUNC(addEventHandler);
