# IED
## Description:
_This module adds IED's that can be remotely detonated by AI units._

_If the person with the detonator dies, the IED won't be detonated._

## Usage:
1. _Put down an object that serves as an IED_
2. _Place down a unit (any side) that has the detonator and give it a unique name_
3. _Call `MF_ied_fnc_setUpIED` in the init field of the IED object_

```
Arguments:
    0: OBJECT - Variable name of the IED
    1: OBJECT - Detonator of the IED (the person carrying the detonator). If the person dies, the IED won't be detonated.
    2: SCALAR - Activation radius

Example:
    [ied1, det1, 10] call MF_ied_fnc_setUpIED
```

## Config:
\-

## Supported mission type(s):
 - Coop
