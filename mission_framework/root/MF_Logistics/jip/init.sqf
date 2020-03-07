if (hasInterface) then {
    [] spawn {
        if (didJIP) then {
            #include "jipCore.sqf"
        };
    };
};