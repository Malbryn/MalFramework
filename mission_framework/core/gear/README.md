# Gear
## Description:
_This module handles the players' loadout._

_If there's an Arsenal available in the mission, then it saves the player's loadout when they close the Arsenal. This will overwrite the pre-defined gear and they will respawn with this custom loadout instead._

_It also adds a "Lock backpack" option to the player, with that enabled other players can't access the player's backpack or until the player dies._

_Alternative loadouts can also be defined in the config file. This way the mission maker can assign multiple loadouts to a certain role, these loadouts then can be accessed by interacting with the object acting as an Arsenal box. The format of the loadout hash is the following: `["KEY", ["VALUE1", "VALUE2"]]`, where `KEY` is the selected loadout and `["VALUE1", "VALUE2"]` is an array of the alternative loadouts. These loadouts must be defined in either `blufor_gear.sqf` or `redfor_gear.sqf`. Example: `["AR", ["AR-1", "AR-2"]]`. Note: use it with caution with `saveGearInArsenal` as it assigns `CUSTOM` as role to players who altered their loadout._

## Usage:
### Alternative loadouts
1. _Set up the loadout hash in `config.cfg`_
2. _Set up the alternative loadouts in `mission_framework\config\gear\`._
3. _Place down an object that will allow the players to change loadouts (like an Arsenal box) and call `MF_gear_fnc_addAlternativeLoadouts` in the init field of the object_

```
Arguments:
    0: OBJECT - The object that the players can interact with

Example:
    [this] call MF_gear_fnc_addAlternativeLoadouts
```

## Config:
_Description of each value set in the config file._

| Variable                   | Variable type | Default value                   | Game mode  | Description                                                                   |
|:-------------------------- |:------------- |:------------------------------- |:---------- |:----------------------------------------------------------------------------- |
| `saveGearInArsenal`        | `BOOLEAN`     | `false`                         | Coop/TvT   | Should the player's gear be saved if an Arsenal (vanilla or ACE) is available |
| `enableBackpackLock`       | `BOOLEAN`     | `true`                          | Coop/TvT   | Enable backpack lock                                                          |
| `enableAlternativeLoadout` | `BOOLEAN`     | `false`                         | Coop/TvT   | Enable alternative loadouts                                                   |
| `loadoutHash`              | `ARRAY`       | `["KEY", ["VALUE1", "VALUE2"]]` | Coop/TvT   | Key-value pairs (STRING - ARRAY OF STRINGS) for the alternative loadouts      |

## Supported mission type(s):
 - Coop
 - TvT
