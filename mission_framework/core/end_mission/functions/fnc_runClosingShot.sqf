#include "script_component.hpp"

/*
    Author:
        Malbryn (original BI fnc by Karel Moricky)

    Description:
        Runs the closing shot on the client.

    Arguments:
        -

    Example:
        ["MissionSuccess", true] call MF_end_mission_fnc_runClosingShot

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params [["_ending", ""], ["_isWin", true]];

missionnamespace setvariable ["BIS_fnc_missionHandlers_win", _isWin];
missionnamespace setvariable ["BIS_fnc_missionHandlers_end", _ending];

private _layerInterlacing = "BIS_fnc_endMission_interlacing" call BFUNC(rscLayer);
private _layerStatic = "BIS_fnc_endMission_static" call BFUNC(rscLayer);
private _layerEnd = "BIS_fnc_endMission_end" call BFUNC(rscLayer);

[{
    private _musicVolume = musicVolume;
    private _musicList = ["EventTrack02_F_Curator", "EventTrack01_F_Curator"];

    playmusic (_musicList select _this#4);
    0 fademusic _musicVolume;

    [{  private _layerStatic = _this#1;

        _layerStatic cutRsc ["RscStatic", "plain"];

        [{
            private _layerEnd = _this#2;

            RscMissionEnd_end = _ending;
            RscMissionEnd_win = _isWin;

            showHUD false;
            _layerEnd cutRsc ["RscMissionEnd", "plain"];

            [{
                private _layerStatic = _this#1;

                _layerStatic cutRsc ["RscStatic", "plain"];

                [{
                    private _layerInterlacing = _this#0;

                    _layerInterlacing cutRsc ["RscInterlacing", "plain"];
                    [0, "BLACK", 2.5, 1] spawn BFUNC(fadeEffect);

                    2.5 fadesound 0;
                    2.5 fademusic 0;

                    [{
                        // Close spectator screen
                        if (!alive player && GVARMAIN(useACESpectator)) then {
                            (findDisplay 60000) closeDisplay 1;
                        } else {
                            ["Terminate"] call BFUNC(EGSpectator);
                        };

                        // Put everyone into spectator channel
                        [player, true] call TFUNC(forceSpectator);

                        // Close any ACE progress bar
                        uiNamespace setVariable ["ace_common_ctrlProgressBar", controlNull];

                        // Open dialog
                        createDialog "MF_EndScreen";

                        // Logging
                        private _time = [CBA_missionTime] call BFUNC(secondsToString);
                        
                        [COMPONENT_STR, "INFO", format [
                            "Ending mission... (Ending: %1 | Victory: %2 | Mission time: %3)", _this#3, _this#4, _time
                        ]] call EFUNC(main,log);

                        markAsFinishedOnSteam;
                    }, _this, 2.7] call CFUNC(waitAndExecute);
                }, _this, 0.5] call CFUNC(waitAndExecute);
            }, _this, 9] call CFUNC(waitAndExecute);
        }, _this, 0.3] call CFUNC(waitAndExecute);
    }, _this, 0.4] call CFUNC(waitAndExecute);
}, [_layerInterlacing, _layerStatic, _layerEnd, _ending, _isWin], 0.2] call CFUNC(waitAndExecute);

