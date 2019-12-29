/*
    Author(s): NeilZar

    Description:
        Sets all settings for mods that use CBA for settings.
*/
// TFAR Settings
force force TFAR_giveLongRangeRadioToGroupLeaders = false;
force force TFAR_givePersonalRadioToRegularSoldier = false;
force force TFAR_giveMicroDagrToSoldier = false;
force force TFAR_SameSRFrequenciesForSide = true;
force force TFAR_SameLRFrequenciesForSide = true;
force force TFAR_enableIntercom = true;
force force TFAR_objectInterceptionEnabled = true;
force force TFAR_spectatorCanHearEnemyUnits = false;
force force TFAR_spectatorCanHearFriendlies = true;
force force TFAR_takingRadio = 1;
force force TFAR_fullDuplex = true;
force force TF_terrain_interception_coefficient = 7;
force force TFAR_setting_DefaultRadio_Rifleman_West = "TFAR_anprc152";
force force TFAR_setting_DefaultRadio_Rifleman_East = "TFAR_fadak";
force force TFAR_setting_DefaultRadio_Rifleman_Independent = "TFAR_anprc154";
force force TFAR_setting_DefaultRadio_Personal_West = "TFAR_anprc152";
force force TFAR_setting_DefaultRadio_Personal_east = "TFAR_fadak";
force force TFAR_setting_DefaultRadio_Personal_Independent = "TFAR_anprc154";
force force TFAR_setting_DefaultRadio_Backpack_west = "TFAR_rt1523g";
force force TFAR_setting_DefaultRadio_Backpack_east = "TFAR_mr3000";
force force TFAR_setting_DefaultRadio_Backpack_Independent = "TFAR_anprc155";
force force TFAR_setting_DefaultRadio_Airborne_West = "TFAR_anarc210";
force force TFAR_setting_DefaultRadio_Airborne_east = "TFAR_mr6000l";
force force TFAR_setting_DefaultRadio_Airborne_Independent = "TFAR_anarc164";
force force TFAR_radioCodesDisabled = true;
force force TFAR_AICanHearPlayer = false;

//TFAR Frequency Settings
force force TFAR_setting_defaultFrequencies_sr_west = "110,120,130,140,150,160,170,180,100";
force force TFAR_setting_defaultFrequencies_sr_east = "110,120,130,140,150,160,170,180,100";
force force TFAR_setting_defaultFrequencies_sr_independent = "110,120,130,140,150,160,170,180,100";
force force TFAR_setting_defaultFrequencies_lr_west = "69,68,67,66,65,64,63,62,70";
force force TFAR_setting_defaultFrequencies_lr_east = "69,68,67,66,65,64,63,62,70";
force force TFAR_setting_defaultFrequencies_lr_independent = "69,68,67,66,65,64,63,62,70";

// ACE Advanced Ballistics
force force ace_advanced_ballistics_enabled = false;
force force ace_advanced_ballistics_muzzleVelocityVariationEnabled = true;
force force ace_advanced_ballistics_ammoTemperatureEnabled = true;
force force ace_advanced_ballistics_barrelLengthInfluenceEnabled = true;
force force ace_advanced_ballistics_bulletTraceEnabled = true;
force force ace_advanced_ballistics_simulationInterval = 0.05;

// ACE Advanced Fatique
force force ace_advanced_fatigue_enabled = true;
force force ace_advanced_fatigue_enableStaminaBar = true;
force force ace_advanced_fatigue_performanceFactor = 1.2;
force force ace_advanced_fatigue_recoveryFactor = 1.2;
force force ace_advanced_fatigue_loadFactor = 1;
force force ace_advanced_fatigue_terrainGradientFactor = 0.8;

// ACE Arsenal
force force ace_arsenal_enableIdentityTabs = true;
force force ace_arsenal_allowDefaultLoadouts = false;
force force ace_arsenal_allowSharedLoadouts = true;
force force ace_arsenal_EnableRPTLog = true;

// ACE Captives
force force ace_captives_allowHandcuffOwnSide = true;
force force ace_captives_requireSurrender = 1;
force force ace_captives_allowSurrender = true;
force force ace_captives_requireSurrenderAi = false;

// ACE Cookoff
force force ace_cookoff_enable = true;
force force ace_cookoff_enableAmmobox = true;
force force ace_cookoff_enableAmmoCookoff = true;
force force ace_cookoff_ammoCookoffDuration = 0.3;
force force ace_cookoff_probabilityCoef = 0.3;

// ACE Explosives
force force ace_explosives_requireSpecialist = false;
force force ace_explosives_punishNonSpecialists = true;
force force ace_explosives_explodeOnDefuse = true;

// ACE Hearing
force force ace_hearing_enableCombatDeafness = false;
force force ace_hearing_earplugsVolume = 0.75;
force force ace_hearing_unconsciousnessVolume = 0.3;
force force ace_hearing_disableEarRinging = true;
force force ace_hearing_enabledForZeusUnits = false;
force force ace_hearing_autoAddEarplugsToUnits = false;

// ACE Interaction
force force ace_interaction_enableTeamManagement = true;
force force ace_interaction_enableMagazinePassing = true;
force force ace_interaction_disableNegativeRating = true;

// ACE Logistics
force force ace_refuel_rate = 1;
force force ace_refuel_hoseLength = 15;
force force ace_repair_displayTextOnRepair = true;
force force ace_repair_engineerSetting_repair = 0;
force force ace_repair_engineerSetting_wheel = 0;
force force ace_repair_repairDamageThreshold = 0.6;
force force ace_repair_repairDamageThreshold_engineer = 0.4;
force force ace_repair_consumeItem_toolKit = 0;
force force ace_repair_fullRepairLocation = 3;
force force ace_repair_engineerSetting_fullRepair = 1;
force force ace_repair_addSpareParts = true;
force force ace_repair_wheelRepairRequiredItems = 0;
force force ace_repair_autoShutOffEngineWhenStartingRepair = false;
force force ace_cargo_enable = true;
force force ace_cargo_paradropTimeCoefficent = 2.5;

// ACE Magazine Repack
force force ace_magazinerepack_timePerAmmo = 1.5;
force force ace_magazinerepack_timePerMagazine = 2;
force force ace_magazinerepack_timePerBeltLink = 8;

// ACE Map
force force ace_map_mapIllumination = true;
force force ace_map_mapGlow = true;
force force ace_map_mapShake = true;
force force ace_map_mapLimitZoom = false;
force force ace_map_mapShowCursorCoordinates = false;
force force ace_map_defaultChannel = 1;
force force ace_map_gestures_enabled = true;
force force ace_map_BFT_Enabled = false;
force force ace_map_BFT_Interval = 1;
force force ace_map_BFT_ShowPlayerNames = false;
force force ace_map_BFT_HideAiGroups = true;

// ACE Markers
force force ace_markers_movableMarkersEnabled = true;
force force ace_markers_moveRestriction = 3;

// ACE Medical
force force ace_medical_level = 2;
force force ace_medical_medicSetting = 2;
force force ace_medical_enableFor = 1;
force force ace_medical_enableOverdosing = true;
force force ace_medical_enableVehicleCrashes = true;
force force ace_medical_enableUnconsciousnessAI = 1;
force force ace_medical_bleedingCoefficient = 1;
force force ace_medical_painCoefficient = 1;
force force ace_medical_enableAdvancedWounds = true;
force force ace_medical_playerDamageThreshold = 1;
force force ace_medical_AIDamageThreshold = 1;
force force ace_medical_remoteControlledAI = true;
force force ace_medical_preventInstaDeath = true;
force force ace_medical_enableRevive = 0;
force force ace_medical_maxReviveTime = 120;
force force ace_medical_increaseTrainingInLocations = false;
force force ace_medical_amountOfReviveLives = 1;
force force ace_medical_allowDeadBodyMovement = true;
force force ace_medical_allowLitterCreation = true;
force force ace_medical_litterCleanUpDelay = 600;
force force ace_medical_blood_enabledFor = 2;
force force ace_medical_medicSetting_basicEpi = 1;
force force ace_medical_medicSetting_PAK = 1;
force force ace_medical_medicSetting_SurgicalKit = 1;
force force ace_medical_consumeItem_PAK = 0;
force force ace_medical_consumeItem_SurgicalKit = 0;
force force ace_medical_useLocation_basicEpi = 0;
force force ace_medical_useLocation_PAK = 0;
force force ace_medical_useLocation_SurgicalKit = 0;
force force ace_medical_useCondition_PAK = 1;
force force ace_medical_useCondition_SurgicalKit = 1;
force force ace_medical_keepLocalSettingsSynced = true;
force force ace_medical_healHitPointAfterAdvBandage = false;
force force ace_medical_painIsOnlySuppressed = true;
force force ace_medical_allowUnconsciousAnimationOnTreatment = true;
force force ace_medical_moveUnitsFromGroupOnUnconscious = false;
force force ace_medical_delayUnconCaptive = 3;
force force ace_medical_ai_enabledFor = 2;
force force ace_medical_menu_allow = 1;
force force ace_medical_enableAirway = false;
force force ace_medical_enableFractures = false;
force force ace_medical_menu_maxRange = 3;

// ACE Mortar
force force ace_mk6mortar_airResistanceEnabled = true;
force force ace_mk6mortar_allowComputerRangefinder = false;
force force ace_mk6mortar_allowCompass = true;
force force ace_mk6mortar_useAmmoHandling = true;

// ACE Night Vision
force force ace_nightvision_aimDownSightsBlur = 0.1;
force force ace_nightvision_disableNVGsWithSights = false;
force force ace_nightvision_effectScaling = 0.3;
force force ace_nightvision_fogScaling = 0;
force force ace_nightvision_noiseScaling = 0.3;
force force ace_nightvision_shutterEffects = false;

// ACE Overheating
force force ace_overheating_overheatingDispersion = true;
force force ace_overheating_unJamOnreload = true;
force force ace_overheating_unJamFailChance = 0.0;
force force ace_overheating_enabled = true;
force force ace_overheating_displayTextOnJam = true;
ace_overheating_showParticleEffects = false;
ace_overheating_showParticleEffectsForEveryone = false;

// ACE Pointing
force force ace_finger_enabled = true;
force force ace_finger_maxRange = 4;

// ACE Pylons
force force ace_pylons_enabled = true;
force force ace_pylons_searchDistance = 15;
force force ace_pylons_timePerPylon = 5;
force force ace_pylons_requireEngineer = false;
force force ace_pylons_requireToolkit = false;

// ACE Rearm
force force ace_rearm_level = 0;
force force ace_rearm_supply = 0;

// ACE Respawn
force force ace_respawn_savePreDeathGear = false;
force force ace_respawn_bodyRemoveTimer = 60;

// ACE Scopes
force force ace_scopes_enabled = true;
force force ace_scopes_forceUseOfAdjustmentTurrets = false;
force force ace_scopes_correctZeroing = true;
force force ace_scopes_overwriteZeroRange = false;
force force ace_scopes_defaultZeroRange = 100;
force force ace_scopes_zeroReferenceTemperature = 15;
force force ace_scopes_zeroReferenceBarometricPressure = 1013.25;
force force ace_scopes_zeroReferenceHumidity = 0;
force force ace_scopes_deduceBarometricPressureFromTerrainAltitude = false;
force force ace_scopes_useLegacyUI = false;
force force ace_scopes_simplifiedZeroing = false;

// ACE Spectator
force force ace_spectator_enableAI = true;
force force ace_spectator_restrictModes = 0;
force force ace_spectator_restrictVisions = 0;

// ACE Switch Units
force force ace_switchunits_enableSwitchUnits = false;
force force ace_switchunits_switchToWest = false;
force force ace_switchunits_switchToEast = false;
force force ace_switchunits_switchToIndependent = false;
force force ace_switchunits_switchToCivilian = false;
force force ace_switchunits_enableSafeZone = true;
force force ace_switchunits_safeZoneRadius = 100;

// ACE Uncategorised
force force ace_noradio_enabled = true;
force force ace_gforces_enabledFor = 1;
force force ace_hitreactions_minDamageToTrigger = 0.1;
force force ace_laser_dispersionCount = 2;
force force ace_laserpointer_enabled = true;
force force ace_microdagr_mapDataAvailable = 2;
force force ace_overpressure_distanceCoefficient = 1;
force force ace_common_forceAllSettings = false;

// ACE UI
force force ace_ui_soldierVehicleWeaponInfo = true;

// ACE Vehicle Lock
force force ace_vehiclelock_defaultLockpickStrength = 10;
force force ace_vehiclelock_lockVehicleInventory = false;
force force ace_vehiclelock_vehicleStartingLockState = -1;

// ACE View Distance
force force ace_viewdistance_enabled = false;
force force ace_viewdistance_viewDistanceOnFoot = 0;
force force ace_viewdistance_viewDistanceLandVehicle = 0;
force force ace_viewdistance_viewDistanceAirVehicle = 0;
force force ace_viewdistance_limitViewDistance = 10000;
force force ace_viewdistance_objectViewDistanceCoeff = 0;

// ACE Weather
force force ace_weather_enabled = true;
force force ace_weather_updateInterval = 60;
force force ace_weather_windSimulation = false;
force force ace_weather_enableServerController = true;
force force ace_weather_useACEWeather = false;
force force ace_weather_syncRain = false;
force force ace_weather_syncWind = false;
force force ace_weather_syncMisc = false;
force force ace_weather_serverUpdateInterval = 60;

// ACE Wind Deflection
force force ace_winddeflection_enabled = true;
force force ace_winddeflection_vehicleEnabled = true;
force force ace_winddeflection_simulationInterval = 0.05;

// ACE Zeus
force force ace_zeus_zeusAscension = false;
force force ace_zeus_zeusBird = false;
force force ace_zeus_remoteWind = false;
force force ace_zeus_radioOrdnance = false;
force force ace_zeus_revealMines = 0;
force force ace_zeus_autoAddObjects = true;

// ADV - ACE Splint
force force adv_aceSplint_enable = true;
force force adv_aceSplint_patientCondition = 1;
force force adv_aceSplint_reopenChance_medic = 0;
force force adv_aceSplint_reopenChance_regular = 50;
force force adv_aceSplint_reopenTime = 300;
force force adv_aceSplint_reuseChance = 0;

// Diwako's ACE Ragdolling
force force diwako_ragdoll_ai = true;
force force diwako_ragdoll_ragdolling = true;
force force diwako_ragdoll_server_only = false;

// DUI - Squad Radar - Indicators
force force diwako_dui_indicators_range = 20;

// DUI - Squad Radar - Radar
force force diwako_dui_compassRange = 35;
force force diwako_dui_enable_occlusion = true;
force force diwako_dui_radar_occlusion_fade_time = 10;
force force diwako_dui_show_squadbar = false;

// Suppress
force force L_Suppress_enabled = true;
force force L_Suppress_flyByEffects = true;
force force L_Suppress_recovery = 1.5;
force force L_Suppress_buildup = 1.5;
force force L_Suppress_intensity = 1;
force force L_Suppress_flyByIntensity = 1;
force force L_Suppress_halting = true;

// ASR AI3
force force asr_ai3_control_onteamswitchleader = true;
force force asr_ai3_danger_AD_INSIDE = 50;
force force asr_ai3_danger_AD_OUTSIDE = 250;
force force asr_ai3_danger_ADVANCED_COVER = true;
force force asr_ai3_danger_ATTACK_TIMER = 25;
force force asr_ai3_danger_AUTO_ATTACK_WITHIN = 100;
force force asr_ai3_danger_COUNTER_ATTACK = false;
force force asr_ai3_danger_debug_findcover = false;
force force asr_ai3_danger_debug_reveal = false;
force force asr_ai3_danger_getinweapons = 0.5;
force force asr_ai3_danger_MAX_DIST_TO_COVER = 50;
force force asr_ai3_danger_NO_COVER_FOR_DANGER_WITHIN = 50;
force force asr_ai3_danger_radiorange = 0;
force force asr_ai3_danger_rrdelaymin = 5;
force force asr_ai3_danger_rrdelayplus = 10;
force force asr_ai3_danger_seekcover = true;
force force asr_ai3_danger_usebuildings = 0.8;
force force asr_ai3_hitreactions_fallDown = true;
force force asr_ai3_hitreactions_STAY_IN_VEH = true;
force force asr_ai3_incognito_incodbg = false;
force force asr_ai3_incognito_incodiff = 0;
force force asr_ai3_incognito_incohint = false;
force force asr_ai3_main_factionskip_str = "['LOP_AFR_Civ','LOP_CHR_Civ','LOP_TAK_Civ']";
force force asr_ai3_rearming_debug_rearm = false;
force force asr_ai3_rearming_rearm = 40;
force force asr_ai3_rearming_rearm_fak = 1;
force force asr_ai3_rearming_rearm_mags = 3;
force force asr_ai3_skills_debug_setcamo = false;
force force asr_ai3_skills_debug_setskill = false;
force force asr_ai3_skills_packNVG = true;
force force asr_ai3_skills_setskills = true;
force force asr_ai3_skills_teamsuperai = true;
