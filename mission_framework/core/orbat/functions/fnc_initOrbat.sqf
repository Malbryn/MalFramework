#include "script_component.hpp"

/*
    Author:
        BlackHawk

    Description:
        Add a Diary tab that shows the current ORBAT and player loadouts

    Arguments:
        -

    Example:
        call MF_orbat_fnc_setOrbat

    Returns:
        void
*/

private ["_newIndex", "_playerSide", "_groupArray"];

_newIndex = player createDiarySubject ["GearIndex", "ORBAT"];
_playerSide = playerSide;
_groupArray = [];

{
    private ["_groupText"];

    _groupText = "";

    if (side _x isEqualto _playerSide) then {
        private ["_group", "_show", "_textToDisplay"];

        _group = _x;
        _show = false;
        _textToDisplay = "";

        {
            private ["_unit", "_lobbyName"];

            _unit = _x;

            if ((alive _unit) && {((isMultiplayer) && (_unit in playableUnits)) || ((!isMultiplayer) && (_unit in switchableUnits))}) then {
                private ["_getPicture", "_image", "_getApparelPicture", "_getWeaponPicture", "_displayMags", "_getMuzzleMags", "_sWeaponName", "_hWeaponName", "_weaponName", "_allMags", "_primaryMags", "_secondaryMags", "_handgunMags", "_radio", "_allItems"];

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

                _lobbyName = if !(((roleDescription _x) find "@") isEqualto -1) then {
                    ((roleDescription _x) splitString "@")#0
                } else {
                    roleDescription _x;
                };

                if (_lobbyName isEqualto "") then {
                    _lobbyName = getText (configFile >> "CfgVehicles" >> typeOf _x >> "displayName")
                };

                // Creating briefing text
                _textToDisplay = _textToDisplay + format ["", rank _unit];
                _textToDisplay = _textToDisplay +
                format ["<img image='\A3\Ui_f\data\GUI\Cfg\Ranks\%4_gs.paa' width='16' height='16'/> <font size='14' color='%5'>%1 - %2</font> - %3kg<br/>",
                name _unit,
                _lobbyName,
                round ((loadAbs _unit) *0.1 * 0.45359237 * 10) / 10,
                toLower rank _unit,

                if (_unit isEqualto player) then {"#5555FF"} else {"#FFFFFF"}];

                _getApparelPicture = {
                    if !(_this isEqualto "") then {
                        private ["_name", "_pic"];

                        _name  = getText(configFile >> "CfgWeapons" >> _this >> "displayName");

                        if (_name isEqualto "") then {
                            _name = getText(configFile >> "CfgVehicles" >> _this >> "displayName");
                        };

                        _pic = [_this, [40, 40]] call _getPicture;

                        if (_pic isEqualto "") then {
                            _pic = [_this, [40, 40], "CfgVehicles"] call _getPicture;
                        };

                        _pic + format ["<execute expression='systemChat ""%1""'>*</execute>  ", _name]
                    } else {
                        ""
                    };
                };

                {_textToDisplay = _textToDisplay + (_x call _getApparelPicture)} forEach [uniform _unit, vest _unit, backpack _unit, headgear _unit];

                _textToDisplay = _textToDisplay + "<br/>";

                // Display both weapon and it's attachments
                _getWeaponPicture = {
                    params ["_weaponName", "_weaponItems"];
                    private ["_str"];

                    _str = "";
                    if !(_weaponName isEqualto "") then {
                        _str = _str + ([_weaponName, [80, 40]] call _getPicture);
                        {
                            if !(_x isEqualto "") then {
                                _str = _str + ([_x, [40, 40]] call _getPicture);
                            };
                        } forEach _weaponItems;
                    };

                    _str
                };

                // Display array of magazines
                _displayMags = {
                    _textToDisplay = _textToDisplay + "  ";
                    {
                        private ["_name", "_itemCount", "_displayName"];

                        _name = _x;
                        _itemCount = {_x isEqualto _name} count _allMags;
                        _displayName = getText(configFile >> "CfgMagazines" >> _name >> "displayName");
                        _textToDisplay = _textToDisplay + ([_name, [32,32], "CfgMagazines"] call _getPicture) + format ["<execute expression='systemChat ""%2""'>x%1</execute> ", _itemCount, _displayName];
                    } forEach _this;

                    _textToDisplay = _textToDisplay + "<br/>";
                };

                // Get magazines for a weapon and it's muzzles (grenade launchers etc.)
                _getMuzzleMags = {
                    private ["_result"];

                    _result = getArray(configFile >> "CfgWeapons" >> _this >> "magazines");
                        {
                            if (!(_x isEqualto "this") && {!(_x isEqualto "SAFE")}) then {
                                {_result pushBackUnique _x} forEach getArray (configFile >> "CfgWeapons" >> _this >> _x >> "magazines");
                            };
                        } forEach getArray (configFile >> "CfgWeapons" >> _this >> "muzzles");

                    _result = _result apply {toLower _x};
                    _result
                };

                _sWeaponName = secondaryWeapon _unit;
                _hWeaponName = handgunWeapon _unit;
                _weaponName = primaryWeapon _unit;

                // Primary weapon
                if !(_weaponName isEqualto "") then {
                    private ["_name"];

                    _name = getText(configFile >> "CfgWeapons" >> _weaponName >> "displayName");
                    _textToDisplay = _textToDisplay + format ["<font color='#FFFF00'>Primary: </font>%1<br/>", _name] + ([_weaponName, primaryWeaponItems _unit] call _getWeaponPicture);
                };

                _allMags = magazines _unit;
                _allMags = _allMags apply {toLower _x};
                _primaryMags = _allMags arrayIntersect (_weaponName call _getMuzzleMags);

                _primaryMags call _displayMags;

                // Secondary
                _secondaryMags = [];

                if !(_sWeaponName isEqualto "") then {
                    private ["_name"];

                    _name = getText(configFile >> "CfgWeapons" >> _sWeaponName >> "displayName");
                    _textToDisplay = _textToDisplay + format ["<font color='#FFFF00'>Launcher: </font>%1<br/>", _name];
                    _textToDisplay = _textToDisplay + ([_sWeaponName, secondaryWeaponItems _unit] call _getWeaponPicture);
                    _secondaryMags = _allMags arrayIntersect (_sWeaponName call _getMuzzleMags);
                    _secondaryMags call _displayMags;
                };

                // Handgun
                _handgunMags = [];
                if !(_hWeaponName isEqualto "") then {
                    private ["_name"];

                    _name = getText(configFile >> "CfgWeapons" >> _hWeaponName >> "displayName");
                    _textToDisplay = _textToDisplay + format ["<font color='#FFFF00'>Sidearm: </font>%1<br/>", _name];
                    _textToDisplay = _textToDisplay + ([_hWeaponName, handgunItems _unit] call _getWeaponPicture);
                    _handgunMags = _allMags arrayIntersect (_hWeaponName call _getMuzzleMags);
                    _handgunMags call _displayMags;
                };

                _allMags = _allMags - _primaryMags;
                _allMags = _allMags - _secondaryMags;
                _allMags = _allMags - _handgunMags;

                _radio = [];
                _allItems = items _unit;

                {
                    if !((toLower _x) find "tfar_" isEqualto -1) then {
                        _radio pushBack _x;
                    };
                } forEach _allItems;

                _allItems = _allItems - _radio;

                _textToDisplay = _textToDisplay + format ["<font color='#FFFF00'>Magazines and items: </font>(Click count for info.)<br/>", _x];

                // Display radios, then magazines, inventory items and assigned items
                {
                    _x params ["_items", "_cfgType"];
                    while {count _items > 0} do {
                        private ["_name", "_itemCount", "_displayName"];

                        _name = _items#0;
                        _itemCount = {_x isEqualto _name} count _items;
                        _displayName = getText(configFile >> _cfgType >> _name >> "displayName");
                        _textToDisplay = _textToDisplay + ([_name, [32,32], _cfgType] call _getPicture) + format ["<execute expression='systemChat ""%2""'>x%1</execute>  ", _itemCount, _displayName];
                        _items = _items - [_name];
                    };
                } forEach [[_radio, "CfgWeapons"], [_allMags, "CfgMagazines"], [_allItems, "CfgWeapons"], [assignedItems _unit, "CfgWeapons"]];

                _textToDisplay = _textToDisplay + "<br/>============================================================<br/>";
                _show = true;

            };
        } foreach units _group;

        if _show then {
            _groupText = _groupText + _textToDisplay;
        };

        if !(_groupText isEqualto "") then {
            _groupArray set [count _groupArray, ["GearIndex", [groupID _group, _groupText]]]
        };
    };
} foreach allGroups;

reverse _groupArray;
{player createDiaryRecord _x;} foreach _groupArray;

call FUNC(showOrbat);
