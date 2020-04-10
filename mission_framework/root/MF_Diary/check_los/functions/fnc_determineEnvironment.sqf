#include "script_component.hpp"

{
    if (!isNull(findDisplay _x)) exitWith {GVAR(IDD) = _x}
} forEach [12,37,52,53];
