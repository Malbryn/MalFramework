# Setup Timer
## Description:
_This module starts a setup timer at mission start, during which the players can't leave a designated area._

_Players who leave the area will be teleported back into it._

_It's useful during TvT mission so the defenders have some extra time to set up their defences but it can be used in Coop missions too._

## Usage:
1. _Place down area marker(s) for the selected side(s), give it (them) unique name(s)_

## Config:
_Description of each value set in the config file._

| Variable       | Variable type | Default value       | Game mode | Description                     |
|:-------------- |:------------- |:------------------- |:--------- |:------------------------------- |
| `markerBlufor` | `STRING`      | `"mrk_setupBlufor"` | Coop/TvT  | Setup area for the BLUFOR side  |
| `timerBlufor`  | `SCALAR`      | `60`                | Coop/TvT  | Setup timer for the BLUFOR side |
| `markerRedfor` | `STRING`      | `"mrk_setupRedfor"` | Coop/TvT  | Setup area for the REDFOR side  |
| `timerRedfor`  | `SCALAR`      | `60`                | Coop/TvT  | Setup timer for the REDFOR side |

## Supported mission type(s):
 - Coop
 - TvT
