# End Conditions
## Description:
_This module checks the defined end conditions every couple of seconds and ends the mission accordingly._

## Usage:
_Available end conditions:_
 - _Time limit - Ends the mission when the time limit is reached_
 - _Player casualty limit - Ends the mission when the player casulty limit is reached_
 - _Civilian casualty limit - Ends the mission when the civilian casualty limit is reached_
 - _Side respawn tickets - Ends the mission when a side runs out of respawn tickets_
 - _Task limit - Ends the mission when a certain amount of tasks is completed_
 - _Extraction - Ends the mission when the given amount of players are in the extraction zone_

_The framework relies on the vanilla task system. It is required in order to use most of the end conditions as the framework check the percentage of the completed tasks and ends the mission accordingly._

_**Important:** don't forget to customise the end screen messages in `mission_framework\config\debriefing\CfgDebriefing.hpp`._

## Config:
_Description of each value set in the config file._

### **Time limit**
| Variable           | Variable type | Default value | Game mode  | Description                                                                       |
|:------------------ |:------------- |:------------- |:---------- |:--------------------------------------------------------------------------------- |
| `timeLimit`        | `SCALAR`      | `3600`        | Coop/TvT   | Mission time limit in seconds                                                     |
| `favouredSide`     | `SCALAR`      | `1`           | TvT        | Favoured side (0: None, 1: BLUFOR, 2: REDFOR, 3: Side with more players)          |
| `notificationTime` | `SCALAR`      | `600`         | Coop/TvT   | Send a notification to each player X seconds before the time limit (-1: disabled) |
---
### **Player casualty limit**
| Variable         | Variable type | Default value | Game mode  | Description                                                        |
|:---------------- |:------------- |:------------- |:---------- |:------------------------------------------------------------------ |
| `playerCasLimit` | `SCALAR`      | `75`          | Coop/TvT   | Percentage of the max. allowed player casualty                     |
| `bluforCasLimit` | `SCALAR`      | `75`          | TvT        | Percentage of the max. allowed player casualty for the BLUFOR side |
| `redforCasLimit` | `SCALAR`      | `75`          | TvT        | Percentage of the max. allowed player casualty for the REDFOR side |
---
### **Civilian casualty limit**
| Variable           | Variable type | Default value | Game mode | Description                                      |
|:------------------ |:------------- |:------------- |:--------- |:------------------------------------------------ |
| `civilianCasLimit` | `SCALAR`      | `50`          | Coop/TvT  | Percentage of the max. allowed civilian casualty |
---
### **Side respawn tickets**
| Variable               | Variable type | Default value | Game mode | Description                               |
|:---------------------- |:------------- |:------------- |:--------- |:----------------------------------------- |
| `respawnTicketsBlufor` | `SCALAR`      | `2`           | TvT       | Respawn tickets for BLUFOR (-1: disabled) |
| `respawnTicketsRedfor` | `SCALAR`      | `-1`          | TvT       | Respawn tickets for REDFOR (-1: disabled) |
---
### **Task limit**
| Variable    | Variable type | Default value | Game mode | Description                       |
|:----------- |:------------- |:------------- |:--------- |:--------------------------------- |
| `taskLimit` | `SCALAR`      | `2`           | Coop      | Minimum number of completed tasks |
---
### **Extraction**
| Variable          | Variable type | Default value | Game mode | Description                                                            |
|:----------------- |:------------- |:------------- |:--------- |:---------------------------------------------------------------------- |
| `extMarker`       | `STRING`      | `"mrk_ext"`   | Coop      | Name of the extraction marker                                          |
| `playerThreshold` | `SCALAR`      | `50`          | Coop      | Percentage of the alive players that have to be in the extraction zone |
---
### **Task threshold**
| Variable          | Variable type | Default value | Game mode | Description                                                                            |
|:----------------- |:------------- |:------------- |:--------- |:-------------------------------------------------------------------------------------- |
| `taskThreshold`   | `SCALAR`      | `66`          | Coop      | Percentage of the tasks that have to be completed (used by Time limit and Extraction)* |
---

\* _When the time limit is reached (or the certain amount of players are in the extraction zone), the framework will check the completed tasks and end the mission the mission accordingly._

_Using the default values means:_

| Percentage | Outcome       |
| ---------: |:------------- |
| 0%         | Major failure |
| 1% - 65%   | Minor failure |
| 66% - 99%  | Minor succes  |
| 100%       | Major success |

## Available:
 - Coop
 - TvT
