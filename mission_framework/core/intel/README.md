# Intel
## Description:
_This module adds intel to objects that can be picked up by players._

## Usage:
1. _Configure the intel in `config\intel\intel.sqf`_
2. _Place down an intel object_
3. _Call `MF_intel_fnc_initIntel` in the init field of the object_

```
Arguments:
    0: OBJECT - Intel object
    1: SCALAR - ID of the intel (see intel.sqf in config)

Example:
    [objName, 2] call MF_intel_fnc_initIntel
```

## Config:
\-

## Supported mission type(s):
 - Coop
