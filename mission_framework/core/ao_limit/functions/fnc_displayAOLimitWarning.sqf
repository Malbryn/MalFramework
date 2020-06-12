#include "script_component.hpp"
#include "\A3\ui_f\hpp\defineResinclDesign.inc"

/*
    Author:
        Malbryn

    Description:
        blank

    Arguments:
        -

    Example:
        call MF_blank_fnc_blank

    Returns:
        void
*/

//params ["_display"];
private ["_ctrlTitle", "_ctrlTitleBG", "_ctrlTime", "_endTime", "_break"];

disableSerialization;

_display = _this#0;
_ctrlTitle = _display displayCtrl 1001;
_ctrlTitleBG = _display displayCtrl 1002;
_ctrlTime = _display displayCtrl 1003;
_endTime = serverTime + GETMVAR(GVAR(timeLeft),0);

GVAR(nextBeep) = _endTime - 10;

["AOLimitWarning"] call BFUNC(showNotification);

GVAR(displayAOLimitWarning) = [{
    _this#0 params ["_endTime", "_ctrlTime", "_display"];
    private ["_timeLeft", "_colorSet", "_color"];

    _shouldDisplay = GETMVAR(GVAR(display),false);

    if (serverTime >= GVAR(nextBeep)) then {
        INC(GVAR(nextBeep));
        playSound "Beep_Target";
	};

    _timeLeft = _endTime - serverTime;
    _colorSet = ["IGUI", "TEXT_RGB"];

    if (_timeLeft <= 10) then {
        _colorSet = ["IGUI", "WARNING_RGB"];
    };

    if (_timeLeft <= 5) then {
        _colorSet = ["IGUI", "ERROR_RGB"];
    };

    _color = _colorSet call BFUNC(displayColorGet);
    _ctrlTime ctrlSetTextColor _color;

    if (_timeLeft > 0) then {
        _ctrlTime ctrlSetText ([_timeLeft, "MM:SS.MS"] call BFUNC(secondsToString));
    } else {
        _ctrlTime ctrlSetText "00:00.000";
        player setDamage 1;

        [{
            _display closeDisplay 1;
            [GVAR(displayAOLimitWarning)] call CFUNC(removePerFrameHandler);
        }, [], 3] call CFUNC(waitAndExecute);
    };

    if (!_shouldDisplay) exitWith {
        _display closeDisplay 1;
        [GVAR(displayAOLimitWarning)] call CFUNC(removePerFrameHandler);
    };
}, 0.08, [_endTime, _ctrlTime, _display]] call CFUNC(addPerFrameHandler);
