# Admin
## Description:
_This module adds admin tools (admin menu, friendly-fire detection, server FPS monitoring etc.) to the mission maker and the logged-in admin._

_Currently the framework supports two "Game Masters", aka. the mission maker (Steam ID defined in `config\description.hpp` and the logged-in admin._

_Only the Game Masters have access to the Admin modules._

_Note:_
 - _This is a core module and cannot be turned off in the config._
 - _Certain functions (e.g. Arsenal, healing) won't work in TvT missions._

## Usage:
_No further setup is required._

## Config:
_Description of each value set in the config file._

| Variable        | Variable type | Default value | Game mode | Description                             |
|:--------------- |:------------- |:------------- |:--------- |:--------------------------------------- |
| `enableArsenal` | `BOOLEAN`     | `true`        | Coop      | Enable Arsenal option in the admin menu |
| `enableCurator` | `BOOLEAN`     | `true`        | Coop      | Enable Curator assignment               |

## Supported mission type(s):
 - Coop
 - TvT
