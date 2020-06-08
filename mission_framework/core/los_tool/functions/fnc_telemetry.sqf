#include "script_component.hpp"

/*
    Author:
        BlackHawk

    Description:
        -

    Arguments:
        -

    Example:
        -

    Returns:
        void
*/

params ["_cells", "_size", "_cellSize", "_time", "_player"];

private _msg = format [STR_TELEMETRY_LOG, _cells, _size, _cellSize, _time, _player];

_msg remoteExec ["diag_log", 2];
