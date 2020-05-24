#include "script_component.hpp"

[QGVARMAIN(initFramework), {
    [] call FUNC(addAdminMenu);
}] call CBA_fnc_addEventHandler;
