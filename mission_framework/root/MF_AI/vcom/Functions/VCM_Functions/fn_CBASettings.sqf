[] spawn {
    
	waitUntil {!(isNil "CBAACT")};
    if !(CBAACT) exitwith {};

    [
        "VCM_ActivateAI",              // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
        "CHECKBOX",                    // Setting type
        "Vcom Active",                 // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Vcom AI Settings",            // Pretty name of the category where the setting can be found. Can be stringtable entry.
        true,                          // Data for this setting
        true,                          // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
        {
            params ["_value"];
            VCM_ActivateAI = _value;
        }                              // Function that will be executed once on mission start and every time the setting is changed.
    ] call CBA_Settings_fnc_init;


    [
        "VCM_USECBASETTINGS",
        "CHECKBOX",
        "Use CBA-Vcom Settings?",
        "Vcom AI Settings",
        true,
        true,
        {
            params ["_value"];
            VCM_USECBASETTINGS = _value;
        } 
    ] call CBA_Settings_fnc_init;	


    [
        "VCM_Debug", 
        "CHECKBOX", 
        "Enable Debug Mode. Mostly systemchat messages.", 
        "Vcom AI Settings", 
        false,
        true, 
        {  
            params ["_value"];
            VCM_Debug = _value;
        } 
    ] call CBA_Settings_fnc_init;


    [
        "VCM_SIDEENABLED", 
        "LIST", 
        "Sides impacted by Vcom.",
        "Vcom AI Settings", 
        [[[west,east,resistance],[west,east],[west],[east],[resistance],[resistance,west],[resistance,east]],[["West, East, Resistance"],["West, East"],["West"],["East"],["Resistance"],["Resistance, West"],["Resistance, East"]],0],
        true, 
        {  
            params ["_value"];
            VCM_SIDEENABLED = _this;
        } 
    ] call CBA_Settings_fnc_init;


    [
        "VCM_ARTYENABLE", 
        "CHECKBOX", 
        "Enable AI use of Artillery", 
        "Vcom AI Settings", 
        true,
        true, 
        {  
            params ["_value"];
            VCM_ARTYENABLE = _value;
        } 
    ] call CBA_Settings_fnc_init;


    [
        "VCM_ARTYSIDES", 
        "LIST", 
        "Sides that will use VCOM Artillery", 
        "Vcom AI Settings",
        [[[west,east,resistance],[west,east],[west],[east],[resistance],[resistance,west],[resistance,east]],[["West, East, Resistance"],["West, East"],["West"],["East"],["Resistance"],["Resistance, West"],["Resistance, East"]],0],
        true, 
        {  
            params ["_value"];
            VCM_ARTYSIDES = _this;
        } 
    ] call CBA_Settings_fnc_init;


    [
        "VCM_CARGOCHNG", 
        "CHECKBOX", 
        "Vcom handling of disembark/embarking for AI?", 
        "Vcom AI Settings", 
        true,
        true, 
        {  
            params ["_value"];
            VCM_CARGOCHNG = _value;
        } 
    ] call CBA_Settings_fnc_init;


    [
        "VCM_TURRETUNLOAD", 
        "CHECKBOX", 
        "Disembark from turret positions?", 
        "Vcom AI Settings", 
        true,
        true,
        {  
            params ["_value"];
            VCM_TURRETUNLOAD = _value;
        } 
    ] call CBA_Settings_fnc_init;
    [
        "VCM_DISEMBARKRANGE", 
        "SLIDER", 
        "Distance AI disembark from the enemy?", 
        "Vcom AI Settings", 
        [50,1000,200,0],
        true, 
        {  
            params ["_value"];
            VCM_DISEMBARKRANGE = _value;
        } 
    ] call CBA_Settings_fnc_init;


    [
        "VCM_StealVeh", 
        "CHECKBOX", 
        "AI steal empty/unlocked vehicles?", 
        "Vcom AI Settings", 
        true,
        true, 
        {  
            params ["_value"];
            VCM_StealVeh = _value;
        } 
    ] call CBA_Settings_fnc_init;


    [
        "VCM_ClassSteal", 
        "CHECKBOX", 
        "Class restriction for stealing vehicles", 
        "Vcom AI Settings", 
        true,
        true, 
        {  
            params ["_value"];
            VCM_ClassSteal = _value;
        } 
    ] call CBA_Settings_fnc_init;


    [
        "VCM_ForceSpeed", 
        "CHECKBOX", 
        "Enforce AI Speed 'FULL'?", 
        "Vcom AI Settings",
        true,
        true, 
        {  
            params ["_value"];
            VCM_FullSpeed = _value;
        } 
    ] call CBA_Settings_fnc_init;


    [
        "VCM_ADVANCEDMOVEMENT", 
        "CHECKBOX", 
        "AI generate new waypoints to flank.", 
        "Vcom AI Settings", 
        true,
        true, 
        {  
            params ["_value"];
            VCM_ADVANCEDMOVEMENT = _value;
        } 
    ] call CBA_Settings_fnc_init;


    [
        "VCM_FRMCHANGE", 
        "CHECKBOX", 
        "AI change formations based on location.", 
        "Vcom AI Settings", 
        true,
        true, 
        {  
            params ["_value"];
            VCM_FRMCHANGE = _value;
        } 
    ] call CBA_Settings_fnc_init;


    [
        "VCM_SKILLCHANGE", 
        "CHECKBOX", 
        "AI impacted by Vcom skill settings.", 
        "Vcom AI Settings", 
        true,
        true, 
        {  
            params ["_value"];
            VCM_SKILLCHANGE = _value;
        } 
    ] call CBA_Settings_fnc_init;


    [
        "VCM_AIDISTANCEVEHPATH", 
        "SLIDER", 
        "Distance AI will steal vehicles from.", 
        "Vcom AI Settings", 
        [0,1000,100,0],
        true, 
        {  
            params ["_value"];
            VCM_AIDISTANCEVEHPATH = _value;
        } 
    ] call CBA_Settings_fnc_init;


    [
        "VCM_RAGDOLL", 
        "CHECKBOX", 
        "AI Ragdoll when hit?", 
        "Vcom AI Settings", 
        true,
        true, 
        {  
            params ["_value"];
            VCM_RAGDOLL = _value;
        } 
    ] call CBA_Settings_fnc_init;


    [
        "VCM_RAGDOLLCHC", 
        "SLIDER", 
        "Chance for AI to ragdoll when hit.", 
        "Vcom AI Settings", 
        [0,100,50,0],
        true, 
        {  
            params ["_value"];
            VCM_RAGDOLLCHC = _value;
        } 
    ] call CBA_Settings_fnc_init;


    [
        "VCM_HEARINGDISTANCE", 
        "SLIDER", 
        "Distance AI can hear gunfire.", 
        "Vcom AI Settings", 
        [0,10000,1200,0],
        true, 
        {  
            params ["_value"];
            VCM_HEARINGDISTANCE = _value;
        } 
    ] call CBA_Settings_fnc_init;


    [
        "VCM_WARNDIST", 
        "SLIDER", 
        "Distance AI will call for reinforcements from.", 
        "Vcom AI Settings", 
        [0,10000,1000,0],
        true, 
        {  
            params ["_value"];
            VCM_WARNDIST = _value;
        } 
    ] call CBA_Settings_fnc_init;


    [
        "VCM_WARNDELAY", 
        "SLIDER", 
        "Time (seconds) AI wait before support called.", 
        "Vcom AI Settings", 
        [0,10000,30,0],
        true, 
        {  
            params ["_value"];
            VCM_WARNDELAY = _value;
        } 
    ] call CBA_Settings_fnc_init;


    [
        "VCM_STATICARMT", 
        "SLIDER", 
        "Time (seconds) AI stay on unarmed Static Weapons", 
        "Vcom AI Settings", 
        [0,10000,300,0],
        true, 
        {  
            params ["_value"];
            VCM_STATICARMT = _value;
        } 
    ] call CBA_Settings_fnc_init;


    [
        "VCM_MINECHANCE", 
        "SLIDER", 
        "Chance for AI to place a mine, once in combat.", 
        "Vcom AI Settings", 
        [0,100,75,0],
        true, 
        {  
            params ["_value"];
            VCM_MINECHANCE = _value;
        } 
    ] call CBA_Settings_fnc_init;


    [
        "VCM_ARTYDELAY", 
        "SLIDER", 
        "Delay before artillery requests. SIDE BASED.", 
        "Vcom AI Settings", 
        [0,5000,30,0],
        true, 
        {  
            params ["_value"];
            VCM_ARTYDELAY = _value;
        } 
    ] call CBA_Settings_fnc_init;


    [
        "VCM_AIMagLimit", 
        "SLIDER", 
        "Mag count AI begin to look for additional mags.", 
        "Vcom AI Settings", 
        [2,10,5,0],
        true, 
        {  
            params ["_value"];
            VCM_AIMagLimit = _value;
        } 
    ] call CBA_Settings_fnc_init;


    [
        "VCM_AISNIPERS", 
        "CHECKBOX", 
        "Special marksman/sniper AI", 
        "Vcom AI Settings", 
        true,
        true, 
        {  
            params ["_value"];
            VCM_AISNIPERS = _value;
        } 
    ] call CBA_Settings_fnc_init;


    [
        "VCM_AISUPPRESS", 
        "CHECKBOX", 
        "Suppress enemies more, and at a further range.", 
        "Vcom AI Settings", 
        true,
        true, 
        {  
            params ["_value"];
            VCM_AISUPPRESS = _value;
        } 
    ] call CBA_Settings_fnc_init;

    [
        "VCM_ADVANCEDMOVEMENT", 
        "CHECKBOX", 
        "AI generate new waypoints to flank.", 
        "Vcom AI Settings", 
        true,
        true, 
        {  
            params ["_value"];
            VCM_ADVANCEDMOVEMENT = _value;
        } 
    ] call CBA_Settings_fnc_init;


    [
        "Vcm_DrivingActivated", 
        "CHECKBOX", 
        "Experimental Improvements to AI driving.", 
        "Vcom AI Settings", 
        false,
        true, 
        {  
            params ["_value"];
            Vcm_DrivingActivated = _value;
        } 
    ] call CBA_Settings_fnc_init;


    [
        "Vcm_PlayerAISkills", 
        "CHECKBOX", 
        "Player AI recieve unique skill settings", 
        "Vcom AI Settings", 
        true,
        true, 
        {  
            params ["_value"];
            Vcm_PlayerAISkills = _value;
        } 
    ] call CBA_Settings_fnc_init;


    diag_log "VCOM: Loaded CBA settings";
};