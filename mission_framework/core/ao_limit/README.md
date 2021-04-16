# AO Limit
## Description:
_This module restricts the player's movement around the map by designating a target AO._

_The player cannot leave this area for more than the given time._

_If they stay outside of the AO for too long, they will be killed._

## Usage:
1. _Place down a rectangle area marker_
2. _Give it a unique name_

## Config:
_Description of each value set in the config file._

| Variable         | Variable type | Default value         | Game mode  | Description                                          |
|:---------------- |:------------- |:--------------------- |:---------- |:---------------------------------------------------- |
| `timerLand`      | `SCALAR`      | `10`                  | Coop/TvT   | Timer for any land based vehicle/unit (-1: disabled) |
| `timerAir`       | `SCALAR`      | `-1`                  | Coop/TvT   | Timer for any air vehicle (-1: disabled)             |
| `aoMarkerAll`    | `STRING`      | `"mrk_aoLimitAll"`    | Coop/TvT   | AO limit marker for every player                     |
| `aoMarkerBlufor` | `STRING`      | `"mrk_aoLimitBlufor"` | TvT        | AO limit marker for BLUFOR players                   |
| `aoMarkerRedfor` | `STRING`      | `"mrk_aoLimitRedfor"` | TvT        | AO limit marker for REDFOR players                   |

## Supported mission type(s):
 - Coop
 - TvT
