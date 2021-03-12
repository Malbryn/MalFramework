#include "script_component.hpp"
#include "\A3\ui_f\hpp\defineResinclDesign.inc"

/*
    Author:
        Malbryn

    Description:
        Displays the AO limit warning screen fi the player leaves the AO.

    Arguments:
        -

    Example:
        call MF_ao_limit_fnc_displayAOLimitWarning

    Returns:
        void
*/

if !(hasInterface) exitWith {};

disableSerialization;

private _display = _this#0;
private _ctrlTitle = _display displayCtrl 1001;
private _ctrlTitleBG = _display displayCtrl 1002;
private _ctrlTime = _display displayCtrl 1003;
private _endTime = serverTime + GETMVAR(GVAR(timeLeft),0);

GVAR(nextBeep) = _endTime - 10;

["AOLimitWarning"] call BFUNC(showNotification);

GVAR(displayAOLimitWarning) = [{
    _this#0 params ["_endTime", "_ctrlTime", "_display"];

    _shouldDisplay = GETMVAR(GVAR(display),false);

    if (serverTime >= GVAR(nextBeep)) then {
        INC(GVAR(nextBeep));
        playSound "Beep_Target";
    };

    private _timeLeft = _endTime - serverTime;
    private _colorSet = ["IGUI", "TEXT_RGB"];

    if (_timeLeft <= 10) then {
        _colorSet = ["IGUI", "WARNING_RGB"];
    };

    if (_timeLeft <= 5) then {
        _colorSet = ["IGUI", "ERROR_RGB"];
    };

    private _color = _colorSet call BFUNC(displayColorGet);
    _ctrlTime ctrlSetTextColor _color;

    if (_timeLeft > 0) then {
        _ctrlTime ctrlSetText ([_timeLeft, "MM:SS.MS"] call BFUNC(secondsToString));
    } else {
        _ctrlTime ctrlSetText "00:00.000";
        player setDamage 1;
        _display closeDisplay 1;
        
        [GVAR(displayAOLimitWarning)] call CFUNC(removePerFrameHandler);
    };

    if (!_shouldDisplay) exitWith {
        _display closeDisplay 1;
        [GVAR(displayAOLimitWarning)] call CFUNC(removePerFrameHandler);
    };
}, 0.08, [_endTime, _ctrlTime, _display]] call CFUNC(addPerFrameHandler);
