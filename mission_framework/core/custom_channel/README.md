# Custom Channel
## Description:
_This module adds the option to create a custom channel like FAC channel etc._

## Usage:
1. _Call `MF_custom_channel_fnc_addPlayerToCustomChannel` in the player's init field that should have access to the custom channel_

```
Arguments:
    0: OBJECT - The selected player

Example:
    [this] call MF_custom_channel_fnc_addPlayerToCustomChannel
```

## Config:
_Description of each value set in the config file._

| Variable        | Variable type | Default value      | Game mode  | Description                                           |
|:--------------- |:------------- |:------------------ |:---------- |:----------------------------------------------------- |
| `channelName`   | `STRING`      | `"JTAC channel"`   | Coop/TvT   | Name of the channel                                   |
| `channelColour` | `ARRAY`       | `[0.8, 0, 0.5, 1]` | Coop/TvT   | Colour of the channel (RGBA format, default: FK pink) |

## Supported mission type(s):
 - Coop
 - TvT
