/*
 * Author:
 * Kex (modified by Malbryn)
 *
 * Description:
 * Adds a "Mission Intel" diary record to the players diary
 *
 * Arguments:
 * _this select 0: STRING - Title of the intel
 * _this select 1: STRING - Intel text
 * _this select 2: STRING - Name of the player who found the intel
 *
 * Return Value:
 * void
 *
 * Example:
 * ["Test title", "Test text", name player] call MF_fnc_addIntelToDiary
 *
 */

if (!hasInterface) exitWith {};

params ["_title", "_text", "_finder"];

private _diaryId = "MF_Intel";

if !(player diarySubjectExists _diaryId) then {
    player createDiarySubject [_diaryId, "Mission Intel"];
};

player createDiaryRecord [_diaryId, [_title, _text]];
player createDiaryRecord [_diaryId, [_title, "--------------------------------"]];

if (name player == _finder) then {
    openMap [true, false];
};
