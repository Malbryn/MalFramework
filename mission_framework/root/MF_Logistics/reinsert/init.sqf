/*
 * Author:
 * Malbryn
 *
 * Description:
 * Adds different options to an object ("TP pole") for reinsertion
 *
 * Arguments:
 * _this select 0: OBJECT - Object that acts as a TP pole
 *
 * Return Value:
 * void
 *
 * Example:
 * [this] execVM "mission_framework\root\MF_Logistics\reinsert\reinsertCore.sqf"
 *
 */

if (!hasInterface) exitWith {};

// Option #1 - Paradrop
if (MF_var_use_halo) then {
  tpPole addAction ["Reinsert - Paradrop", {
    [] spawn MF_fnc_haloDrop;
  }];
};

// Option #2 - MRV
if (MF_var_use_mrv) then {
  tpPole addAction ["Reinsert - MRV", {
    [] spawn MF_fnc_tpToMrv;
  }];
};

// Option #3 - Squad rally point
if (MF_var_use_rp) then {
  tpPole addAction ["Reinsert - Rally Point", {
    [] spawn MF_fnc_tpToRp;
  }];
};