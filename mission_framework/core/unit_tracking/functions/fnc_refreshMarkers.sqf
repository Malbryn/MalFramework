#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Refreshes the position of the unit tracking markers.

    Arguments:
        -

    Example:
        call MF_unit_tracking_fnc_refreshMarkers

    Returns:
        void
*/

if !(isServer) exitWith {};

{
    // Delete marker if vehicle is destroyed
    if (!alive _y && !(_y isKindOf "Man")) then {
        deleteMarker _x;
        GVAR(markerHash) deleteAt _x;
    };

    _x setMarkerPos (getPos _y);
} forEach GVAR(markerHash);
