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

// SPETSNAZ 2035

case "SL" : {
    _randomFacewear = selectRandom ["G_Aviator", "G_Shades_Black", "G_Spectacles_Tinted"];

    _gear = [
        // Primary weapon
        ["arifle_AK12_GL_lush_arco_pointer_F","","acc_pointer_IR","optic_Arco_AK_lush_F",["30rnd_762x39_AK12_Lush_Mag_F",30],["1Rnd_HE_Grenade_shell",1],""],
        // Launcher
        [],
        // Secondary weapon
        ["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],
        // Uniform
        ["U_O_R_Gorka_01_camo_F",[["FirstAidKit",1],["30rnd_762x39_AK12_Lush_Mag_F",2,30]]],
        // Vest
        ["V_SmershVest_01_radio_F",[["30rnd_762x39_AK12_Lush_Mag_F",1,30],["30rnd_762x39_AK12_Lush_Mag_Tracer_F",2,30],["16Rnd_9x21_Mag",2,17],["MiniGrenade",2,1],["1Rnd_HE_Grenade_shell",5,1],["SmokeShell",1,1],["SmokeShellRed",1,1],["SmokeShellOrange",1,1],["SmokeShellYellow",1,1],["Chemlight_red",2,1],["1Rnd_Smoke_Grenade_shell",2,1],["1Rnd_SmokeRed_Grenade_shell",1,1],["1Rnd_SmokeOrange_Grenade_shell",1,1],["1Rnd_SmokeYellow_Grenade_shell",1,1]]],
        // Backpack
        [],
        // Helmet
        "H_HelmetAggressor_cover_taiga_F",
        // Facewear
        _randomFacewear,
        // Binos
        ["Rangefinder","","","",[],[],""],
        // Linked items
        ["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","O_NVGoggles_grn_F"]
    ];
};


case "MEDIC" : {
    _gear = [
        ["arifle_AK12U_lush_holo_pointer_F","","acc_pointer_IR","optic_Holosight_lush_F",["30rnd_762x39_AK12_Lush_Mag_F",30],[],""],
        [],
        ["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],
        ["U_O_R_Gorka_01_camo_F",[["FirstAidKit",1],["30rnd_762x39_AK12_Lush_Mag_F",2,30]]],
        ["V_SmershVest_01_F",[["30rnd_762x39_AK12_Lush_Mag_F",3,30],["16Rnd_9x21_Mag",2,17],["SmokeShell",1,1],["SmokeShellRed",1,1],["SmokeShellOrange",1,1],["SmokeShellYellow",1,1],["Chemlight_red",2,1]]],
        ["B_FieldPack_taiga_Medic_F",[["Medikit",1],["FirstAidKit",10],["SmokeShellRed",1,1],["SmokeShellBlue",1,1],["SmokeShellOrange",1,1]]],
        "H_HelmetAggressor_cover_taiga_F",
        "",
        [],
        ["ItemMap","","ItemRadio","ItemCompass","ItemWatch","O_NVGoggles_grn_F"]
    ];
};


case "AR" : {
    _gear = [
        ["arifle_RPK12_lush_arco_pointer_F","","acc_pointer_IR","optic_Arco_AK_lush_F",["75rnd_762x39_AK12_Lush_Mag_F",75],[],""],
        [],
        ["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],
        ["U_O_R_Gorka_01_camo_F",[["FirstAidKit",1],["SmokeShell",1,1]]],
        ["V_SmershVest_01_F",[["75rnd_762x39_AK12_Lush_Mag_F",5,75],["16Rnd_9x21_Mag",2,17],["HandGrenade",1,1],["SmokeShellRed",1,1],["Chemlight_red",2,1]]],
        [],
        "H_HelmetAggressor_cover_taiga_F",
        "G_Balaclava_blk",
        [],
        ["ItemMap","","ItemRadio","ItemCompass","ItemWatch","O_NVGoggles_grn_F"]
    ];
};


case "RM" : {
    _gear = [
        ["arifle_AK12U_lush_holo_pointer_F","","acc_pointer_IR","optic_Holosight_lush_F",["30rnd_762x39_AK12_Lush_Mag_F",30],[],""],
        ["launch_RPG32_green_F","","","",["RPG32_F",1],[],""],
        ["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],
        ["U_O_R_Gorka_01_camo_F",[["FirstAidKit",1],["ACRE_PRC343",1],["30rnd_762x39_AK12_Lush_Mag_F",2,30]]],
        ["V_SmershVest_01_F",[["30rnd_762x39_AK12_Lush_Mag_F",3,30],["16Rnd_9x21_Mag",2,17],["SmokeShell",1,1],["SmokeShellRed",1,1],["Chemlight_red",2,1]]],
        ["B_Carryall_green_F",[["ACRE_PRC117F",1]]],
        "H_HelmetAggressor_cover_taiga_F",
        "G_Balaclava_blk",
        [],
        ["ItemMap","","","ItemCompass","ItemWatch","O_NVGoggles_grn_F"]
    ];
};
