#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        blank

    Arguments:
        -

    Example:
        call MF_marker_side_fnc_setMarkerSide

    Returns:
        void
*/

if !(hasInterface) exitWith {};

_markersBLU = GVAR(markersBlufor);
_markersRED = GVAR(markersRedfor);

if (playerSide == west) then {
    _markersRED apply {deleteMarkerLocal _x};
} else {
    _markersBLU apply {deleteMarkerLocal _x};
};
