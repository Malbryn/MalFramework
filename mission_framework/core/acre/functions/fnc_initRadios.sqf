#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Initialises the ACRE radios at mission start

    Arguments:
        -

    Example:
        call MF_acre_fnc_initRadios

    Returns:
        void
*/

if !(hasInterface) exitWith {};

[{!isNull acre_player}, {
    private _radios = ["ACRE_PRC343", "ACRE_PRC77", "ACRE_PRC117F", "ACRE_PRC152", "ACRE_PRC148", "ACRE_SEM52SL", "ACRE_SEM70"];
    private _side = side player;

    if GVARMAIN(isTvT) then {
        switch (_side) do {
            case west : {
                {
                    _x params ["_channel", "_freq", "_name"];

                    {
                        [_x, "default", _channel, "label", _name] call acre_api_fnc_setPresetChannelField;
                        [_x, "default", _channel, "frequencyRX", _freq] call acre_api_fnc_setPresetChannelField;
                        [_x, "default", _channel, "frequencyTX", _freq] call acre_api_fnc_setPresetChannelField;
                    } forEach ["ACRE_PRC117F", "ACRE_PRC148", "ACRE_PRC152"];
                } forEach GVAR(channelLabelsBlufor);

                _radios apply {
                    [_x, "default"] call acre_api_fnc_setPreset;
                };
            };

            case east : {
                {
                    _x params ["_channel", "_freq", "_name"];

                    {
                        [_x, "default2", _channel, "label", _name] call acre_api_fnc_setPresetChannelField;
                        [_x, "default2", _channel, "frequencyRX", _freq] call acre_api_fnc_setPresetChannelField;
                        [_x, "default2", _channel, "frequencyTX", _freq] call acre_api_fnc_setPresetChannelField;
                    } forEach ["ACRE_PRC117F", "ACRE_PRC148", "ACRE_PRC152"];
                } forEach GVAR(channelLabelsRedfor);

                _radios apply {
                    [_x, "default2"] call acre_api_fnc_setPreset;
                };
            };

            default {
                [COMPONENT_STR, "WARNING", "Player side has to be either BLUFOR or REDFOR during TvT's, RADIO ENCODING won't work properly", true] call EFUNC(main,log);
            };
        };
    } else {
        {
            _x params ["_channel", "_freq", "_name"];

            {
                [_x, "default", _channel, "label", _name] call acre_api_fnc_setPresetChannelField;
                [_x, "default", _channel, "frequencyRX", _freq] call acre_api_fnc_setPresetChannelField;
                [_x, "default", _channel, "frequencyTX", _freq] call acre_api_fnc_setPresetChannelField;
            } forEach ["ACRE_PRC117F", "ACRE_PRC148", "ACRE_PRC152"];
        } forEach GVAR(channelLabelsDefault);

        _radios apply {
            [_x, "default"] call acre_api_fnc_setPreset;
        };
    };

    if (GVAR(useBabel) && GVARMAIN(isTvT)) then {
        GVAR(langBlufor) call acre_api_fnc_babelAddLanguageType;
        GVAR(langRedfor) call acre_api_fnc_babelAddLanguageType;

        switch (_side) do {
            case west : {
                if GVAR(bluforSpeaksRedfor) then {
                    private _langs = [GVAR(langBlufor)#0, GVAR(langRedfor)#0];

                    _langs call acre_api_fnc_babelSetSpokenLanguages;
                    _langs call acre_api_fnc_babelSetSpeakingLanguage;
                } else {
                    [GVAR(langBlufor)#0] call acre_api_fnc_babelSetSpokenLanguages;
                    [GVAR(langBlufor)#0] call acre_api_fnc_babelSetSpeakingLanguage;
                };
            };

            case east : {
                if GVAR(redforSpeaksBlufor) then {
                    private _langs = [GVAR(langBlufor)#0, GVAR(langRedfor)#0];

                    _langs call acre_api_fnc_babelSetSpokenLanguages;
                    _langs call acre_api_fnc_babelSetSpeakingLanguage;
                } else {
                    [GVAR(langRedfor)#0] call acre_api_fnc_babelSetSpokenLanguages;
                    [GVAR(langRedfor)#0] call acre_api_fnc_babelSetSpeakingLanguage;
                };
            };

            default {
                [COMPONENT_STR, "WARNING", "Player side has to be either BLUFOR or REDFOR during TvT's, BABEL won't work properly", true] call EFUNC(main,log);
            };
        };
    };
}] call CFUNC(waitUntilAndExecute);
