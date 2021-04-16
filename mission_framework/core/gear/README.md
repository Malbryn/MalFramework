# Gear
## Description:
_This module handles the players' loadout._

_If there's an Arsenal available in the mission, then it saves the player's loadout when they close the Arsenal. This will overwrite the pre-defined gear and they will respawn with this custom loadout instead._

_It also adds a "Lock backpack" option to the player, with that enabled other players can't access the player's backpack or until the player dies._

## Usage:
_No further setup is required._

## Config:
_Description of each value set in the config file._

| Variable             | Variable type | Default value | Game mode  | Description                                                                   |
|:-------------------- |:------------- |:------------- |:---------- |:----------------------------------------------------------------------------- |
| `saveGearInArsenal`  | `BOOLEAN`     | `false`       | Coop/TvT   | Should the player's gear be saved if an Arsenal (vanilla or ACE) is available |
| `enableBackpackLock` | `BOOLEAN`     | `true`        | Coop/TvT   | Enable backpack lock                                                          |

## Supported mission type(s):
 - Coop
 - TvT
