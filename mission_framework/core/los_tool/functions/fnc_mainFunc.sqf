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

//simplified expression taking into account area is circle-shaped
GVAR(cellSize) = GVAR(targetSize) * (3.14 / GVAR(cellCount)) ^ 0.5;

[QGVAR(ID3), "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

//how many cells in a row, also number of rows
private _maxSize = ceil (GVAR(targetSize) / GVAR(cellSize) * 2);

if (!isNull (findDisplay GVAR(IDD)) && !isNil QGVAR(mouseMovingEH_ID)) then {
    (findDisplay GVAR(IDD) displayCtrl 51) ctrlRemoveEventHandler ["mouseMoving", GVAR(mouseMovingEH_ID)];
    GVAR(mouseMovingEH_ID) = nil;
};
[QGVAR(ID3), "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

GVAR(timeStart) = diag_tickTime;

GVAR(generating) = true;

private _func = {
    params ["_maxSize", "_i", "_size", "_cellPos"];

    if ((GVAR(targetPos) distance2D _cellPos) > _maxSize * GVAR(cellSize) / 2) exitWith {
        //private _index = round (_maxSize * _size + _i) + 1;
        //["FW_LOS_marker_" + str _index, _cellPos, 1, "colorGrey", _index] call FUNC(createMarker);
    };
    
    if (!terrainIntersect [GVAR(sourcePos), _cellPos]) exitWith {
        private _index = round (_maxSize * _size + _i) + 1;
        ["FW_LOS_marker_" + str _index, _cellPos, 0.4, "colorBlue", _index] call FUNC(createMarker);
    };

    private _index = round (_maxSize * _size + _i) + 1;
    ["FW_LOS_marker_" + str _index, _cellPos, 0.5, "colorRed", _index, "DiagGrid"] call FUNC(createMarker);
};

private _recFunc = {
    params ["_size", "_maxSize", "_func", "_recFuncRef"];
    
    private _f = (GVAR(targetPos) select 0) - _maxSize / 2 * GVAR(cellSize);
    private _s = (GVAR(targetPos) select 1) - (_maxSize / 2 - _size) * GVAR(cellSize);
    private _t = (GVAR(targetPos) select 2);
    
    for "_i" from 0 to _maxSize do {
        [_maxSize, _i, _size, [_f + _i * GVAR(cellSize), _s, _t]] call _func;
        if (GVAR(aborted)) exitWith {};
    };
    
    _size = _size + 1;
    if (_size < _maxSize && !GVAR(aborted)) then {
        _this set [0, (_this select 0) + 1];

        [_recFuncRef, _this] call FUNC(wrapper);
    }
    else {
    
        if (!GVAR(aborted)) then {
            GVAR(firstGeneration) = false;
        };
        
        GVAR(aborted) = false;
        
        (findDisplay GVAR(keyDownEH_ID)) displayRemoveEventHandler ["keyDown", GVAR(keyDownEH_ID)];
        GVAR(keyDownEH_ID) = nil;
        
        GVAR(generating) = false;
        GVAR(running) = false;
        
        //hint format [STR_FINISHED_MESSAGE, GVAR(cellCount), ROUND_2D(GVAR(cellSize)), ROUND_2D(diag_tickTime - GVAR(timeStart))];
        if (isMultiplayer && !isServer && GVAR(telemetryEnabled)) then {
            [(count GVAR(markers)) - 1, GVAR(targetSize), GVAR(cellSize), (diag_tickTime - GVAR(timeStart)), name player] call FUNC(telemetry);
        };
    };
};

[0, _maxSize, _func, _recFunc] call _recFunc; 
//nothing can be put beyond this point as it will be executed before generation is finished, as
//recursive function calls are delayed while this part is not
