#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Sets the side of the markers in the array.

    Arguments:
        -

    Example:
        call MF_marker_side_fnc_setMarkerSide

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Specators can see every marker
if (side player == sideLogic) exitWith {};

private _markersBLU = GVAR(markersBlufor);
private _markersRED = GVAR(markersRedfor);

if (playerSide == west) then {
    _markersRED apply {deleteMarkerLocal _x};
} else {
    _markersBLU apply {deleteMarkerLocal _x};
};
