#include "script_component.hpp"

/*
    Author:
        BlackHawk

    Description:
        -

    Arguments:
        -

    Example:
        -

    Returns:
        void
*/

FUNC(oldGetInput) = FUNC(getInput);
FUNC(getInput) = {
    private _v = vehicle player;
    private _t = toUpper typeOf _v;
    
    private _ok = false;
    if (( {_t find _x > -1} count GVAR(vehiclesWithFBCB2) ) > 0) then {
        if (
            player isEqualTo commander objectParent player ||
            player isEqualTo gunner objectParent player
        ) then {
            call FUNC(oldGetInput);
            _ok = true;
        };
        
        if (!_ok && {_t find "M2A3" > -1}) then {
            private _list = fullCrew [_v, "cargo", false];
            if ({(_x select 0) == player} count _list > 0) then {
                call FUNC(oldGetInput);
                _ok = true;
            };
        };
        
        if (!_ok && {_t find "M998" > -1 || _t find "M1025" > -1}) then {
            private _list = fullCrew [_v, "turret", false];
            if ({(_x select 0) == player && (_x select 2) == 0} count _list > 0) then {
                call FUNC(oldGetInput);
                _ok = true;
            };
        };
    };
    if (!_ok) then {hint STR_DISABLED};
};

FUNC(selectProfilePos) = {hint STR_DISABLED;};
