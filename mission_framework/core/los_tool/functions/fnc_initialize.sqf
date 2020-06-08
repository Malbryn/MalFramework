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

GVAR(markers) = [];
GVAR(arrow) = [];
GVAR(running) = false;
GVAR(IDD) = 12;
GVAR(aborted) = false;
GVAR(generating) = false;

GVAR(vehiclesWithFBCB2) = [];

GVAR(mouseMovingEH_ID) = nil;
GVAR(drawEH_ID) = nil;
GVAR(keyDownEH_ID) = nil;
GVAR(firstGeneration) = true;

//terrain profile vars
GVAR(chartDrawn) = false;
GVAR(profileStartPos) = [];
GVAR(profileEndPos) = [];
GVAR(profileRunning) = false;

call FUNC(determineEnvironment);

[{time > 0}, {
    if (GVAR(running)) then {
        GVAR(aborted) = true;
        QGVAR(ID1) call FUNC(terminateEarly);
        QGVAR(ID2) call FUNC(terminateEarly);
        QGVAR(ID3) call FUNC(terminateEarly);
    };

    if (count GVAR(markers) > 0) then {
        call FUNC(removeMarkers);
    };

    if (isMultiplayer && GVAR(disableAfterStart)) then {
        call FUNC(disable);
    };

    player removeDiarySubject QGVAR(menu);
}] call CBA_fnc_WaitUntilAndExecute;

player createDiarySubject [QGVAR(menu), STR_DIARY_SUBJECT];
private _info = "";

_info = STR_DIARY_USER_INSTR;
player createDiaryRecord [QGVAR(menu), ["Information", _info]];

_info = format [STR_DIARY_PROFILE, QFUNC(selectProfilePos), QFUNC(closeChart)];
player createDiaryRecord [QGVAR(menu), ["Terrain Profile Tool", _info]];

_info = format [STR_DIARY_LOS, QFUNC(getInput), QFUNC(removeMarkers)];
player createDiaryRecord [QGVAR(menu), ["Check LOS Tool", _info]];
