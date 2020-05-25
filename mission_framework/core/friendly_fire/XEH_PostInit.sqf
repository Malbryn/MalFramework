#include "script_component.hpp"


[QGVAR(logFF), {
    params ["_unit", "_killer"];

    [_unit, _killer] call FUNC(friendlyFireMessage);
}] call CFUNC(addEventHandler);


if (hasInterface) then {
    [player, "Killed", {
        params ["_unit", "_killer", "_instigator", "_useEffects"];

        if (side _instigator == playerSide) then {
            _nameKiller = name _instigator;
            _nameKilled = name player;

            [QGVAR(logFF), [_nameKilled, _nameKiller]] call CFUNC(globalEvent);
        };
    }] call CFUNC(addBISEventHandler);
};
