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

// Exit if the hash is empty
if (count GVAR(markerHash) == 0) exitWith {};

{
    // Delete marker if vehicle was destroyed
    if (_y isEqualType objNull) then {
        _x setMarkerPos (getPos _y);

        if (!alive _y) exitWith {
            deleteMarker _x;
            GVAR(markerHash) deleteAt _x;
        };
    } else {
        _x setMarkerPos (getPos (leader _y));
    };
} forEach GVAR(markerHash);
