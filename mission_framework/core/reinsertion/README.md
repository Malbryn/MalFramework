# Reinsertion
## Description:
_This module handles the reinsertion of players after respawn._

_Available options:_
```
 - HALO drop (High Altitude, Low Opening)
        * The player will be dropped in near their corpse with a parachute on the back (any backpack will be put on chest)

 - MRV (Mobile Respawn Vehicle)
        * A vehicle will be assigned as a respawn vehicle and the players can teleport into this vehicle

 - RP (Rally Point)
        * Players with squad level leadership (see: Player module) can deploy a rally point for their squad
        * People from their squad can TP to that RP (each squad has a different RP)

 - HAB (basically a RP for the entire platoon)
        * Players with platoon level leadership (see: Player module) can deploy a HAB for the platoon
        * Any player can TP to the HAB
        * If enabled, players can TP from the HAB to their squad's RP

 - TP (Teleport Pole)
        * Teleport destinations can be created dynamically during the mission (via triggers), so players can TP to captured FOB's etc.
```

## Usage:
1. _Place down a teleport pole (or any object) at the respawn area and give it a unique name_

### MRV:
2. _Put down a vehicle that should be the respawn vehicle_
3. _Call `MF_reinsertion_fnc_setMRV_` in the init field of the vehicle_

```
Arguments:
    0: OBJECT - Vehicle that should become a MRV

Example:
    [this] call MF_reinsertion_fnc_setMRV
```

### Dynamic TP pole:
2. _Place down a trigger that unlocks TP locations dynamically (e.g. every enemy is killed in the FOB)_
2. _Call `MF_reinsertion_fnc_createTPDestination` in the Activation field of the trigger_

```
Arguments:
    0: STRING - Name of the destination that appears in the scroll wheel menu
    1: ARRAY - Coordinates of the destination

Example:
    ["Kavala City Centre", getMarkerPos "marker_kavala"] call MF_reinsertion_fnc_createTPDestination
```

## Config:
_Description of each value set in the config file._

| Variable         | Variable type | Default value            | Game mode | Description                                                                      |
|:---------------- |:------------- |:------------------------ |:--------- |:-------------------------------------------------------------------------------- |
| `RPPickUp`       | `BOOLEAN`     | `false`                  | Coop/TvT  | If the player is required to pick up the previous squad RP before redeploying it |
| `markRP`         | `BOOLEAN`     | `true`                   | Coop/TvT  | Mark the squad RP location on map (in group channel)                             |
| `RPObject`       | `STRING`      | `"Land_TentA_F"`         | Coop/TvT  | Object used as the squad rally point                                             |
| `markHAB`        | `BOOLEAN`     | `true`                   | Coop/TvT  | Mark the platoon HAB location on map                                             |
| `HABObject`      | `STRING`      | `"Land_HBarrierTower_F"` | Coop      | Mark the platoon HAB location on map                                             |
| `allowTPFromHAB` | `BOOLEAN`     | `true`                   | Coop      | If TP to squad RP is allowed from the platoon HAB                                |
| `TPPoles`        | `ARRAY`       | `["MF_tpPole_1"]`        | Coop/TvT  | Array of teleport pole object(s)                                                 |

## Supported mission type(s):
 - Coop
 - TvT
