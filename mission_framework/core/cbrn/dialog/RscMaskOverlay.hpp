class MaskOverlay {
    idd = 901;
    movingEnable = false;
    fadein = 0.5;
    fadeout = 0.5;
    duration = 10e10;
    onLoad = "";
    controlsBackground[] = {MaskOverlayControl};
    objects[] = {};
    controls[] = {};

    class MaskOverlayControl {
        idc = 902;
        type = 0;
        style = 48;
        colorBackground[] = {};
        colorText[] = {};
        font = "PuristaMedium";
        sizeEx = 1.0;
        moving = false;
        x = safeZoneXAbs;
        y = SafeZoneY - safeZoneH / 4;
        w = safeZoneWAbs;
        h = safeZoneH * 1.5;
        text = "mission_framework\core\cbrn\dialog\mask.paa";
    };
};
