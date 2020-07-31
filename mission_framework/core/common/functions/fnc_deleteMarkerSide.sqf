#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Deletes a marker if the player's side is not matching.
        Useful for deleting markers for the opposing side in TvT missions.

    Arguments:
        0: STRING - Marker to delete
        1: SIDE - Side for which the marker should be deleted

    Example:
        ["mrk_testMarker", east] call MF_common_fnc_deleteMarkerSide

    Returns:
        BOOLEAN
*/

if !(hasInterface) exitWith {};

params ["_marker", "_side"];

private _playerSide = side player;

if (_playerSide isEqualTo _side) then {
    deleteMarkerLocal _marker;
    true
} else {
    false
};
