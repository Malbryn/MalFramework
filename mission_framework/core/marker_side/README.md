# Marker Side
## Description:
_This module allows the mission maker to restrict the visibility of certain markers so only one side can see them._

_Note:_
 - _Markers that should be visible to both sides, don't have to be included in both arrays._

## Usage:
1. _Put down the markers_
2. _Configure the sides in the `config.cfg`_

## Config:
_Description of each value set in the config file._

| Variable        | Variable type | Default value    | Game mode | Description               |
|:--------------- |:------------- |:---------------- |:--------- |:------------------------- |
| `markersBlufor` | `ARRAY`       | `["mrk_blufor"]` | TvT       | Markers visible to BLUFOR |
| `markersRedfor` | `ARRAY`       | `["mrk_redfor"]` | TvT       | Markers visible to REDFOR |

## Supported mission type(s):
 - TvT
