# TFAR
## Description:
_This module allows the mission maker to assign pre-set radio channels and stereo settings to player units._

## Usage:
1. _Call `MF_tfar_fnc_initSRRadio` or `MF_tfar_fnc_initLRRadio` in the init field of the unit (if you want to assign radio channels individually) or in the init field of the group (if you want to assign radio channels for the entire group)_

_Notes:_
 - _The group's init takes precedence over the units' init meaning that it will overwrite the values set in the init field of units in the same group._

_Short-range init:_
```
    Description:
        Sets the unit's short-range radio to the selected frequency and stereo setting.
        Default channel / freq. table (can be modified in the CBA settings):

        [Short range]
        Channel 1  |  Freq. 110
        Channel 2  |  Freq. 120
        Channel 3  |  Freq. 130
        Channel 4  |  Freq. 140
        Channel 5  |  Freq. 150
        Channel 6  |  Freq. 160
        Channel 7  |  Freq. 170
        Channel 8  |  Freq. 180
        Channel 9  |  Freq. 190

    Arguments:
        0: OBJECT or GROUP - Player unit or group
        1: SCALAR - Channel between 1 and 9 (Optional, default: 1)
        2: SCALAR - Stereo value: 0 - both, 1 - left, 2 - right (Optional, default: 0)

    Example(s):
        [this, 2, 1] call MF_tfar_fnc_initSRRadio

        [this, 3] call MF_tfar_fnc_initSRRadio
```

_Long-range init:_
```
    Description:
        Sets the unit's long-range radio to the selected frequency and stereo setting.
        Default channel / freq. table (can be modified in the CBA settings):

        [Long range]
        Channel 1  |  Freq. 69
        Channel 2  |  Freq. 68
        Channel 3  |  Freq. 67
        Channel 4  |  Freq. 66
        Channel 5  |  Freq. 65
        Channel 6  |  Freq. 64
        Channel 7  |  Freq. 63
        Channel 8  |  Freq. 62
        Channel 9  |  Freq. 61

    Arguments:
        0: OBJECT or GROUP - Player unit or group
        1: SCALAR - Channel between 1 and 9 (Optional, default: 1)
        2: SCALAR - Stereo value: 0 - both, 1 - left, 2 - right (Optional, default: 0)

    Example(s):
        [this, 2, 1] call MF_tfar_fnc_initLRRadio

        [this, 3] call MF_tfar_fnc_initLRRadio
```


## Config:
\-

## Supported mission type(s):
 - Coop
 - TvT
