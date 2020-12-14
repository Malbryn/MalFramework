#include "script_component.hpp"

/*
    Author:
        Kex (modified by Malbryn)

    Description:
        Adds a "Mission Intel" diary record to the player's diary.

    Arguments:
        0: STRING - Title of the intel
        1: STRING - Intel text
        2: STRING - Name of the player who found the intel
        3: BOOLEAN - If the intel was shared globally

    Example:
        ["Test title", "Test text", name player, true] call MF_intel_fnc_addIntelToDiary

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params ["_title", "_text", "_finder", "_isGlobal"];

private _diaryId = QGVAR(intelDiary);

if !(player diarySubjectExists _diaryId) then {
    player createDiarySubject [_diaryId, "Mission Intel"];
};

player createDiaryRecord [_diaryId, [_title, format ["Shared globally: %1", _isGlobal]]];
player createDiaryRecord [_diaryId, [_title, _text]];
player createDiaryRecord [_diaryId, [_title, "--------------------------------"]];

if (name player == _finder) then {
    openMap [true, false];
};
