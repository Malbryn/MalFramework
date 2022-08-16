//Exported via Arma Dialog Creator (https://github.com/kayler-renslow/arma-dialog-creator)
#include "CustomControlClasses.h"

class MF_AdminMenu
{
    idd = 799;
    movingEnable = false;
    enableSimulation = true;

    class ControlsBackground
    {
        class Background
        {
            type = 0;
            idc = 0;
            x = safeZoneX + safeZoneW * 0.10125;
            y = safeZoneY + safeZoneH * 0.12;
            w = safeZoneW * 0.798125;
            h = safeZoneH * 0.75666667;
            style = 0;
            text = "";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.1294,0.4549,0.6118,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
            onLoad = QUOTE(call FUNC(handleAdminMenuOpened));
        };
    };

    class Controls
    {
        class TitleMain
        {
            type = 0;
            idc = 0;
            x = safeZoneX + safeZoneW * 0.3225;
            y = safeZoneY + safeZoneH * 0.14;
            w = safeZoneW * 0.375;
            h = safeZoneH * 0.04;
            style = 2;
            text = "MF Admin Menu";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
        };

        class ButtonCloseDialog
        {
            type = 1;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.4375;
            y = safeZoneY + safeZoneH * 0.83444445;
            w = safeZoneW * 0.125;
            h = safeZoneH * 0.03333334;
            style = 2;
            text = "Close";
            borderSize = 0;
            colorBackground[] = {0.2,0.2,0.2,1};
            colorBackgroundActive[] = {0.1294,0.4549,0.6118,1};
            colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
            colorBorder[] = {0,0,0,0};
            colorDisabled[] = {0.2,0.2,0.2,1};
            colorFocused[] = {0.2,0.2,0.2,1};
            colorShadow[] = {0,0,0,0};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            offsetPressedX = 0.0025;
            offsetPressedY = 0.0025;
            offsetX = 0.0025;
            offsetY = 0.0025;
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
            soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
            soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
            soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
            onMouseButtonUp = QUOTE([QQGVAR(onAdminMenuClosed)] call CFUNC(localEvent));
        };

        class ListboxPlayerlist
        {
            type = 5;
            idc = 718;
            x = safeZoneX + safeZoneW * 0.7375;
            y = safeZoneY + safeZoneH * 0.24777778;
            w = safeZoneW * 0.125;
            h = safeZoneH * 0.37444445;
            style = 16;
            colorBackground[] = {0.2,0.2,0.2,1};
            colorDisabled[] = {0.2,0.2,0.2,1};
            colorSelect[] = {0.1294,0.4549,0.6118,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            maxHistoryDelay = 0;
            rowHeight = 0;
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
            soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
            colorSelectBackground[] = {0.3,0.3,0.3,1};
            shadow = 0;
            class ListScrollBar
            {
                color[] = {1,1,1,1};
                thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
                arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
                arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
                border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
            };
        };

        class TitlePlayerlist
        {
            type = 0;
            idc = 0;
            x = safeZoneX + safeZoneW * 0.7375;
            y = safeZoneY + safeZoneH * 0.19888889;
            w = safeZoneW * 0.05;
            h = safeZoneH * 0.04;
            style = 0;
            text = "Players";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.1);
        };

        class TitlePerformance
        {
            type = 0;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.11875;
            y = safeZoneY + safeZoneH * 0.19888889;
            w = safeZoneW * 0.1;
            h = safeZoneH * 0.04;
            style = 0;
            text = "Performance";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.1);
        };

        class LabelCurrentFPS
        {
            type = 0;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.11875;
            y = safeZoneY + safeZoneH * 0.24888889;
            w = safeZoneW * 0.1375;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "Server FPS (Current):";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class TextCurrentFPS
        {
            type = 0;
            idc = 700;
            x = safeZoneX + safeZoneW * 0.24375;
            y = safeZoneY + safeZoneH * 0.24888889;
            w = safeZoneW * 0.0625;
            h = safeZoneH * 0.03666667;
            style = 1;
            text = "999.99";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);

        };

        class LabelMinFPS
        {
            type = 0;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.11875;
            y = safeZoneY + safeZoneH * 0.29777778;
            w = safeZoneW * 0.1375;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "Server FPS (Min):";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class TextMinFPS
        {
            type = 0;
            idc = 701;
            x = safeZoneX + safeZoneW * 0.24375;
            y = safeZoneY + safeZoneH * 0.29777778;
            w = safeZoneW * 0.0625;
            h = safeZoneH * 0.03666667;
            style = 1;
            text = "999.99";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class LabelCurrentAdmin
        {
            type = 0;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.11875;
            y = safeZoneY + safeZoneH * 0.34666667;
            w = safeZoneW * 0.1375;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "Current admin:";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class TextCurrentAdmin
        {
            type = 0;
            idc = 702;
            x = safeZoneX + safeZoneW * 0.24375;
            y = safeZoneY + safeZoneH * 0.34666667;
            w = safeZoneW * 0.0625;
            h = safeZoneH * 0.03666667;
            style = 1;
            text = "N/A";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class LabelServerViewDistance
        {
            type = 0;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.11875;
            y = safeZoneY + safeZoneH * 0.39555556;
            w = safeZoneW * 0.1375;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "View distance (Server):";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class TextServerViewDistance
        {
            type = 0;
            idc = 703;
            x = safeZoneX + safeZoneW * 0.24375;
            y = safeZoneY + safeZoneH * 0.39555556;
            w = safeZoneW * 0.0625;
            h = safeZoneH * 0.03666667;
            style = 1;
            text = "99999";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class LabelPlayerViewDistance
        {
            type = 0;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.11875;
            y = safeZoneY + safeZoneH * 0.44444445;
            w = safeZoneW * 0.1375;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "View distance (Player):";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class TextPlayerViewDistance
        {
            type = 0;
            idc = 704;
            x = safeZoneX + safeZoneW * 0.24375;
            y = safeZoneY + safeZoneH * 0.44444445;
            w = safeZoneW * 0.0625;
            h = safeZoneH * 0.03666667;
            style = 1;
            text = "99999";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class LabelCountAllUnits
        {
            type = 0;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.11875;
            y = safeZoneY + safeZoneH * 0.49333334;
            w = safeZoneW * 0.1375;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "Unit count (All):";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class TextCountAllUnits
        {
            type = 0;
            idc = 705;
            x = safeZoneX + safeZoneW * 0.24375;
            y = safeZoneY + safeZoneH * 0.49333334;
            w = safeZoneW * 0.0625;
            h = safeZoneH * 0.03666667;
            style = 1;
            text = "999";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class LabelCountBlufor
        {
            type = 0;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.11875;
            y = safeZoneY + safeZoneH * 0.54222223;
            w = safeZoneW * 0.1375;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "Unit count (BLUFOR):";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class TextCountBlufor
        {
            type = 0;
            idc = 706;
            x = safeZoneX + safeZoneW * 0.24375;
            y = safeZoneY + safeZoneH * 0.54222223;
            w = safeZoneW * 0.0625;
            h = safeZoneH * 0.03666667;
            style = 1;
            text = "999";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class LabelCountRedfor
        {
            type = 0;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.11875;
            y = safeZoneY + safeZoneH * 0.59111112;
            w = safeZoneW * 0.1375;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "Unit count (REDFOR):";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class TextCountRedfor
        {
            type = 0;
            idc = 707;
            x = safeZoneX + safeZoneW * 0.24375;
            y = safeZoneY + safeZoneH * 0.59111112;
            w = safeZoneW * 0.0625;
            h = safeZoneH * 0.03666667;
            style = 1;
            text = "999";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class LabelCountGreenfor
        {
            type = 0;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.11875;
            y = safeZoneY + safeZoneH * 0.64;
            w = safeZoneW * 0.1375;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "Unit count (GREENFOR):";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class TextCountGreenfor
        {
            type = 0;
            idc = 708;
            x = safeZoneX + safeZoneW * 0.24375;
            y = safeZoneY + safeZoneH * 0.64;
            w = safeZoneW * 0.0625;
            h = safeZoneH * 0.03666667;
            style = 1;
            text = "999";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class LabelCountCivfor
        {
            type = 0;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.11875;
            y = safeZoneY + safeZoneH * 0.68888889;
            w = safeZoneW * 0.1375;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "Unit count (CIVFOR):";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class TextCountCivfor
        {
            type = 0;
            idc = 709;
            x = safeZoneX + safeZoneW * 0.24375;
            y = safeZoneY + safeZoneH * 0.68888889;
            w = safeZoneW * 0.0625;
            h = safeZoneH * 0.03666667;
            style = 1;
            text = "999";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class LabelCountObject
        {
            type = 0;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.11875;
            y = safeZoneY + safeZoneH * 0.73777778;
            w = safeZoneW * 0.1375;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "Object count:";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class TextCountObject
        {
            type = 0;
            idc = 710;
            x = safeZoneX + safeZoneW * 0.24375;
            y = safeZoneY + safeZoneH * 0.73777778;
            w = safeZoneW * 0.0625;
            h = safeZoneH * 0.03666667;
            style = 1;
            text = "9999";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class LabelCountDead
        {
            type = 0;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.11875;
            y = safeZoneY + safeZoneH * 0.78666667;
            w = safeZoneW * 0.1375;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "Dead units:";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class TextCountDead
        {
            type = 0;
            idc = 711;
            x = safeZoneX + safeZoneW * 0.24375;
            y = safeZoneY + safeZoneH * 0.78666667;
            w = safeZoneW * 0.0625;
            h = safeZoneH * 0.03666667;
            style = 1;
            text = "999";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class ButtonTeleportTo
        {
            type = 1;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.7375;
            y = safeZoneY + safeZoneH * 0.73777778;
            w = safeZoneW * 0.125;
            h = safeZoneH * 0.04;
            style = 2;
            text = "Teleport to";
            borderSize = 0;
            colorBackground[] = {0.2,0.2,0.2,1};
            colorBackgroundActive[] = {0.1294,0.4549,0.6118,1};
            colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
            colorBorder[] = {0,0,0,0};
            colorDisabled[] = {0.2,0.2,0.2,1};
            colorFocused[] = {0.2,0.2,0.2,1};
            colorShadow[] = {0,0,0,0};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            offsetPressedX = 0.0025;
            offsetPressedY = 0.0025;
            offsetX = 0.0025;
            offsetY = 0.0025;
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
            soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
            soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
            soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
            onMouseButtonClick = QUOTE(call FUNC(teleportToPlayer));
        };

        class ButtonHealPlayer
        {
            type = 1;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.7375;
            y = safeZoneY + safeZoneH * 0.78666667;
            w = safeZoneW * 0.125;
            h = safeZoneH * 0.04;
            style = 2;
            text = "Heal";
            borderSize = 0;
            colorBackground[] = {0.2,0.2,0.2,1};
            colorBackgroundActive[] = {0.1294,0.4549,0.6118,1};
            colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
            colorBorder[] = {0,0,0,0};
            colorDisabled[] = {0.2,0.2,0.2,1};
            colorFocused[] = {0.2,0.2,0.2,1};
            colorShadow[] = {0,0,0,0};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            offsetPressedX = 0.0025;
            offsetPressedY = 0.0025;
            offsetX = 0.0025;
            offsetY = 0.0025;
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
            soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
            soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
            soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
            onMouseButtonClick = QUOTE(call FUNC(healPlayer));
        };

        class ButtonBringPlayer
        {
            type = 1;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.7375;
            y = safeZoneY + safeZoneH * 0.68888889;
            w = safeZoneW * 0.125;
            h = safeZoneH * 0.04;
            style = 2;
            text = "Bring";
            borderSize = 0;
            colorBackground[] = {0.2,0.2,0.2,1};
            colorBackgroundActive[] = {0.1294,0.4549,0.6118,1};
            colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
            colorBorder[] = {0,0,0,0};
            colorDisabled[] = {0.2,0.2,0.2,1};
            colorFocused[] = {0.2,0.2,0.2,1};
            colorShadow[] = {0,0,0,0};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            offsetPressedX = 0.0025;
            offsetPressedY = 0.0025;
            offsetX = 0.0025;
            offsetY = 0.0025;
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
            soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
            soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
            soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
            onMouseButtonClick = QUOTE(call FUNC(bringPlayer));
        };

        class ListboxTaskList
        {
            type = 5;
            idc = 712;
            x = safeZoneX + safeZoneW * 0.36875;
            y = safeZoneY + safeZoneH * 0.24777778;
            w = safeZoneW * 0.2125;
            h = safeZoneH * 0.27555556;
            style = 16;
            colorBackground[] = {0.2,0.2,0.2,1};
            colorDisabled[] = {0.2,0.2,0.2,1};
            colorSelect[] = {0.902,0.902,0.902,1};
            colorSelect2[] = {0.902,0.902,0.902,0.75};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            maxHistoryDelay = 0;
            rowHeight = 0;
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9);
            soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
            colorSelectBackground[] = {0.3,0.3,0.3,1};
            shadow = 0;
            class ListScrollBar
            {
                color[] = {1,1,1,1};
                thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
                arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
                arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
                border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
            };
        };

        class TitleTasklist
        {
            type = 0;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.36875;
            y = safeZoneY + safeZoneH * 0.19888889;
            w = safeZoneW * 0.1;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "Tasks";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.1);
        };

        class ButtonTaskCreated
        {
            type = 1;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.59375;
            y = safeZoneY + safeZoneH * 0.24888889;
            w = safeZoneW * 0.1125;
            h = safeZoneH * 0.03666667;
            style = 2;
            text = "Created";
            borderSize = 0;
            colorBackground[] = {0.2,0.2,0.2,1};
            colorBackgroundActive[] = {0.1294,0.4549,0.6118,1};
            colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
            colorBorder[] = {0,0,0,0};
            colorDisabled[] = {0.2,0.2,0.2,1};
            colorFocused[] = {0.302,0.302,0.302,1};
            colorShadow[] = {0,0,0,0};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            offsetPressedX = 0.0025;
            offsetPressedY = 0.0025;
            offsetX = 0.0025;
            offsetY = 0.0025;
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
            soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
            soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
            soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
            onMouseButtonClick = QUOTE(['CREATED'] call FUNC(setTaskState));
        };

        class ButtonTaskAssigned
        {
            type = 1;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.59375;
            y = safeZoneY + safeZoneH * 0.29777778;
            w = safeZoneW * 0.1125;
            h = safeZoneH * 0.03666667;
            style = 2;
            text = "Assigned";
            borderSize = 0;
            colorBackground[] = {0.2,0.2,0.2,1};
            colorBackgroundActive[] = {0.1294,0.4549,0.6118,1};
            colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
            colorBorder[] = {0,0,0,0};
            colorDisabled[] = {0.2,0.2,0.2,1};
            colorFocused[] = {0.2,0.2,0.2,1};
            colorShadow[] = {0,0,0,0};
            colorText[] = {0.8,0.502,0.2,1};
            font = "PuristaMedium";
            offsetPressedX = 0.0025;
            offsetPressedY = 0.0025;
            offsetX = 0.0025;
            offsetY = 0.0025;
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
            soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
            soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
            soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
            onMouseButtonClick = QUOTE(['ASSIGNED'] call FUNC(setTaskState));
        };

        class ButtonTaskSucceeded
        {
            type = 1;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.59375;
            y = safeZoneY + safeZoneH * 0.34555556;
            w = safeZoneW * 0.1125;
            h = safeZoneH * 0.03666667;
            style = 2;
            text = "Succeeded";
            borderSize = 0;
            colorBackground[] = {0.2,0.2,0.2,1};
            colorBackgroundActive[] = {0.1294,0.4549,0.6118,1};
            colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
            colorBorder[] = {0,0,0,0};
            colorDisabled[] = {0.2,0.2,0.2,1};
            colorFocused[] = {0.2,0.2,0.2,1};
            colorShadow[] = {0,0,0,0};
            colorText[] = {0,1,0,1};
            font = "PuristaMedium";
            offsetPressedX = 0.0025;
            offsetPressedY = 0.0025;
            offsetX = 0.0025;
            offsetY = 0.0025;
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
            soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
            soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
            soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
            onMouseButtonClick = QUOTE(['SUCCEEDED'] call FUNC(setTaskState));
        };

        class ButtonTaskFailed
        {
            type = 1;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.59375;
            y = safeZoneY + safeZoneH * 0.39555556;
            w = safeZoneW * 0.1125;
            h = safeZoneH * 0.03666667;
            style = 2;
            text = "Failed";
            borderSize = 0;
            colorBackground[] = {0.2,0.2,0.2,1};
            colorBackgroundActive[] = {0.1294,0.4549,0.6118,1};
            colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
            colorBorder[] = {0,0,0,0};
            colorDisabled[] = {0.2,0.2,0.2,1};
            colorFocused[] = {0.2,0.2,0.2,1};
            colorShadow[] = {0,0,0,0};
            colorText[] = {1,0,0,1};
            font = "PuristaMedium";
            offsetPressedX = 0.0025;
            offsetPressedY = 0.0025;
            offsetX = 0.0025;
            offsetY = 0.0025;
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
            soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
            soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
            soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
            onMouseButtonClick = QUOTE(['FAILED'] call FUNC(setTaskState));
        };

        class ButtonReassignCurator
        {
            type = 1;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.36875;
            y = safeZoneY + safeZoneH * 0.71333334;
            w = safeZoneW * 0.1125;
            h = safeZoneH * 0.03666667;
            style = 2;
            text = "Reassign Curator";
            borderSize = 0;
            colorBackground[] = {0.2,0.2,0.2,1};
            colorBackgroundActive[] = {0.1294,0.4549,0.6118,1};
            colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
            colorBorder[] = {0,0,0,0};
            colorDisabled[] = {0.2,0.2,0.2,1};
            colorFocused[] = {0.2,0.2,0.2,1};
            colorShadow[] = {0,0,0,0};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            offsetPressedX = 0.0025;
            offsetPressedY = 0.0025;
            offsetX = 0.0025;
            offsetY = 0.0025;
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
            soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
            soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
            soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
            onMouseButtonClick = QUOTE(call FUNC(reassignCurator));
        };

        class ButtonToggleFPS
        {
            type = 1;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.36875;
            y = safeZoneY + safeZoneH * 0.76222223;
            w = safeZoneW * 0.1125;
            h = safeZoneH * 0.03666667;
            style = 2;
            text = "Toggle FPS Counter";
            borderSize = 0;
            colorBackground[] = {0.2,0.2,0.2,1};
            colorBackgroundActive[] = {0.1294,0.4549,0.6118,1};
            colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
            colorBorder[] = {0,0,0,0};
            colorDisabled[] = {0.2,0.2,0.2,1};
            colorFocused[] = {0.2,0.2,0.2,1};
            colorShadow[] = {0,0,0,0};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            offsetPressedX = 0.0025;
            offsetPressedY = 0.0025;
            offsetX = 0.0025;
            offsetY = 0.0025;
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
            soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
            soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
            soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
            onMouseButtonClick = QUOTE([QQGVAR(onPlayerFPSToggled)] call CFUNC(localEvent));
        };

        class ButtonTerminateMission
        {
            type = 1;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.36875;
            y = safeZoneY + safeZoneH * 0.61444445;
            w = safeZoneW * 0.1125;
            h = safeZoneH * 0.03666667;
            style = 2;
            text = "Terminate Mission";
            borderSize = 0;
            colorBackground[] = {0.2,0.2,0.2,1};
            colorBackgroundActive[] = {0.1294,0.4549,0.6118,1};
            colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
            colorBorder[] = {0,0,0,0};
            colorDisabled[] = {0.2,0.2,0.2,1};
            colorFocused[] = {0.2,0.2,0.2,1};
            colorShadow[] = {0,0,0,0};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            offsetPressedX = 0.0025;
            offsetPressedY = 0.0025;
            offsetX = 0.0025;
            offsetY = 0.0025;
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
            soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
            soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
            soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
            onMouseButtonClick = QUOTE(call FUNC(terminateMission));
        };

        class ButtonOpenArsenal
        {
            type = 1;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.36875;
            y = safeZoneY + safeZoneH * 0.66444445;
            w = safeZoneW * 0.1125;
            h = safeZoneH * 0.03666667;
            style = 2;
            text = "Open Arsenal";
            borderSize = 0;
            colorBackground[] = {0.2,0.2,0.2,1};
            colorBackgroundActive[] = {0.1294,0.4549,0.6118,1};
            colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
            colorBorder[] = {0,0,0,0};
            colorDisabled[] = {0.2,0.2,0.2,1};
            colorFocused[] = {0.2,0.2,0.2,1};
            colorShadow[] = {0,0,0,0};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            offsetPressedX = 0.0025;
            offsetPressedY = 0.0025;
            offsetX = 0.0025;
            offsetY = 0.0025;
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
            soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
            soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
            soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
            onMouseButtonClick = QUOTE(call FUNC(openArsenal));
        };

        class TitlePlayercount
        {
            type = 0;
            idc = 717;
            x = safeZoneX + safeZoneW * 0.79375;
            y = safeZoneY + safeZoneH * 0.2;
            w = safeZoneW * 0.0625;
            h = safeZoneH * 0.03666667;
            style = 1;
            text = "99 / 99";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.1);
        };

        class TitleMissionName
        {
            type = 0;
            idc = 713;
            x = safeZoneX + safeZoneW * 0.36875;
            y = safeZoneY + safeZoneH * 0.54222223;
            w = safeZoneW * 0.3375;
            h = safeZoneH * 0.03666667;
            style = 2;
            text = "CO99_Operation_Placeholder (by Placeholder)";
            colorBackground[] = {0.2,0.2,0.2,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9);
        };

        class ProgressBarMissionTime
        {
            type = 8;
            idc = 719;
            x = safeZoneX + safeZoneW * 0.49375;
            y = safeZoneY + safeZoneH * 0.66444445;
            w = safeZoneW * 0.2125;
            h = safeZoneH * 0.03111112;
            style = 0;
            colorBar[] = {0.1294,0.4549,0.6118,1};
            colorFrame[] = {0.6,0.6,0.6,1};
            texture = "#(argb,8,8,3)color(1,1,1,1)";
        };

        class TitleMissionProgress
        {
            type = 0;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.49375;
            y = safeZoneY + safeZoneH * 0.61555556;
            w = safeZoneW * 0.2125;
            h = safeZoneH * 0.03666667;
            style = 2;
            text = "Mission Progress / Time Limit";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9);
        };

        class LabelServerTime
        {
            type = 0;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.49375;
            y = safeZoneY + safeZoneH * 0.71333334;
            w = safeZoneW * 0.0875;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "System time:";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class TextServerTime
        {
            type = 0;
            idc = 715;
            x = safeZoneX + safeZoneW * 0.59375;
            y = safeZoneY + safeZoneH * 0.71333334;
            w = safeZoneW * 0.1125;
            h = safeZoneH * 0.03666667;
            style = 1;
            text = "9999-99-99 00:00:00";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class LabelMissionProgress
        {
            type = 0;
            idc = 714;
            x = safeZoneX + safeZoneW * 0.49875;
            y = safeZoneY + safeZoneH * 0.67222223;
            w = safeZoneW * 0.2025;
            h = safeZoneH * 0.01555556;
            style = 2;
            text = "00:00:00 / 00:00:00";
            colorBackground[] = {0,0,0,0};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class LabelServerUptime
        {
            type = 0;
            idc = -1;
            x = safeZoneX + safeZoneW * 0.49375;
            y = safeZoneY + safeZoneH * 0.76222223;
            w = safeZoneW * 0.0875;
            h = safeZoneH * 0.03666667;
            style = 0;
            text = "Server uptime:";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class TextServerUptime
        {
            type = 0;
            idc = 716;
            x = safeZoneX + safeZoneW * 0.59375;
            y = safeZoneY + safeZoneH * 0.76222223;
            w = safeZoneW * 0.1125;
            h = safeZoneH * 0.03666667;
            style = 1;
            text = "00:00:00";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
        };

        class ButtonTaskCancelled
        {
            type = 1;
            idc = 720;
            x = safeZoneX + safeZoneW * 0.59375;
            y = safeZoneY + safeZoneH * 0.44555556;
            w = safeZoneW * 0.1125;
            h = safeZoneH * 0.03666667;
            style = 2;
            text = "Cancelled";
            borderSize = 0;
            colorBackground[] = {0.2,0.2,0.2,1};
            colorBackgroundActive[] = {0.1294,0.4549,0.6118,1};
            colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
            colorBorder[] = {0,0,0,0};
            colorDisabled[] = {0.2,0.2,0.2,1};
            colorFocused[] = {0.2,0.2,0.2,1};
            colorShadow[] = {0,0,0,0};
            colorText[] = {0.4,0.4,0.4,1};
            font = "PuristaMedium";
            offsetPressedX = 0.0025;
            offsetPressedY = 0.0025;
            offsetX = 0.0025;
            offsetY = 0.0025;
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
            soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
            soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
            soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
            soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
            onMouseButtonClick = QUOTE(['CANCELED'] call FUNC(setTaskState));
        };

        class TitlePlayerInfo
        {
            type = 0;
            idc = 721;
            x = safeZoneX + safeZoneW * 0.7375;
            y = safeZoneY + safeZoneH * 0.63888889;
            w = safeZoneW * 0.125;
            h = safeZoneH * 0.04;
            style = 16+0;
            text = "";
            colorBackground[] = {0.2,0.2,0.2,1};
            colorText[] = {0.902,0.902,0.902,1};
            font = "PuristaMedium";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75);
            lineSpacing = 0.9;
        };
    };
};
