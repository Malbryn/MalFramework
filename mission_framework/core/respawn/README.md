# Respawn
## Description:
_This module handles the player's killed and respawned events._

_This module also adds wave respawns (as opposed to the default, custom respawn)._

_Players with platoon level leadership (see: Player module) will be able to call for reinforcements._

_If those players die, the option will be available for the next person in command of the platoon._

_If the entire leadership element dies, no one will be able to call for reinforcements._


## Usage:
_No further setup is required._

## Config:
_Description of each value set in the config file._

| Variable              | Variable type | Default value | Game mode | Description                                                      |
|:--------------------- |:------------- |:------------- |:--------- |:---------------------------------------------------------------- |
| `timer`               | `SCALAR`      | `30`          | Coop/TvT  | Respawn timer in seconds                                         |
| `tickets`             | `SCALAR`      | `-1`          | Coop/TvT  | Individual respawn tickets (-1: tickets disabled)                |
| `useWaveRespawn`      | `BOOLEAN`     | `false`       | Coop/TvT  | Players will respawn in waves                                    |
| `manualWaveRespawns`  | `BOOLEAN`     | `false`       | Coop      | Respawn waves has to be requested by the CO (Coop missions only) |
| `availableWaves`      | `SCALAR`      | `1`           | Coop      | Number of available respawn waves (manual respawn waves only)    |
| `removePlayerCorpses` | `BOOLEAN`     | `true`        | Coop/TvT  | Remove the players' corpses upon respawn                         |

## Supported mission type(s):
 - Coop
 - TvT
