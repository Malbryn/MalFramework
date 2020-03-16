if (hasInterface) then {
    [] spawn {
        [{
            #include "runIntro.sqf"
        }, [], MF_var_title_delay] call CBA_fnc_waitAndExecute;
    };
};