# Supply Drop
## Description:
_This module adds a supply drop option to players with platoon level leadership (see: Player module)._

_The module spawns a plane or helicopter which then drops in the designated supply crate._

## Usage:
1. _Place down crates and fill them up with ammo, medical stuff etc._
2. _Call `MF_supply_drop_fnc_addCrate` in the init field of the crates_

```
Arguments:
    0: OBJECT - The object to be added to the array
    1: STRING - Name of the crate shown in the menu

Example:
    [this, "Medical crate"] call MF_supply_drop_fnc_addCrate
```

## Config:
_Description of each value set in the config file._

| Variable          | Variable type | Default value             | Game mode | Description                                                            |
|:----------------- |:------------- |:--------------------------|:--------- |:---------------------------------------------------------------------- |
| `supplyDropPlane` | `STRING`      | `"B_T_VTOL_01_vehicle_F"` | Coop      | Plane or helicopter used for the supply drop                           |
| `useFlare`        | `BOOLEAN`     | `false`                   | Coop      | Use flares to mark the crate instead of smokes (i.e. during night ops) |

## Supported mission type(s):
 - Coop
