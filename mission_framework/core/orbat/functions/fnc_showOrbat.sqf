#include "script_component.hpp"

/*
    Author:
        BlackHawk

    Description:
        -

    Arguments:
        -

    Example:
        call MF_orbat_fnc_showOrbat

    Returns:
        -
*/

private _text = ["<br/><execute expression='call MF_orbat_fnc_refreshOrbat'>Refresh</execute> (click to show JIPs)<br/><br/>"];

private _getPicture = {
    params ["_name", "_dimensions", ["_type", "CfgWeapons"]];

    if (_name isEqualTo "") exitwith {""};
    if !(isText (configFile >> _type >> _name >> "picture")) exitwith {""};

    private _image = getText (configFile >> _type >> _name >> "picture");

    if (_image isEqualTo "") then {
        _image = "\A3\ui_f\data\map\markers\military\unknown_CA.paa";
    };

    if !(".paa" in _image) then {
        _image = _image + ".paa";
    };

    format ["<img image='%1' width='%2' height='%3'/>", _image, _dimensions#0, _dimensions#1]
};

private _opticsClasses = (uiNamespace getVariable "ace_arsenal_configItems") param [9, [
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
    ]
];

private _playerSide = playerSide;
private _lobbyName = "";
private _optics = "";
private _radio = [""];
private _unit = objNull;

(allGroups select {((side _x) isEqualTo _playerSide) && {!isNull leader _x} && {(isPlayer leader _x) || !isMultiplayer}}) apply {
    _text append [format ["<font size='20' color='#FFFF00'>%1</font>", groupID _x], "<br/>"];

    {
        _unit = _x;
        _radio = [""];
        _items = (items _unit + assignedItems _unit);

        if GVARMAIN(moduleTFAR) then {
            (_unit call TFUNC(getRadioItems)) apply {
                _radio pushBack ([_x, [28,28]] call _getPicture);
            };
        };

        if GVARMAIN(moduleACRE) then {
            _items apply {
                if (_x call acre_api_fnc_isBaseRadio || {_x call acre_api_fnc_isRadio}) then {
                    _radio pushBack ([_x, [28,28]] call _getPicture);
                };
            };
        };

        _optics = "";

        _opticsClasses apply {
            if (_x in _items) exitWith {
                _optics = [_x, [28,28]] call _getPicture;
            };
        };

        _lobbyName = _x call EFUNC(common,getUnitDescription);

        if (_lobbyName isEqualTo "") then {
            _lobbyName = getText (configOf _unit >> "displayName");
        };

        _text pushBack format [
            "%1<img image='\A3\Ui_f\data\GUI\Cfg\Ranks\%2_gs.paa' width='15' height='15'/> <font size='16' color='%3'>%4 | %5</font> %6 | %7kg<br/>%8 %9 %10 %11<br/>",
            ["     ", ""] select (_forEachIndex == 0),
            rank _unit,
            ["#FFFFFF", "#5555FF"] select (_unit isEqualTo player),
            name _unit,
            _lobbyName,
            _radio joinString "",
            (round ((loadAbs _unit) * 0.45359237)) / 10,
            if (primaryWeapon _unit isNotEqualTo "") then {[primaryWeapon _unit, [56,28]] call _getPicture} else {if (handgunWeapon _unit isNotEqualTo "") then {[handgunWeapon _unit, [56,28]] call _getPicture} else {""}},
            if (secondaryWeapon _unit isNotEqualTo "") then {[secondaryWeapon _unit, [56,28]] call _getPicture} else {""},
            if (backpack _unit isNotEqualTo "") then {[backpack _unit, [28,28], "CfgVehicles"] call _getPicture} else {""},
            _optics
        ];
    } forEach ([leader _x] + (units _x - [leader _x]));
};

_text append ["<br/>============================================================", "<br/>============================================================"];

player createDiaryRecord ["GearIndex", ["ORBAT", _text joinString ""]];
