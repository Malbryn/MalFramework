# Gear
## Description:
_This module handles the players' loadout. There are two options available: using pre-defined loadouts or enabling Arsenals (vanilla or ACE ones)._

_Using pre-defined loadouts means that the mission maker creates loadouts for each role. Meanwhile using Arsenals means that the players are able to create their own loadout which will be saved and reapplied after respawn._

_There are two ways of using Arsenals: the mission maker can place down unrestricted and restricted Arsenals. The restricted Arsenal means that each role has a separate set of items that are available in the Arsenal (e.g. only medics can take personal aid kits). The available items can be configured in `mission_framework\config\gear\arsenal\whitelist.sqf`._

_Using pre-defined gear means that the mission maker has to create a loadout for each role and export those loadouts from the ACE Arsenal and place them in the gear config of the correct side inside `config\gear\`. Reminder: any side other than BLUFOR goes into REDFOR._

_Alternative loadouts can also be defined in the config file. This way the mission maker can assign multiple loadouts to a certain role, these loadouts then can be accessed by interacting with the assigned object. The format of the loadout hash is the following: `["KEY", ["VALUE1", "VALUE2"]]`, where `KEY` is the selected loadout and `["VALUE1", "VALUE2"]` is an array of the alternative loadouts. These loadouts must be defined in either `blufor_gear.sqf` or `redfor_gear.sqf`. Example: `["AR", ["AR-1", "AR-2"]]`, meaning a player with the role `AR` will have access to `AR`, `AR-1` and `AR-2` loadouts. Note: use it with caution with `saveGearInArsenal` as it assigns `CUSTOM` as role to players who altered their loadout inside the Arsenal._

## Usage:
### Restricted Arsenal
1. _Place down an object (or multiple) which will be the Arsenal_
2. _In the init field of the object call `MF_gear_fnc_addRestrictedArsenal`_
3. _Define the whitelist in `mission_framework\config\gear\arsenal\whitelist.sqf`_

```
Arguments:
    0: OBJECT - The object used as the Arsenal

Example:
    [this] call MF_gear_fnc_addRestrictedArsenal
```

### Pre-defined loadouts
1. _Create a loadout in the ACE Arsenal and then click the Export button which will copy it to the clipboard_
2. _Place the copied string into `mission_framework\config\gear\blufor_gear.sqf` or `mission_framework\config\gear\redfor_gear.sqf` according to the side of the role_
3. _The role of the player is initialised via the Player module (check the README of that module for more information)_

### Alternative loadouts
1. _Set up the loadout hash in `config.cfg`_
2. _Set up the alternative loadouts in `mission_framework\config\gear\`._
3. _Place down an object that will allow the players to change loadouts and call `MF_gear_fnc_addAlternativeLoadouts` in the init field of the object_

```
Arguments:
    0: OBJECT - The object that the players can interact with

Example:
    [this] call MF_gear_fnc_addAlternativeLoadouts
```

## Config:
_Description of each value set in the config file._

| Variable                    | Variable type | Default value                          | Game mode  | Description                                                                             |
|:--------------------------- |:------------- |:-------------------------------------- |:---------- |:--------------------------------------------------------------------------------------- |
| `useArsenalWhitelist`       | `BOOLEAN`     | `false`                                | Coop/TvT   | Use custom Arsenals with restricted gear (defined in config\gear\arsenal\whitelist.sqf) |
| `saveGearInArsenal`         | `BOOLEAN`     | `false`                                | Coop/TvT   | Should the player's gear be saved after the Arsenal (vanilla or ACE one) is closed      |
| `useLoadouts`               | `BOOLEAN`     | `false`                                | Coop/TvT   | Apply the pre-defined gear (defined in config\gear\\)                                   |
| `enableAlternativeLoadouts` | `BOOLEAN`     | `false`                                | Coop/TvT   | Enable alternative loadouts                                                             |
| `loadoutHash`               | `ARRAY`       | `[["KEY", ["VALUE1", "VALUE2"]], ...]` | Coop/TvT   | Key-value pairs (STRING - ARRAY OF STRINGS) for the alternative loadouts                |

## Supported mission type(s):
 - Coop
 - TvT
