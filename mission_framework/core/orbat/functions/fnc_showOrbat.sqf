/*
    Author:
        BlackHawk

    Description:
        -

    Arguments:
        -

    Example:
        call MF_orbat_fnc_refreshOrbat

    Returns:
        -
*/

private ["_text", "_getPicture", "_unit", "_radio", "_image", "_optics", "_opticsClasses", "_class", "_lobbyName"];

_text = "<br/><execute expression='call MF_orbat_fnc_refreshOrbat'>Refresh</execute> (click to show JIPs)<br/><br/>";

_getPicture = {
    params ["_name", "_dimensions", ["_type", "CfgWeapons"]];

    if (_name isEqualto "") exitwith {""};
    if !(isText(configFile >> _type >> _name >> "picture")) exitwith {""};

    _image = getText(configFile >> _type >> _name >> "picture");

    if (_image isEqualto "") then {
        _image = "\A3\ui_f\data\map\markers\military\unknown_CA.paa";
    };

    if ((_image find ".paa") isEqualto -1) then {
        _image = _image + ".paa";
    };

    format ["<img image='%1' width='%2' height='%3'/>", _image, _dimensions#0, _dimensions#1];
};

allGroups apply {
    if (((side _x) isEqualto (playerSide)) && {!isNull leader _x} && {(isPlayer leader _x) || !(isMultiplayer)}) then {
        _text = _text + format ["<font size='20' color='#FFFF00'>%1</font>", groupID _x] + "<br/>";

        {
            _unit = _x;
            _radio = "";

            (items _unit + assignedItems _unit) apply {
                if !((toLower _x) find "tfar_" isEqualto -1) then {
                    _radio = _radio + ([_x, [28,28]] call _getPicture);
                };
            };

            _optics = "";
            _opticsClasses = [
                "UK3CB_BAF_Soflam_Laserdesignator",
                "Laserdesignator",
                "Laserdesignator_01_khk_F",
                "Laserdesignator_02",
                "Laserdesignator_02_ghex_F",
                "Laserdesignator_03",
                "rhsusf_bino_lerca_1200_black",
                "rhsusf_bino_lerca_1200_tan",
                "ACE_VectorDay",
                "ACE_Vector",
                "rhs_pdu4",
                "rhsusf_bino_lrf_Vector21",
                "Rangefinder",
                "ACE_Yardage450",
                "ACE_MX2A",
                "Binocular",
                "rhsusf_bino_m24_ARD",
                "rhsusf_bino_m24",
                "rhsusf_bino_leopold_mk4"
            ];

            _opticsClasses apply {
                _class = _x;

                if (_class in (items _unit + assignedItems _unit)) exitwith {
                    _optics = ([_class, [28,28]] call _getPicture);
                };
            };

            _lobbyName = if !(((roleDescription _unit) find "@") isEqualto -1) then {
                ((roleDescription _unit) splitString "@") select 0} else {roleDescription _unit
            };

            if (_lobbyName isEqualto "") then {
                _lobbyName = getText (configFile >> "CfgVehicles" >> typeOf _unit >> "displayName")
            };

            _text = _text +
            format ["%1<img image='\A3\Ui_f\data\GUI\Cfg\Ranks\%2_gs.paa' width='15' height='15'/> <font size='16' color='%3'>%4 | %5</font> %6 | %7kg<br/>%8 %9 %10 %11<br/>",
                if (_forEachIndex isEqualto 0) then {""} else {"     "},
                rank _unit,
                if (_unit isEqualto player) then {"#5555FF"} else {"#FFFFFF"},
                name _unit,
                _lobbyName,
                _radio,
                ((round ((loadAbs _unit) * 0.45359237)) / 10),
                if !(primaryWeapon _unit isEqualto "") then {[primaryWeapon _unit, [56,28]] call _getPicture} else {if !(handgunWeapon _unit isEqualto "") then {[handgunWeapon _unit, [56,28]] call _getPicture} else {""}},
                if !(secondaryWeapon _unit isEqualto "") then {[secondaryWeapon _unit, [56,28]] call _getPicture} else {""},
                if !(backpack _unit isEqualto "") then {[backpack _unit, [28,28], "CfgVehicles"] call _getPicture} else {""},
                _optics
            ];
        } forEach [leader _x] + (units _x - [leader _x]);
    };
};

_text = _text + "<br/>============================================================";
_text = _text + "<br/>============================================================";

player createDiaryRecord ["GearIndex", ["ORBAT", _text]];
