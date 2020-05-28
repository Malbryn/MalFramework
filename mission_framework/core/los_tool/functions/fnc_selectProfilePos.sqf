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

if (GVAR(profileRunning) || {!GVAR(profileEnabled)}) exitWith {};

call FUNC(closeChart);

GVAR(profileRunning) = true;

call FUNC(determineEnvironment);

GVAR(overDialog) = false;
GVAR(overBox) = false;
GVAR(leftBottom) = [];
GVAR(rightUpper) = [];

GVAR(profileMouseMovingEH_ID) = (findDisplay GVAR(IDD) displayCtrl 51) ctrlAddEventHandler ["mouseMoving", {
    params ["_control", "_posX", "_posY"];
    GVAR(profilePointingPos) = (_control ctrlMapScreenToWorld [_posX, _posY]);
    private _pX = GVAR(profilePointingPos) select 0;
    private _pY = GVAR(profilePointingPos) select 1;
    
    if (count GVAR(leftBottom) != 0 && count GVAR(rightUpper) != 0) then {
        if (_pX > (GVAR(leftBottom) select 0) + 10 &&
            _pX < (GVAR(rightUpper) select 0) - 10 &&
            _pY > (GVAR(leftBottom) select 1) &&
            _pY < (GVAR(rightUpper) select 1)
        ) then {
            GVAR(pointingDist) = _pX;
            if (!GVAR(overDialog)) then {GVAR(overDialog) = true};
        }
        else {
            if (GVAR(overDialog)) then {GVAR(overDialog) = false};
        };
        
        if (_pX > (GVAR(leftBottom) select 0) &&
            _pX < (GVAR(rightUpper) select 0) &&
            _pY > (GVAR(leftBottom) select 1) &&
            _pY < (GVAR(rightUpper) select 1)
        ) then {
            if (!GVAR(overBox)) then {
                GVAR(overBox) = true;
                _control ctrlMapCursor ["Track", "Arrow"];
            };
        }
        else {
            if (GVAR(overBox)) then {
                GVAR(overBox) = false;
                _control ctrlMapCursor ["Track", "Track"];
            };
        };
    };
}];

GVAR(profileTempDrawEH_ID) = (findDisplay GVAR(IDD) displayCtrl 51) ctrlAddEventHandler ["Draw", {
    if (count GVAR(profileStartPos) != 0) then {
        private _secondPos = GVAR(profilePointingPos);
        
        _this select 0 drawLine [GVAR(profileStartPos), _secondPos, [0,0,0,1]];
    };
}];

[QGVAR(profile_ID1), "onMapSingleClick", {_pos call FUNC(handleProfileClick)}] call BIS_fnc_addStackedEventHandler;

[
    {count GVAR(profileStartPos) != 0 && count GVAR(profileEndPos) != 0}, 
    FUNC(drawProfileChart),
    [],
    100,
    {
        //TODO: add timeout??
    }
] call CBA_fnc_WaitUntilAndExecute;
