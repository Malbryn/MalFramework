# JIP
## Description:
_This module adds support for JIP (= Join-In-Progress) players._

_It adds an option to the player to teleport back to their squad after joining late in a mission._

_The option is removed once the player teleports or after the given time (to prevent players abusing it)._

## Usage:
_No further setup is required._

## Config:
_Description of each value set in the config file._

| Variable   | Variable type | Default value | Game mode  | Description                                                             |
|:---------- |:------------- |:------------- |:---------- |:----------------------------------------------------------------------- |
| `jipTimer` | `SCALAR`      | `180`         | Coop/TvT   | How long the TP is available for after joining the mission (in seconds) |

## Supported mission type(s):
 - Coop
 - TvT
