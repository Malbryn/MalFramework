# Intel
## Description:
_This module adds intel to objects that can be picked up by players._

_Intel Creator tool can be found [here](https://malbryn.github.io/MalFramework/intel_creator.html)._

## Usage:
1. _Configure the intel in `config\intel\intel.sqf`_
2. _Place down an intel object_
3. _Call `MF_intel_fnc_initIntel` in the init field of the object_

```
Arguments:
    0: OBJECT - Intel object
    1: SCALAR - ID of the intel (see intel.sqf in config)
    2: STRING - Pick-up action display text (Optional, default: "Search for intel")
    3: STRING - Hold action icons (Optional, default: "holdAction_search_ca")

    Available icons:
        - holdAction_connect_ca.paa
        - holdAction_forceRespawn_ca.paa
        - holdAction_hack_ca.paa
        - holdAction_loadDevice_ca.paa
        - holdAction_passLeadership_ca.paa
        - holdAction_requestLeadership_ca.paa
        - holdAction_revive_ca.paa
        - holdAction_reviveMedic_ca.paa
        - holdAction_search_ca.paa
        - holdAction_secure_ca.paa
        - holdAction_takeOff1_ca.paa
        - holdAction_takeOff2_ca.paa
        - holdAction_thumbsDown_ca.paa
        - holdAction_thumbsUp_ca.paa
        - holdAction_unbind_ca.paa
        - holdAction_unloadDevice_ca.paa

Example:
    [this, 2, "Hack laptop", "holdAction_hack_ca"] call MF_intel_fnc_initIntel
```

## Config:
\-

## Supported mission type(s):
 - Coop
