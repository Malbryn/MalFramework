class MaskOverlay {
    idd = -1;
    movingEnable = false;
    duration = 10e10;
    onLoad = "";
    controlsBackground[] = {overlay};
    objects[] = {};
    controls[] = {};

    class overlay {
        idc = 901;
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
        text = "mission_framework\core\cbrn\img\mask.paa";
    };
};
