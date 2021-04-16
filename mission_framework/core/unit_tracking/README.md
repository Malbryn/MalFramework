# Unit Tracking
## Description:
_This module adds basic unit tracking._

_It can be used to track groups or objcts (units and vehicles)._

## Usage:
1. _Place down the group, unit or vehicle_
2. _Call `MF_unit_tracking_fnc_initTracking` in the init field of the unit or group_

```
Arguments:
    0: GROUP or OBJECT - The tracked group or object
    1: STRING - Marker classname
                See: https://community.bistudio.com/wiki/CfgMarkers#Arma_3
    2: STRING - Text displayed (Optional, default: "")
    3: STRING - Marker colour (Optional, default: black)
                See: https://community.bistudio.com/wiki/Arma_3:_CfgMarkerColors

Example:
    [this, "b_inf", "Alpha", "colorBLUFOR"] call MF_unit_tracking_fnc_initTracking
```

## Config:
_Description of each value set in the config file._

| Variable          | Variable type | Default value | Game mode | Description                              |
|:----------------- |:------------- |:--------------|:--------- |:-----------------------------------------|
| `refreshInterval` | `SCALAR`      | `1`           | Coop      | Refresh rate in seconds (min. value = 1) |

## Supported mission type(s):
 - Coop
