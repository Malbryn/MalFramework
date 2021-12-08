# IED
## Description:
_This module adds IED's that can be remotely detonated by AI units._

_If the person with the detonator dies, the IED won't be detonated._

_The module also adds booby traps that can be detonated when the engine of the assigned vehicle is switched on._

## Usage:
### IED
1. _Put down an object that serves as an IED_
2. _Place down a unit (of any side) that has the detonator and give it a unique name_
3. _Call `MF_ied_fnc_setUpIED` in the init field of the IED object_

```
Arguments:
    0: OBJECT - Variable name of the IED
    1: OBJECT - Detonator of the IED (the person carrying the detonator). If the person dies, the IED won't be detonated.
    2: SCALAR - Activation radius

Example:
    [ied1, det1, 10] call MF_ied_fnc_setUpIED
```

### Booby trap
1. _Call `MF_ied_fnc_addBoobyTrap` in the init field of the vehicle_

```
Arguments:
    0: OBJECT - The target vehicle
    1: SCALAR - Delay between engine on and detonation in seconds (Optional, default: 1)

Example:
    [this, 2] call MF_ied_fnc_addBoobyTrap
```

## Config:
\-

## Supported mission type(s):
 - Coop
