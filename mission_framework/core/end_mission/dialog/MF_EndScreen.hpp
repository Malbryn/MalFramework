//Exported via Arma Dialog Creator (https://github.com/kayler-renslow/arma-dialog-creator)
#include "CustomControlClasses.h"

class MF_EndScreen
{
    idd = 899;
    movingEnable = false;
    enableSimulation = false;
    
    class ControlsBackground
    {
        class Background
        {
            type = 0;
            idc = 0;
            x = safeZoneX + safeZoneW * 0.03375;
            y = safeZoneY + safeZoneH * 0.12666667;
            w = safeZoneW * 0.9325;
            h = safeZoneH * 0.74555556;
            style = 0;
            text = "";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.749,0.5098,0.9686,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
            onLoad = "call MF_end_mission_fnc_eventEndScreenOpened";
        };
    };
    
    class Controls
    {
        class LabelTitle
        {
            type = 0;
            idc = 801;
            x = safeZoneX + safeZoneW * 0.34375;
            y = safeZoneY + safeZoneH * 0.16555556;
            w = safeZoneW * 0.3375;
            h = safeZoneH * 0.03666667;
            style = 2;
            text = "CO99_Operation_Placeholder (by Placeholder)";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.949,0.949,0.949,1};
            font = "PuristaBold";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.15);
        };

        class LabelObjectives
        {
            type = 0;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.04875;
            y = safeZoneY + safeZoneH * 0.22444445;
            w = safeZoneW * 0.1125;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "Objectives";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaSemiBold";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.1);
        };

        class ListboxObjectives
        {
            type = 5;
            idc = 810;
            x = safeZoneX + safeZoneW * 0.04875;
            y = safeZoneY + safeZoneH * 0.27333334;
            w = safeZoneW * 0.2825;
            h = safeZoneH * 0.22333334;
            style = 16;
            colorBackground[] = {0.2,0.2,0.2,1};
            colorDisabled[] = {0.2,0.2,0.2,1};
            colorSelect[] = {0.902,0.902,0.902,1};
            colorText[] = {0.902,0.902,0.902,1};
            colorSelectBackground[] = {0.2,0.2,0.2,1};
            font = "EtelkaMonospacePro";
            maxHistoryDelay = 0;
            rowHeight = 0;
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.85);
            soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
            class ListScrollBar
            {
                color[] = {1,1,1,1};
                thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
                arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
                arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
                border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
            };
        };

        class LabelMissionTime
        {
            type = 0;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.36875;
            y = safeZoneY + safeZoneH * 0.59666667;
            w = safeZoneW * 0.1375;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "Mission time:";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
        };

        class LabelOutcome
        {
            type = 0;
            idc = 802;
            x = safeZoneX + safeZoneW * 0.34375;
            y = safeZoneY + safeZoneH * 0.27333334;
            w = safeZoneW * 0.3375;
            h = safeZoneH * 0.03666667;
            style = 2;
            text = "ENDING";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0,1,0,1};
            font = "PuristaSemiBold";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.15);
        };

        class LabelDescription
        {
            type = 0;
            idc = 803;
            x = safeZoneX + safeZoneW * 0.35875;
            y = safeZoneY + safeZoneH * 0.33777778;
            w = safeZoneW * 0.3075;
            h = safeZoneH * 0.14333334;
            style = 16;
            text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque neque mauris, lacinia eu nisl non, venenatis maximus ex. Phasellus congue ullamcorper eros in eleifend. Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.949,0.949,0.949,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
            lineSpacing = 0.9;
        };

        class TextMissionTime
        {
            type = 0;
            idc = 805;
            x = safeZoneX + safeZoneW * 0.51875;
            y = safeZoneY + safeZoneH * 0.59666667;
            w = safeZoneW * 0.1375;
            h = safeZoneH * 0.03666667;
            style = 1;
            text = "00:00:00 / 00:00:00";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
        };

        class LabelCivilianKills
        {
            type = 0;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.69375;
            y = safeZoneY + safeZoneH * 0.51777778;
            w = safeZoneW * 0.1125;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "Civilian kills";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaSemiBold";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.1);
        };

        class ListboxCivilianKills
        {
            type = 5;
            idc = 813;
            x = safeZoneX + safeZoneW * 0.69375;
            y = safeZoneY + safeZoneH * 0.56666667;
            w = safeZoneW * 0.2575;
            h = safeZoneH * 0.22333334;
            style = 16;
            colorBackground[] = {0.2,0.2,0.2,1};
            colorDisabled[] = {0.2,0.2,0.2,1};
            colorSelect[] = {0.902,0.902,0.902,1};
            colorText[] = {0.902,0.902,0.902,1};
            colorSelectBackground[] = {0.2,0.2,0.2,1};
            font = "EtelkaMonospacePro";
            maxHistoryDelay = 0;
            rowHeight = 0;
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.85);
            soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
            class ListScrollBar
            {
                color[] = {1,1,1,1};
                thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
                arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
                arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
                border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
            };
        };

        class LabelFriendlyFires
        {
            type = 0;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.69375;
            y = safeZoneY + safeZoneH * 0.22444445;
            w = safeZoneW * 0.1375;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "Friendly fires";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaSemiBold";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.1);
        };

        class ListboxFriendlyFires
        {
            type = 5;
            idc = 812;
            x = safeZoneX + safeZoneW * 0.69375;
            y = safeZoneY + safeZoneH * 0.27333334;
            w = safeZoneW * 0.2575;
            h = safeZoneH * 0.22333334;
            style = 16;
            colorBackground[] = {0.2,0.2,0.2,1};
            colorDisabled[] = {0.2,0.2,0.2,1};
            colorSelect[] = {0.902,0.902,0.902,1};
            colorText[] = {0.902,0.902,0.902,1};
            colorSelectBackground[] = {0.2,0.2,0.2,1};
            font = "EtelkaMonospacePro";
            maxHistoryDelay = 0;
            rowHeight = 0;
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.85);
            soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
            class ListScrollBar
            {
                color[] = {1,1,1,1};
                thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
                arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
                arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
                border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
            };
        };

        class ProgressBarProceed
        {
            type = 8;
            idc = 808;
            x = safeZoneX + safeZoneW * 0.34375;
            y = safeZoneY + safeZoneH * 0.76111112;
            w = safeZoneW * 0.3375;
            h = safeZoneH * 0.03111112;
            style = 0;
            colorBar[] = {0.1294,0.4549,0.6118,1};
            colorFrame[] = {0.6,0.6,0.6,1};
            texture = "#(argb,8,8,3)color(1,1,1,1)";
        };

        class LabelProceed
        {
            type = 0;
            idc = 809;
            x = safeZoneX + safeZoneW * 0.420625;
            y = safeZoneY + safeZoneH * 0.76111112;
            w = safeZoneW * 0.1625;
            h = safeZoneH * 0.03;
            style = 2;
            text = "Proceeding in 10 seconds";
            colorBackground[] = {0.8157,0.1647,0.3529,0};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9);
        };

        class LabelKillCount
        {
            type = 0;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.36875;
            y = safeZoneY + safeZoneH * 0.64555556;
            w = safeZoneW * 0.1375;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "Kills:";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
        };

        class LabelDeathCount
        {
            type = 0;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.36875;
            y = safeZoneY + safeZoneH * 0.69444445;
            w = safeZoneW * 0.1375;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "Deaths:";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
        };

        class TextKillCount
        {
            type = 0;
            idc = 806;
            x = safeZoneX + safeZoneW * 0.51875;
            y = safeZoneY + safeZoneH * 0.64555556;
            w = safeZoneW * 0.1375;
            h = safeZoneH * 0.03666667;
            style = 1;
            text = "999";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
        };

        class TextDeathCount
        {
            type = 0;
            idc = 807;
            x = safeZoneX + safeZoneW * 0.51875;
            y = safeZoneY + safeZoneH * 0.69444445;
            w = safeZoneW * 0.1375;
            h = safeZoneH * 0.03666667;
            style = 1;
            text = "999";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
        };

        class LabelKillfeed
        {
            type = 0;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.04875;
            y = safeZoneY + safeZoneH * 0.51777778;
            w = safeZoneW * 0.1125;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "Killfeed";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaSemiBold";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.1);
        };

        class ListboxKillfeed
        {
            type = 5;
            idc = 811;
            x = safeZoneX + safeZoneW * 0.04875;
            y = safeZoneY + safeZoneH * 0.56666667;
            w = safeZoneW * 0.2825;
            h = safeZoneH * 0.22333334;
            style = 16;
            colorBackground[] = {0.2,0.2,0.2,1};
            colorDisabled[] = {0.2,0.2,0.2,1};
            colorSelect[] = {0.902,0.902,0.902,1};
            colorText[] = {0.902,0.902,0.902,1};
            colorSelectBackground[] = {0.2,0.2,0.2,1};
            font = "EtelkaMonospacePro";
            maxHistoryDelay = 0;
            rowHeight = 0;
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.85);
            soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
            class ListScrollBar
            {
                color[] = {1,1,1,1};
                thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
                arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
                arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
                border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
            };
        };

        class LabelPlayer
        {
            type = 0;
            idc = 804;
            x = safeZoneX + safeZoneW * 0.36875;
            y = safeZoneY + safeZoneH * 0.52777778;
            w = safeZoneW * 0.2875;
            h = safeZoneH * 0.03666667;
            style = 2;
            text = "Player [Role - Squad]";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.1294,0.4549,0.6118,1};
            font = "PuristaSemiBold";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
        };

        class LabelTerrain
        {
            type = 0;
            idc = 814;
            x = safeZoneX + safeZoneW * 0.34375;
            y = safeZoneY + safeZoneH * 0.205;
            w = safeZoneW * 0.3375;
            h = safeZoneH * 0.03666667;
            style = 2;
            text = "Terrain";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.949,0.949,0.949,1};
            font = "PuristaBold";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.85);
        };
    };
};
