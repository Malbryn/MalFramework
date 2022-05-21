/*
    Create a loadout in the ACE Arsenal, click 'Export' and then paste the exported array.

    Use selectRandom to randomise stuff.
    Example:

    case "SL" : {
        _randomStuff = selectRandom ["stuff1_classname", "stuff2_classname"];

        _gear = [
            ...,
            _randomStuff,
            ...
        ];
    };
 */

// CTRG 2035

case "SL" : {
    _randomFacewear = selectRandom ["G_Aviator", "G_Shades_Black", "G_Balaclava_TI_G_tna_F"];

    _gear = [
        // Primary weapon
        ["arifle_SPAR_01_blk_ERCO_Pointer_F","","acc_pointer_IR","optic_ERCO_blk_F",["30Rnd_556x45_Stanag_red",30],[],""],
        // Launcher
        [],
        // Secondary weapon
        ["hgun_P07_khk_Snds_F","muzzle_snds_L","","",["16Rnd_9x21_Mag",17],[],""],
        // Uniform
        ["U_B_CTRG_Soldier_F",[["FirstAidKit",1],["30Rnd_556x45_Stanag_Tracer_Red",2,30],["30Rnd_556x45_Stanag_red",1,30],["SmokeShell",1,1]]],
        // Vest
        ["V_TacVest_oli",[["30Rnd_556x45_Stanag_red",2,30],["16Rnd_9x21_Mag",2,17],["MiniGrenade",2,1],["SmokeShellGreen",1,1],["SmokeShellBlue",1,1],["SmokeShellOrange",1,1],["Chemlight_green",2,1]]],
        // Backpack
        ["B_RadioBag_01_tropic_F"],
        // Helmet
        "H_HelmetB_TI_tna_F",
        // Facewear
        _randomFacewear,
        // Binos
        ["Rangefinder","","","",[],[],""],
        // Linked items
        ["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","NVGogglesB_grn_F"]
    ];
};


case "MEDIC" : {
    _gear = [
        ["arifle_SPAR_01_blk_ERCO_Pointer_F","","acc_pointer_IR","optic_ERCO_blk_F",["30Rnd_556x45_Stanag_red",30],[],""],
        [],
        ["hgun_P07_khk_Snds_F","muzzle_snds_L","","",["16Rnd_9x21_Mag",17],[],""],
        ["U_B_CTRG_Soldier_F",[["FirstAidKit",1],["30Rnd_556x45_Stanag_red",3,30],["SmokeShell",1,1]]],
        ["V_TacVest_oli",[["30Rnd_556x45_Stanag_red",2,30],["16Rnd_9x21_Mag",2,17],["MiniGrenade",2,1],["SmokeShellGreen",1,1],["Chemlight_green",2,1]]],
        ["B_AssaultPack_rgr_CTRGMedic_F",[["Medikit",1],["FirstAidKit",5],["SmokeShellRed",1,1],["SmokeShellBlue",1,1],["SmokeShellOrange",1,1]]],
        "H_HelmetB_TI_tna_F",
        "G_Balaclava_TI_G_tna_F",
        ["Binocular","","","",[],[],""],
        ["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","NVGogglesB_grn_F"]
    ];
};


case "AR" : {
    _gear = [
        ["arifle_SPAR_02_blk_ERCO_Pointer_F","","acc_pointer_IR","optic_ERCO_blk_F",["150Rnd_556x45_Drum_Mag_F",150],[],"bipod_01_F_blk"],
        [],
        ["hgun_P07_khk_Snds_F","muzzle_snds_L","","",["16Rnd_9x21_Mag",17],[],""],
        ["U_B_CTRG_Soldier_F",[["FirstAidKit",1],["16Rnd_9x21_Mag",1,17],["MiniGrenade",1,1],["SmokeShellGreen",1,1],["Chemlight_green",2,1]]],
        ["V_TacVest_oli",[["150Rnd_556x45_Drum_Mag_F",2,150],["150Rnd_556x45_Drum_Mag_Tracer_F",1,150],["16Rnd_9x21_Mag",1,17],["SmokeShell",1,1]]],
        [],
        "H_HelmetB_TI_tna_F",
        "G_Balaclava_TI_G_tna_F",
        [],
        ["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","NVGogglesB_grn_F"]
    ];
};


case "RM" : {
    _gear = [
        ["arifle_SPAR_01_blk_ERCO_Pointer_F","","acc_pointer_IR","optic_ERCO_blk_F",["30Rnd_556x45_Stanag_red",30],[],""],
        ["launch_NLAW_F","","","",[],[],""],
        ["hgun_P07_khk_Snds_F","muzzle_snds_L","","",["16Rnd_9x21_Mag",17],[],""],
        ["U_B_CTRG_Soldier_F",[["FirstAidKit",1],["ACRE_PRC343",1],["30Rnd_556x45_Stanag_red",3,30],["SmokeShell",1,1]]],
        ["V_TacVest_oli",[["30Rnd_556x45_Stanag_red",2,30],["16Rnd_9x21_Mag",2,17],["MiniGrenade",2,1],["SmokeShellGreen",1,1],["Chemlight_green",2,1]]],
        ["B_AssaultPack_eaf_F",[["ACRE_PRC117F",1]]],
        "H_HelmetB_TI_tna_F",
        "G_Balaclava_TI_G_tna_F",
        ["Binocular","","","",[],[],""],
        ["ItemMap","ItemGPS","","ItemCompass","ItemWatch","NVGogglesB_grn_F"]
    ];
};
