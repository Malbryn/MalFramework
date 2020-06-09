#include "script_component.hpp"

if !(GVARMAIN(moduleLOSTool)) exitWith {};

if (hasInterface) then {
    call FUNC(initialize); 
};
