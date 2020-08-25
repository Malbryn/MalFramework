#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Initialises / stops the ACE Spectator camera.

    Arguments:
        0: BOOLEAN - Spectator state of local client (true: start, false: stop)
        1: BOOLEAN - If every side is available to spectate (Optional, default: false)
        2: BOOLEAN - If free camera is available (Optional, default: false)

    Example:
        [true, false, true] call MF_common_fnc_initACESpectator

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params ["_state", ["_allowAllSides", false], ["_allowFreeCam", false]];

// Stop the script and exit the spectator mode if state is false
if !(_state) exitWith {
    [false] call AFUNC(spectator,setSpectator);
};

// If we allow all sides
if (_allowAllSides) then {
    [[west, east, independent, civilian]] call AFUNC(spectator,updateSides);
} else {
    [[playerSide], [west, east, independent, civilian]] call AFUNC(spectator,updateSides);
};

// If we allow the use of free cam
if (_allowFreeCam) then {
    [[0, 1, 2]] call AFUNC(spectator,updateCameraModes);
} else {
    [[1, 2], [0, 1, 2]] call AFUNC(spectator,updateCameraModes);
};

// Set the vision modes (only allow normal, NV and WH TI)
[[-2, -1, 0], [1, 2, 3, 4, 5, 6, 7]] call AFUNC(spectator,updateVisionModes);

// Set the camera mode, focus and position
[2, player, -2] call AFUNC(spectator,setCameraAttributes);

// Start the camera
[true, true, false] call AFUNC(spectator,setSpectator);
