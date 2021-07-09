# CBRN
## Description:
_This module adds CBRN threat zones that can injure the players (AI units will be unaffected) if they don't have the sufficient level of protection._

_The module utilises the Chemical Detector from the Contact DLC to detect and display the threat level._

_It supports multiple contamination zones, however it might be heavy on the performance so don't go overboard with them. Also don't place down overlapping zones._

## Usage:
1. _Place down an object (can be a normal object or a dummy one like the invisible heliped). This object will be the center of the contamination zone._
2. _Call `MF_cbrn_fnc_createZone` in the init field of the object._

```
Arguments:
    0: OBJECT - Object that is the center of the zone (use 'Land_HelipadEmpty_F' if you need an invisible object)
    1: SCALAR - Radius of the zone in metres
    2: SCALAR - Radius of the inner circle (= max. contamination) (Optional, default: 0)
                The level of contamination will gradually get lower the further we go from this area
    3: SCALAR - Required level of protection for full protection (possible values: 1, 2, 3) (Optional, default: 1)
                LVL 1 - Mask
                LVL 2 - Uniform, mask
                LVL 3 - Breathing apparatus, uniform, mask
    4: SCALAR - Level of contamination (possible values: 0.00 - 9.99) (Optional, default: 9.99)

Example:
    [this, 200, 50, 2, 3.6] call MF_cbrn_fnc_createZone
```

_Notes:_
 - _Each zone has an inner circle, The contamination level is maximum inside the inner circle. The area outside of the inner circle (but within the zone itself) has lower contamination level which depends on the distance._
 - _There are 3 levels of protection that can be required by the zone. Level 1 means the correct type of gas mask will provide enough protection. Level 2 means the correct type of gas mask and uniform are required for full protection. Level 3 means the correct type of gas mask, uniform and breathing apparatus are needed for survival. The protictive gear types are defined in the config._
 - _Vehicle types can also be defined as protected, meaning that players won't need protective gear inside them. However, they will be affected if they turn out._
 - _The damage dealt depends on the level of contamination. For reference, a player with no protective gear inside a zone with a contamination level 9.99 will pass out after 5 minutes due to blood loss._
 - _Having deficient protective gear doesn't mean the player will recieve the maximum damage. For example, having a gas mask (and no protective uniform) in a Level 2 zone will halve the damage._
 - _The symptoms are the following: blood loss, fatigue and pain._
 - _There is a time limit after which the player starts taking damage. By default it is 30 seconds. It means the player can spend 60 seconds in any zone without the proper gear before taking damage. This gives the players a chance to equip their protective gear or leave the area. It can be adjusted in the config. It also refeshes after the player was fully healed._
 - _Players can take the Chemical Detector to detect the contamination level. By default, it will start beeping when it detects minimal contamination level. However, it can configured in the ACE self-interaction menu (Equipment sub-menu) to only make sound when the contamination level reaches a certain threshold. It can also be muted._

## Config:
_Description of each value set in the config file._

| Variable             | Variable type | Default value                              | Game mode | Description                                                       |
|:-------------------- |:------------- |:------------------------------------------ |:--------- |:----------------------------------------------------------------- |
| `timeLimit`          | `SCALAR`       | `60`                                      | Coop/TvT  | The time limit in seconds after which the player (with insufficient protection) starts taking damage |
| `protectiveMasks`    | `ARRAY`        | `["G_AirPurifyingRespirator_02_black_F"]` | Coop/TvT  | Masks that provide protection (LVL 1)                             |
| `protectiveUniforms` | `ARRAY`        | `["U_C_CBRN_Suit_01_Blue_F"]`             | Coop/TvT  | Uniforms that provide protection (LVL 2)                          |
| `protectiveBackpack` | `ARRAY`        | `["B_CombinationUnitRespirator_01_F"]`    | Coop/TvT  | Backpacks (= breathing apparatus) that provide protection (LVL 3) |
| `protectiveVehicles` | `ARRAY`        | `["B_APC_Wheeled_01_cannon_F"]`           | Coop/TvT  | Vehicles that provide protection (LVL 3)                          |

## Supported mission type(s):
 - Coop
 - TvT
