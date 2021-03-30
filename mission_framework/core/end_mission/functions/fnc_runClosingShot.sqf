#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Runs the closing shot on the client.

    Arguments:
        -

    Example:
        call MF_end_mission_fnc_runClosingShot

    Returns:
        void
*/

if !(hasInterface) exitWith {};

private _layerNoise = "BIS_fnc_endMission_noise" call BFUNC(rscLayer);
private _layerInterlacing = "BIS_fnc_endMission_interlacing" call BFUNC(rscLayer);
private _layerStatic = "BIS_fnc_endMission_static" call BFUNC(rscLayer);
private _layerEnd = "BIS_fnc_endMission_end" call BFUNC(rscLayer);

0.2 fademusic 0;

[{
    private _musicVolume = musicVolume;

    playmusic "EventTrack01_F_Curator";;
    0 fademusic _musicVolume;

    [{  private _layerStatic = _this#2;

        _layerStatic cutrsc ["RscStatic", "plain"];

        [{
            private _layerEnd = _this#3;

            showHUD false;
            _layerEnd cutrsc ["RscMissionEnd", "plain"];
            RscNoise_color = [1, 1, 1, 0];

            [{
                private _layerNoise = _this#0;
                private _layerStatic = _this#2;

                RscNoise_color = [1 ,1, 1, 0];
                _layerNoise cutrsc ["RscNoise", "black"];
                _layerStatic cutrsc ["RscStatic", "plain"];

                [{
                    private _layerInterlacing = _this#1;

                    RscNoise_color = [1, 1, 1, 1];
                    _layerInterlacing cutrsc ["RscInterlacing", "plain"];

                    [{
                        RscDisplayDebriefing_noise = true;

                        1 fadeSound 0;
                        [1, "BLACK", 1, 1] spawn BFUNC(fadeEffect);

                        [{
                            // Put everyone into spectator channel
                            [player, true] call TFUNC(forceSpectator);

                            // Open dialog
                            createDialog "MF_EndScreen";
                        }, [], 1] call CFUNC(waitAndExecute);
                    }, _this, 2.5] call CFUNC(waitAndExecute);
                }, _this, 0.5] call CFUNC(waitAndExecute);
            }, _this, 9] call CFUNC(waitAndExecute);
        }, _this, 0.3] call CFUNC(waitAndExecute);
    }, _this, 0.4] call CFUNC(waitAndExecute);
}, [_layerNoise, _layerInterlacing, _layerStatic, _layerEnd], 0.2] call CFUNC(waitAndExecute);

