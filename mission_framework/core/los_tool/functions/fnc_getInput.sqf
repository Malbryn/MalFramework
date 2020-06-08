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

if (GVAR(running) || {!GVAR(enabled)}) exitWith {};

//we will wipe array just in case this isn't really first generation, but previous one was cancelled early
if (GVAR(firstGeneration)) then {
    call FUNC(removeMarkers);
};

GVAR(executeFromDraw) = [];

GVAR(running) = true;
GVAR(aborted) = false;

call FUNC(determineEnvironment);

//call FUNC(removeMarkers);
if (!isNull (findDisplay GVAR(IDD)) && !isNil QGVAR(drawEH_ID)) then {
    (findDisplay GVAR(IDD) displayCtrl 51) ctrlRemoveEventHandler ["Draw", GVAR(drawEH_ID)];
};


{
    _x setMarkerAlphaLocal 0;
} forEach GVAR(markers);

GVAR(targetPos) = [];
GVAR(sourcePos) = [];
GVAR(targetSize) = 0;

GVAR(mouseMovingEH_ID) = (findDisplay GVAR(IDD) displayCtrl 51) ctrlAddEventHandler ["MouseMoving", {
    params ["_control", "_posX", "_posY"];
    GVAR(pointingPos) = (_control ctrlMapScreenToWorld [_posX, _posY]);
    if ((count GVAR(targetPos)) != 0) then {
        GVAR(pointingPosDistance) = GVAR(pointingPos) distance2D GVAR(targetPos);
    };
}];

GVAR(drawEH_ID) = (findDisplay GVAR(IDD) displayCtrl 51) ctrlAddEventHandler ["Draw", {
    if ((count GVAR(targetPos)) != 0) then {
        private _dist = GVAR(targetSize);
        if (_dist == 0) then {
            _dist = GVAR(pointingPosDistance);
        };
        _this select 0 drawEllipse [GVAR(targetPos), _dist, _dist, 0, [0,0,1,0.3], ""];
    };
    
    if ((count GVAR(sourcePos)) != 0) then {
        private _targetPos = GVAR(sourcePos);
        
        if ((count GVAR(pointingPos)) != 0) then {
            _targetPos = GVAR(pointingPos);
        };
        
        if ((count GVAR(targetPos)) != 0) then {
            _targetPos = GVAR(targetPos);
        };
        
        _this select 0 drawArrow [GVAR(sourcePos), _targetPos, [0,0,1,0.6]];
    };
    
    if (count GVAR(executeFromDraw) != 0) then {
        (GVAR(executeFromDraw) select 1) call (GVAR(executeFromDraw) select 0);
        GVAR(executeFromDraw) = [];
    };
}];

GVAR(keyDownEH_ID) = (findDisplay GVAR(IDD)) displayAddEventHandler ["keyDown", FUNC(abort)];

call FUNC(selectSource);
