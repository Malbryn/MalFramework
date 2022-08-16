#include "script_component.hpp"

/*
    Author:
        BlackHawk,

    Description:
        Add a Diary tab that shows the current ORBAT and player loadouts.

    Arguments:
        -

    Example:
        call MF_orbat_fnc_initOrbat

    Returns:
        void
*/

private _playerSide = playerSide;

if (_playerSide == sideLogic) exitWith {};

private _getPicture = {
    params ["_name", "_dimensions", ["_type", "CfgWeapons"]];

    if (_name isEqualTo "") exitWith {""};
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

private _getApparelPicture = {
    if (_this isNotEqualTo "") then {
        private _name  = getText (configFile >> "CfgWeapons" >> _this >> "displayName");

        if (_name isEqualTo "") then {
            _name = getText (configFile >> "CfgVehicles" >> _this >> "displayName");
        };

        private _pic = [_this, [40, 40]] call _getPicture;

        if (_pic isEqualTo "") then {
            _pic = [_this, [40, 40], "CfgVehicles"] call _getPicture;
        };

        _pic + format ["<execute expression='systemChat ""%1""'>*</execute>  ", _name]
    } else {
        ""
    };
};

// Display both weapon and it's attachments
private _getWeaponPicture = {
    params ["_weaponName", "_weaponItems"];

    private _pictureText = [];

    if (_weaponName isNotEqualTo "") then {
        _pictureText pushBack ([_weaponName, [80, 40]] call _getPicture);

        _weaponItems apply {
            if (_x isNotEqualTo "") then {
                _pictureText append [[_x, [40, 40]] call _getPicture, format ["<execute expression='systemChat ""%1""'>*</execute>  ", getText (configFile >> "CfgWeapons" >> _x >> "displayName")]];
            };
        };
    };

    _pictureText joinString ""
};

// Display array of magazines
private _displayMags = {
    params ["_compatibleMags", "_allMags"];

    private _magsText = ["  "];

    _compatibleMags apply {
        _name = _x;
        _magsText append [[_name, [32,32], "CfgMagazines"] call _getPicture, format ["<execute expression='systemChat ""%2""'>x%1</execute> ", {_x isEqualTo _name} count _allMags, getText (configFile >> "CfgMagazines" >> _name >> "displayName")]];
    };

    _magsText pushBack "<br/>";

    _magsText joinString ""
};


private _newIndex = player createDiarySubject ["GearIndex", "ORBAT"];
private _groupArray = [];

(allGroups select {(side _x) isEqualTo _playerSide}) apply {
    private _group = _x;
    private _textToDisplay = [];

    (units _group) apply {
        private _unit = _x;

        if ((alive _unit) && {((isMultiplayer) && (_unit in playableUnits)) || ((!isMultiplayer) && (_unit in switchableUnits))}) then {
            private _lobbyName = _x call EFUNC(common,getUnitDescription);

            if (_lobbyName isEqualTo "") then {
                _lobbyName = getText (configOf _x >> "displayName");
            };

            // Creating briefing text
            _textToDisplay pushBack format ["<img image='\A3\Ui_f\data\GUI\Cfg\Ranks\%4_gs.paa' width='16' height='16'/> <font size='14' color='%5'>%1 - %2</font> - %3kg<br/>",
                name _unit,
                _lobbyName,
                round ((loadAbs _unit) * 0.45359237) / 10,
                toLower rank _unit,
                ["#FFFFFF", "#5555FF"] select (_unit isEqualTo player)
            ];

            [uniform _unit, vest _unit, backpack _unit, headgear _unit] apply {
                _textToDisplay pushBack (_x call _getApparelPicture);
            };

            _textToDisplay pushBack "<br/>";

            private _sWeaponName = secondaryWeapon _unit;
            private _hWeaponName = handgunWeapon _unit;
            private _weaponName = primaryWeapon _unit;

            private _allMags = magazines _unit;

            // Primary weapon
            if (_weaponName isNotEqualTo "") then {
                _textToDisplay append [format ["<font color='#FFFF00'>Primary: </font>%1<br/>", getText (configFile >> "CfgWeapons" >> _weaponName >> "displayName")], [_weaponName, primaryWeaponItems _unit] call _getWeaponPicture];
                private _primaryCompatibleMags = _allMags arrayIntersect ([_weaponName, true] call CBA_fnc_compatibleMagazines);
                _textToDisplay pushBack ([_primaryCompatibleMags, _allMags] call _displayMags);
                _allMags = _allMags - _primaryCompatibleMags;
            };

            // Secondary weapon
            if (_sWeaponName isNotEqualTo "") then {
                _textToDisplay append [format ["<font color='#FFFF00'>Launcher: </font>%1<br/>", getText (configFile >> "CfgWeapons" >> _sWeaponName >> "displayName")], [_sWeaponName, secondaryWeaponItems _unit] call _getWeaponPicture];
                private _secondaryCompatibleMags = _allMags arrayIntersect ([_sWeaponName, true] call CBA_fnc_compatibleMagazines);
                _textToDisplay pushBack ([_secondaryCompatibleMags, _allMags] call _displayMags);
                _allMags = _allMags - _secondaryCompatibleMags;
            };

            // Handgun
            if (_hWeaponName isNotEqualTo "") then {
                _textToDisplay append [format ["<font color='#FFFF00'>Sidearm: </font>%1<br/>", getText (configFile >> "CfgWeapons" >> _hWeaponName >> "displayName")], [_hWeaponName, handgunItems _unit] call _getWeaponPicture];
                private _handgunCompatibleMags = _allMags arrayIntersect ([_hWeaponName, true] call CBA_fnc_compatibleMagazines);
                _textToDisplay pushBack ([_handgunCompatibleMags, _allMags] call _displayMags);
                _allMags = _allMags - _handgunCompatibleMags;
            };

            private _radios = [];
            private _items = items _unit;
            private _assignedItems = assignedItems _unit;

            if GVARMAIN(moduleTFAR) then {
                (_unit call TFUNC(getRadioItems)) apply {
                    _radios pushBack _x;
                };
            };

            if GVARMAIN(moduleACRE) then {
                (_items + _assignedItems) apply {
                    if (_x call acre_api_fnc_isBaseRadio || {_x call acre_api_fnc_isRadio}) then {
                        _radios pushBack _x;
                    };
                };
            };

            _textToDisplay pushBack format ["<font color='#FFFF00'>Misc. items: </font>(Click count for info.)<br/>", _x];

            // Display magazines, inventory items, radios and assigned items
            [[_allMags, "CfgMagazines"], [_items - _radios, "CfgWeapons"], [_radios, "CfgWeapons"], [_assignedItems - _radios, "CfgWeapons"]] apply {
                _x params ["_items", "_cfgType"];

                _items = _items call CBA_fnc_getArrayElements;

                for "_i" from 0 to count _items - 2 step 2 do {
                    _name = _items select _i;
                    _textToDisplay append [[_name, [32,32], _cfgType] call _getPicture, format ["<execute expression='systemChat ""%2""'>x%1</execute>  ", _items select (_i + 1), getText (configFile >> _cfgType >> _name >> "displayName")]];
                };
            };

            _textToDisplay pushBack "<br/>============================================================<br/>";
        };
    };

    if (_textToDisplay isNotEqualTo []) then {
        _groupArray pushBack ["GearIndex", [groupID _group, _textToDisplay joinString ""]]
    };
};

reverse _groupArray;
_groupArray apply {
    player createDiaryRecord _x;
};

call FUNC(showOrbat);
