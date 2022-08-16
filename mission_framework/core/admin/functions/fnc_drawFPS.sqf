#include "script_component.hpp"

/*
    Author:
        joko // Jonas, Malbryn

    Description:
        Displays the player's FPS

    Arguments:
        -

    Example:
        call MF_admin_fnc_drawFPS

    Returns:
        void
*/

if !(hasInterface) exitWith {};

private _posWorld = positionCameraToWorld [0, 0, 0];
private _distance = -1;
private _fps = -1;
private _showArrow = false;

{
    _distance = _posWorld distance _x;

    if (_distance < 1500) then {
        _fps = GETVAR(_x,GVAR(clientFPS),-1);
        _showArrow = _fps < 20;

        drawIcon3D [
            "",
            [[1, 1, 1, 0.3], [1, 0, 0, 0.7]] select _showArrow,
            getPos _x,
            1,
            2,
            0,
            format ([["%1 Loading", name _x], ["%1 - FPS: %2", name _x, _fps]] select (_fps != -1)),
            0,
            [0.05, 0.06] select _showArrow,
            "PuristaMedium",
            "center",
            _showArrow
        ];
    };
} forEach allPlayers;
