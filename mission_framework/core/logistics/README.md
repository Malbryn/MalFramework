# Logistics
## Description:
_This module adds RRR and medical functions that can be used in the mission._

_The RRR part lets the mission maker limit the amount of resupplies that is available for the assets. It also disables the ACE Pylon system as well (if the option is enabled)._

_The medical bag allows the placement of a first aid kit that can be used to heal players when no medic is on station._

## Usage:
### RRR
1. _Place down an object that serves as a RRR station (e.g. container), make sure it's not a RRR vehicle already (i.e. an ammo truck)_
2. _Call `MF_logistics_fnc_addMaintenanceOptions` in the init field of the object_

```
Arguments:
    0: OBJECT - The object
    1: SCALAR - Mode (0: all, 1: rearm, 2: refuel, 3: repair, 4: rearm+refuel, 5: rearm+repair, 6: refuel+repair)
    2: SCALAR - Max. number of rearms available (Optional, default: -1 (= unlimited))
    3: BOOLEAN - Allow the change of pylons (Optional, default: true)
    4: SCALAR - Rearm detection range (Optional, default: 20)

Example:
    [this, 1, 3, false, 30] call MF_logistics_fnc_addMaintenanceOptions
```

### First Aid Kit
1. _Place down an object that serves as a medical bag_
2. _Call `MF_logistics_fnc_addHealOption` in the init field of the object_

```
Arguments:
    0: OBJECT - The object

Example:
    [this] call MF_logistics_fnc_addHealOption
```

## Config:
\-

## Supported mission type(s):
 - Coop
 - TvT
