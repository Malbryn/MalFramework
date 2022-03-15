# Hostage
## Description:
_This module adds support for hostage rescue tasks/missions. It can also be used in missions where the objective is to capture HVT's alive._

_The mission maker can define hostage units, the framework will monitor the status of those units._

_An extraction area and a threshold can be set, so the given amount of hostages have to be in the extraction zone in order to complete the task._

_The module can also trigger mission complete or mission fail._

## Usage:
1. _Set up the hostage task_
2. _Place down the hostage unit(s)_
3. _Place down an area marker that marks the extraction zone, also give it a unique name_
4. _Call the `MF_hostage_fnc_makeHostage` function in the hostages' init field that links the unit to the extraction task_

```
Arguments:
    0: OBJECT - The AI unit
    1: STRING - The ID of the task
    2: BOOLEAN - Make unit handcufffed (Optional, default: true)

Example:
    [this, "t1", false] call MF_hostage_fnc_makeHostage
```

5. _Register the extraction task by calling the `MF_hostage_fnc_registerRescueTask` function in the init field of the task_

```
Arguments:
    0: STRING - ID of the task
    1: STRING - Marker name for the extraction zone
    2: SCALAR - Number of hostages KIA to fail the task
    3: SCALAR - Number of rescued hostages to complete the task
    4: BOOLEAN - Should the mission end (MissionSuccess) if the task is successful (Optional, default: false)
    5: BOOLEAN - Should the mission end (MissionFailed) if the task is failed (Optional, default: false)

Example:
    ["t1", "mrk_extraction", 3, 2, true] call MF_hostage_fnc_registerRescueTask
```

## Config:
\-

## Supported mission type(s):
 - Coop
 - TvT
