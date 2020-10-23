#include "script_component.hpp"

/*
    Author:
        joko // Jonas (modified by Malbryn)

    Description:
        Displays the player's FPS

    Arguments:
        -

    Example:
        call MF_admin_menu_fnc_drawFPS

    Returns:
        void
*/

if !(hasInterface) exitWith {};

private _value = 0;
private _count = {
    private _distance = (positionCameraToWorld [0, 0, 0]) distance _x;
    private _fps = GETVAR(_x,GVAR(clientFPS),-999);

    if (_distance < 1500) then {
        private _showArrow = _fps < 20;
        private _color = [[1, 1, 1, 0.3], [1, 0, 0, 0.7]] select _showArrow;
        private _size = [0.05, 0.06] select _showArrow;
        private _text = [["%1 Loading", name _x], ["%1 - FPS: %2", name _x, _fps, "None"]] select (_fps != -999);
        
        drawIcon3D [
            "",
            _color,
            getPos _x,
            1,
            2,
            0,
            format _text,
            0,
            _size,
            "PuristaMedium",
            "center",
            _showArrow
        ];
    };

    if (_fps != -999) then {
        _value = _value + _fps;
        true
    } else {
        false
    };
} count allPlayers;
