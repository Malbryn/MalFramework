#include "script_component.hpp"

/*
    Author:
        Perfk & BlackHawk (modified by Malbryn)

    Description:
        Renders a line between the killer and killed player. Use this if there's no respawns because the line is persistent!

    Arguments:
        0: OBJECT - The player object
        1: OBJECT - The killer AI or player

    Example:
        [player, _killer] call MF_killcam_fnc_initKillcam

    Returns:
        void
*/

params ["_unit", "_killer"];
private ["_msg", "_pos", "_dir"];

if (vehicle _killer != vehicle _unit && _killer != objNull) then {
    GVAR(unitPos) = ASLtoAGL eyePos _unit;
    GVAR(killer) = _killer;
    GVAR(killerPos) = ASLtoAGL eyePos _killer;
};

_cam = GETMVAR(BIS_EGSpectatorCamera_camera,objNull);
_pos = [2000, 2000, 100];
_dir = 0;

_pos = [(getpos _unit)#0, (getpos _unit)#1, ((getposATL _unit)#2) + 1.2];
_dir = getDir _unit;

if (abs(_pos#0) < 2 && abs(_pos#1) < 2) then {
    _pos = [2000, 2000, 100];
};

SETMVAR(GVAR(toggle),false);

[{!isNull (findDisplay 60492)}, {
    GVAR(keyHandle) = (findDisplay 60492) displayAddEventHandler ["keyDown", {call FUNC(toggleKillcam);}];
}, []] call CFUNC(waitUntilAndExecute);

if !(isNull GVAR(killer)) then {
    GVAR(distance) = GVAR(killer) distance _unit;
    _pos = ([_pos, -1.8, ([_unit, GVAR(killer)] call BFUNC(dirTo))] call BFUNC(relPos));
    _cam setposATL _pos;
    _temp1 = ([getposASL _cam, getposASL GVAR(killer)] call BFUNC(vectorFromXToY));
    _temp = (_temp1 call CFUNC(vect2Polar));
    
    if (abs(_temp#2) > 89) then {
        _temp set [2, 0]
    };

    [_cam, [_temp#1, _temp#2]] call BFUNC(setObjectRotation);
} else {
    _cam setposATL _pos;
    _cam setDir _dir;
};

GVAR(texture) = "a3\ui_f\data\gui\cfg\debriefing\enddeath_ca.paa";

GVAR(drawHandle) = addMissionEventHandler ["Draw3D", {
    if (GETMVAR(GVAR(toggle),false)) then {
        if ((GVAR(killerPos)#0) != 0) then {
            _u = GVAR(unitPos);
            _k = GVAR(killerPos);

            if ((_u distance _k) < 2000) then {
                drawLine3D [[(_u#0)+0.01, (_u#1)+0.01, (_u#2)+0.91], [(_k#0)+0.01, (_k#1)+0.01, (_k#2)-0.05], [1,0,0,1]];
                drawLine3D [[(_u#0)-0.01, (_u#1)-0.01, (_u#2)+0.89], [(_k#0)-0.01, (_k#1)-0.01, (_k#2)-0.06], [1,0,0,1]];
                drawLine3D [[(_u#0)-0.01, (_u#1)+0.01, (_u#2)+0.89], [(_k#0)-0.01, (_k#1)+0.01, (_k#2)-0.05], [1,0,0,1]];
                drawLine3D [[(_u#0)+0.01, (_u#1)-0.01, (_u#2)+0.91], [(_k#0)+0.01, (_k#1)-0.01, (_k#2)-0.06], [1,0,0,1]];
            };

            if (!isNull GVAR(killer)) then {
                private _killerName = name GVAR(killer);
                drawIcon3D [GVAR(texture), [1,0,0,1], [eyePos GVAR(killer)#0, eyePos GVAR(killer)#1, (ASLtoAGL eyePos GVAR(killer)#2) + 0.4], 0.7, 0.7, 0, _killerName + ", " + (str round GVAR(distance)) + "m", 1, 0.04, "PuristaMedium"];
            };
        } else {
            cutText ["Killer info unavailable", "PLAIN DOWN"];
            SETMVAR(GVAR(toggle),false);
        };
    };
}];

_msg = "<t size='0.5' color='#ffffff'>Press <t color='#FFA500'>K</t> to toggle indicator that shows the location where you were killed from.</t>";
[_msg, 0.55, 0.8, 20, 1] spawn BFUNC(dynamicText);
