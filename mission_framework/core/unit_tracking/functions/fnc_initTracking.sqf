#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds a unit to the unit tracking system.

    Arguments:
        0: OBJECT - The tracked unit
        1: STRING - Marker classname
        2: STRING - Text displayed (Optional, default: "")
        3: SCALAR - Update interval in seconds (Optional, default: 1)
        4: STRING - Marker colour (Optional, default: side-specific)
                    See: https://community.bistudio.com/wiki/Arma_3:_CfgMarkerColors

    Example:
        [this, "Infantry", "Alpha", 5, "colorBLUFOR"] call MF_unit_tracking_fnc_initTracking

    Returns:
        void
*/

//if !(isServer) exitWith {};

params ["_object", "_type", ["_text", ""], ["_interval", 1], ["_colour", ""]];

// Define hashmap

