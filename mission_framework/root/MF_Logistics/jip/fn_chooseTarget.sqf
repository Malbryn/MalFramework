/*
 * Author:
 * Diwako
 *
 * Description:
 * Checks target for a valid unit in the player's group
 *
 * Arguments:
 * -
 *
 * Return Value:
 * OBJECT
 *
 * Example:
 * [] call MF_fnc_jipChooseTarget
 *
 */

private _target = objNull;
private _partGroup = units group player;

// If player is not the leader and the leader is alive then the leader is the target
if (player != leader group player && {alive leader group player}) then {
    _target = leader group player;
};

// If player is the leader or the leader is dead then pick the next best one
if (player == leader group player || {!alive leader group player}) then {
    _partGroup = _partGroup - [player];

    // Check if part group is empty
    if !(count _partGroup == 0) then {
        _target = _partGroup select (_partGroup findIf {alive _x});
    };
};

//Return
_target
