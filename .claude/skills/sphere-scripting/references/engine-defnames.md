# Motorun gömülü defname'leri
<!-- Üretildi: SphereServer-56TX/utilities/scripting-skill.ps1. Elle değiştirilmez; motor değişince yeniden üretilir. -->

Pakette tanımlı olmasa da motorun tanımladığı adlar (`src/scripts/defs_engine.scp`, exe'ye gömülü; CLAUDE.md Bölüm 4, eksik gömülü defname'ler). Paketin kendi `[DEFNAME]`'i aynı adı tanımlarsa paketinki geçerli. Script'te doğrudan ad olarak (`FLAGS=attr_newbie|attr_move_never`, `IF (<FLAGS> & statf_dead)`) ya da `<DEF.ad>` ile kullanılır. Bölüm adı anlamını söyler.

## İçindekiler

- HARDCODED (8)
- trigger_argtype (3)
- misc_clilocs (2)
- region_flags (22)
- spell_flags (33)
- mem_flags (14)
- stat_flags (31)
- speedmode_defs (5)
- attr_flags (33)
- can_m_flags (21)
- sector_flags (2)
- alignments (13)
- layers (82)
- def_gumps (4)
- dam_flags (18)
- can_i_flags (30)
- tile_flags (32)
- profession_ids (8)
- resdisp_version (10)
- talkmode_type (11)
- skill_flags (12)
- skill_titles (10)
- los_flags (13)
- ref_types (19)
- death_flags (5)
- noto_types (7)
- canuse_flags (7)
- can_o_flags (1)
- swing_types (3)
- theme_packs (2)
- mapwaypoint_types (10)
- house_types (3)
- house_transfer_types (5)
- serv_resource_types (60)
- serv_log_utility (33)
- autoprivflags (11)
- combatflags (17)
- parryflags (6)
- magicflags (16)
- racialflags (11)
- revealflags (10)
- emoteflags (3)
- npcaiflags (10)
- statsflags (4)
- advancedlosflags (3)
- petsnotorietyflags (7)
- experimentalflags (14)
- optionflags (26)
- areaflags (3)
- featureflags (22)
- debugflags (9)
- experiencemodes (5)
- CompPropsIDs (6)
- passive_buff_icons (7)
- debuff_icons (67)
- buff_icons (112)
- buff_clilocs (81)
- npc_faction_groups (8)
- npc_factions (36)
- staffrobe_colors (8)
- ticket_defs (15)
- discord_defs (8)
- report_defs (34)
- travel_flags (28)
- hitzones (9)
- placement (26)

## HARDCODED

```
defaultitem i_gold
defaultchar c_man
defaultseed i_gold
defaultmsg i_gold
guards { c_guard 1 c_guard_f 1 }
deffood { i_fruit_grapes 1 i_ham 1 i_cheese_cut 1 i_muffin 1 i_fish_cut_cooked 1 i_ribs_cooked 1 i_bird_cooked 1 i_sausages 1 i_fruit_apple 1 i_fruit_peach 1 }
guardcall GUARD,GUARDS
link_invalid 04fffffff
```

## trigger_argtype

```
TAT_AS_ARGN 1
TAT_AS_ARGS 2
TAT_AS_ARGO 3
```

## misc_clilocs

```
empty_cliloc 1042971
empty_cliloc2 1070722
```

## region_flags

```
region_antimagic_all 0000001
region_antimagic_recall_in 0000002
region_antimagic_recall_out 0000004
region_antimagic_gate 0000008
region_antimagic_teleport 0000010
region_antimagic_damage 0000020
region_flag_ship 0000040
region_flag_nobuilding 0000080
region_flag_house 0000100
region_flag_announce 0000200
region_flag_insta_logout 0000400
region_flag_underground 0000800
region_flag_nodecay 0001000
region_flag_safe 0002000
region_flag_guarded 0004000
region_flag_no_pvp 0008000
region_flag_arena 0010000
region_flag_nomining 0020000
region_flag_walk_noblockheight 0040000
region_flag_inherit_parent_events 0100000
region_flag_inherit_parent_flags 0200000
region_flag_inherit_parent_tags 0400000
```

## spell_flags

```
spellflag_dir_anim 00000001
spellflag_targ_item 00000002
spellflag_targ_char 00000004
spellflag_targ_obj 00000006
spellflag_targ_xyz 00000008
spellflag_harm 00000010
spellflag_fx_bolt 00000020
spellflag_fx_targ 00000040
spellflag_field 00000080
spellflag_summon 00000100
spellflag_good 00000200
spellflag_resist 00000400
spellflag_targ_noself 00000800
spellflag_freezeoncast 00001000
spellflag_field_randomdecay 00002000
spellflag_no_elementalengine 00004000
spellflag_disabled 00008000
spellflag_scripted 00010000
spellflag_playeronly 00020000
spellflag_nounparalyze 00040000
spellflag_no_castanim 00080000
spellflag_targ_no_player 00100000
spellflag_targ_no_npc 00200000
spellflag_noprecast 00400000
spellflag_nofreezeoncast 00800000
spellflag_area 01000000
spellflag_poly 02000000
spellflag_targ_dead 04000000
spellflag_damage 08000000
spellflag_bless 010000000
spellflag_curse 020000000
spellflag_heal 040000000
spellflag_tick 080000000
```

## mem_flags

```
memory_sawcrime 00001
memory_ipet 00002
memory_fight 00004
memory_iaggressor 00008
memory_harmedby 00010
memory_irritatedby 00020
memory_speak 00040
memory_aggreived 00080
memory_guard 00100
memory_ispawned 00200
memory_guild 00400
memory_town 00800
memory_family 01000
memory_friend 04000
```

## stat_flags

```
statf_invul 000000001
statf_dead 000000002
statf_freeze 000000004
statf_invisible 000000008
statf_sleeping 000000010
statf_war 000000020
statf_reactive 000000040
statf_poisoned 000000080
statf_nightsight 000000100
statf_reflection 000000200
statf_polymorph 000000400
statf_incognito 000000800
statf_spiritspeak 000001000
statf_insubstantial 000002000
statf_emoteaction 000004000
statf_commcrystal 000008000
statf_hasshield 000010000
statf_archercanmove 000020000
statf_stone 000040000
statf_hovering 000080000
statf_fly 000100000
statf_hallucinating 000400000
statf_hidden 000800000
statf_indoors 001000000
statf_criminal 002000000
statf_conjured 004000000
statf_pet 008000000
statf_spawned 010000000
statf_saveparity 020000000
statf_ridden 040000000
statf_onhorse 080000000
```

## speedmode_defs

```
speedmode_normal 0
speedmode_double 1
speedmode_always_walk 2
speedmode_mixed 3
speedmode_still 4
```

## attr_flags

```
attr_identified 000000001
attr_decay 000000002
attr_newbie 000000004
attr_move_always 000000008
attr_move_never 000000010
attr_magic 000000020
attr_owned 000000040
attr_invis 000000080
attr_cursed 000000100
attr_cursed2 000000200
attr_blessed 000000400
attr_blessed2 000000800
attr_forsale 000001000
attr_stolen 000002000
attr_can_decay 000004000
attr_static 000008000
attr_exceptional 000010000
attr_enchanted 000020000
attr_imbued 000040000
attr_questitem 000080000
attr_insured 000100000
attr_nodrop 000200000
attr_notrade 000400000
attr_artifact 000800000
attr_lockeddown 001000000
attr_secure 002000000
attr_reforged 004000000
attr_opened 008000000
attr_shardbound 010000000
attr_accountbound 020000000
attr_characterbound 040000000
attr_canuse_paralyzed 080000000
attr_cannotrepair 0400000000000
```

## can_m_flags

```
mt_male 000000
mt_ghost 000001
mt_swim 000002
mt_walk 000004
mt_passwalls 000008
mt_fly 000010
mt_fire_immune 000020
mt_noindoors 000040
mt_hover 000080
mt_equip 000100
mt_usehands 000200
mt_mount 000400
mt_female 000800
mt_nonhum 001000
mt_run 002000
mt_nodclicklos 004000
mt_nodclickdist 008000
mt_nonmover 010000
mt_noblockheight 020000
mt_statue 040000
mt_nonselectable 080000
```

## sector_flags

```
secf_nosleep 01
secf_instasleep 02
```

## alignments

```
evil {-10000 -6001}
chaotic {-6000 -2001}
good {2000 10000}
wicked {-10000 -6001}
belligerent {-6000 -2001}
neutral {-2000 1999}
kindly {2000 5999}
goodhearted {6000 10000}
infamous {-10000 -6001}
outlaw {-6000 -2001}
anonymous {-2000 1999}
known {2000 5999}
famous {6000 10000}
```

## layers

```
layer_hand1 1
layer_hand2 2
layer_shoes 3
layer_pants 4
layer_shirt 5
layer_helm 6
layer_gloves 7
layer_ring 8
layer_talisman 9
layer_collar 10
layer_hair 11
layer_half_apron 12
layer_chest 13
layer_wrist 14
layer_face 15
layer_beard 16
layer_tunic 17
layer_ears 18
layer_arms 19
layer_cape 20
layer_pack 21
layer_robe 22
layer_skirt 23
layer_legs 24
layer_horse 25
layer_vendor_stock 26
layer_vendor_extra 27
layer_vendor_buys 28
layer_bankbox 29
layer_special 30
layer_dragging 31
layer_spell_stats 32
layer_spell_reactive 33
layer_spell_night_sight 34
layer_spell_protection 35
layer_spell_incognito 36
layer_spell_magic_reflect 37
layer_spell_paralyze 38
layer_spell_invis 39
layer_spell_polymorph 40
layer_spell_summon 41
layer_flag_poison 42
layer_flag_criminal 43
layer_flag_potion 44
layer_flag_spiritspeak 45
layer_flag_wool 46
layer_flag_drunk 47
layer_flag_clientlinger 48
layer_flag_hallucination 49
layer_flag_potionused 50
layer_flag_stuck 51
layer_flag_murders 52
layer_flag_bandage 53
layer_auction 54
LAYER_SPELL_Blood_Oath 55
LAYER_SPELL_Curse_Weapon 56
LAYER_SPELL_Corpse_Skin 57
LAYER_SPELL_Evil_Omen 58
LAYER_SPELL_Pain_Spike 59
LAYER_SPELL_Mind_Rot 60
LAYER_SPELL_Strangle 61
LAYER_SPELL_Consecrate_Weapon 62
LAYER_SPELL_Divine_Fury 63
LAYER_SPELL_Enemy_Of_One 64
LAYER_SPELL_Attunement 65
LAYER_SPELL_Gift_Of_Renewal 66
LAYER_SPELL_Immolating_Weapon 67
LAYER_SPELL_Thunderstorm 68
LAYER_SPELL_Arcane_Empowerment 69
LAYER_SPELL_Ethereal_Voyage 70
LAYER_SPELL_Gift_Of_Life 71
LAYER_SPELL_Dryad_Allure 72
LAYER_SPELL_Essence_Of_Wind 73
LAYER_SPELL_Enchant 74
LAYER_SPELL_Sleep 75
LAYER_SPELL_Bombard 76
LAYER_SPELL_Spell_Plague 77
LAYER_SPELL_Nether_Cyclone 78
LAYER_SPELL_Mana_Drain 79
LAYER_SPELL_Explosion 80
LAYER_STORAGE 81
LAYER_STABLE 82
```

## def_gumps

```
g_btn_green_ok 081a
g_btn_green_ok_press 081b
g_btn_gray_apply 5204
g_btn_gray_apply_press 5205
```

## dam_flags

```
dam_god 00001
dam_physical 00002
dam_magic 00004
dam_poison 00008
dam_fire 00010
dam_energy 00020
dam_general 00080
dam_acidic 00100
dam_cold 00200
dam_slash 00400
dam_pierce 00800
dam_nodisturb 02000
dam_noreveal 04000
dam_nounparalyze 08000
dam_fixed 010000
dam_breath 020000
dam_thrown 040000
dam_reactive 080000
```

## can_i_flags

```
can_i_door 000001
can_i_water 000002
can_i_platform 000004
can_i_block 000008
can_i_climb 000010
can_i_fire 000020
can_i_roof 000040
can_i_hover 000080
can_i_pile 000100
can_i_dye 000200
can_i_flip 000400
can_i_light 000800
can_i_repair 001000
can_i_replicate 002000
can_i_dcignorelos 004000
can_i_dcignoredist 008000
can_i_blocklos 010000
can_i_exceptional 020000
can_i_makersmark 040000
can_i_retaincolor 080000
can_i_enchant 0100000
can_i_imbue 0200000
can_i_recycle 0400000
can_i_reforge 0800000
can_i_forcedc 01000000
can_i_damageable 02000000
can_i_blocklos_height 04000000
can_i_equiponcast 08000000
can_i_scriptedmore 020000000
can_i_timer_contained 040000000
```

## tile_flags

```
tilef_background 000000001
tilef_weapon 000000002
tilef_transparent 000000004
tilef_translucent 000000008
tilef_wall 000000010
tilef_damaging 000000020
tilef_impassable 000000040
tilef_wet 000000080
tilef_unknown 000000100
tilef_surface 000000200
tilef_bridge 000000400
tilef_stackable 000000800
tilef_window 000001000
tilef_noshoot 000002000
tilef_prefixA 000004000
tilef_prefixAn 000008000
tilef_internal 000010000
tilef_foliage 000020000
tilef_partialHue 000040000
tilef_unknown_1 000080000
tilef_map 000100000
tilef_container 000200000
tilef_wearable 000400000
tilef_lightSource 000800000
tilef_animated 001000000
tilef_hoverover 002000000
tilef_unknown_2 004000000
tilef_armor 008000000
tilef_roof 010000000
tilef_door 020000000
tilef_stairBack 040000000
tilef_stairRight 080000000
```

## profession_ids

```
prof_unknown 0
prof_warrior 1
prof_magician 2
prof_blacksmith 3
prof_necromancer 4
prof_paladin 5
prof_samurai 6
prof_ninja 7
```

## resdisp_version

```
RDS_PRET2A 0
RDS_T2A 1
RDS_LBR 2
RDS_AOS 3
RDS_SE 4
RDS_ML 5
RDS_KR 6
RDS_SA 7
RDS_HS 8
RDS_TOL 9
```

## talkmode_type

```
talkmode_say 0
talkmode_system 1
talkmode_emote 2
talkmode_item 6
talkmode_noscroll 7
talkmode_whisper 8
talkmode_yell 9
talkmode_spell 10
talkmode_guild 13
talkmode_alliance 14
talkmode_command 15
```

## skill_flags

```
SKF_SCRIPTED 0001
SKF_FIGHT 0002
SKF_MAGIC 0004
SKF_CRAFT 0008
SKF_IMMOBILE 0010
SKF_SELECTABLE 0020
SKF_NOMINDIST 0040
SKF_NOANIM 0080
SKF_NOSFX 0100
SKF_RANGED 0200
SKF_GATHER 0400
SKF_DISABLED 0800
```

## skill_titles

```
SKILLTITLE_NEOPHYTE 300
SKILLTITLE_NOVICE 400
SKILLTITLE_APPRENTICE 500
SKILLTITLE_JOURNEYMAN 600
SKILLTITLE_EXPERT 700
SKILLTITLE_ADEPT 800
SKILLTITLE_MASTER 900
SKILLTITLE_GRANDMASTER 1000
SKILLTITLE_ELDER 1100
SKILLTITLE_LEGENDARY 1200
```

## los_flags

```
los_nb_local_terrain 00001
los_nb_local_static 00002
los_nb_local_dynamic 00004
los_nb_local_multi 00008
los_nb_terrain 00010
los_nb_static 00020
los_nb_dynamic 00040
los_nb_multi 00080
los_nb_windows 00100
los_no_other_region 00200
los_nc_multi 00400
los_fishing 00800
los_nc_water 01000
```

## ref_types

```
tref_serv 000001
tref_file 000002
tref_newfile 000004
tref_db 000008
tref_resdef 000010
tref_resbase 000020
tref_functionargs 000040
tref_fileobj 000080
tref_fileobjcont 000100
tref_account 000200
tref_stonemember 000800
tref_serverdef 001000
tref_sector 002000
tref_world 004000
tref_gmpage 008000
tref_client 010000
tref_object 020000
tref_char 040000
tref_item 080000
```

## death_flags

```
death_nofamechange 001
death_nocorpse 002
death_nolootdrop 004
death_noconjuredeffect 008
death_hascorpse 010
```

## noto_types

```
noto_good 1
noto_guild_same 2
noto_neutral 3
noto_criminal 4
noto_guild_war 5
noto_evil 6
noto_invul 7
```

## canuse_flags

```
can_u_all 0
can_u_male 01
can_u_female 02
can_u_human 04
can_u_elf 08
can_u_gargoyle 010
can_u_none 020
```

## can_o_flags

```
can_o_nosleep 010000000
```

## swing_types

```
swing_equipping 0
swing_ready 1
swing_swinging 2
```

## theme_packs

```
theme_gothic 1
theme_rustic 2
```

## mapwaypoint_types

```
mapwaypoint_remove 0
mapwaypoint_corpse 1
mapwaypoint_partymember 2
mapwaypoint_questgiver 4
mapwaypoint_newplayerquest 5
mapwaypoint_healer 6
mapwaypoint_shrine 11
mapwaypoint_moongate 12
mapwaypoint_greendot 14
mapwaypoint_greendot_flashing 15
```

## house_types

```
house_private 0
house_public 1
house_guild 2
```

## house_transfer_types

```
transfer_nothing = 0
transfer_lockdowns = 01
transfer_addon = 02
transfer_all = 04
transfer_secured = 08
```

## serv_resource_types

```
RES_ACCOUNT = 1
RES_ADVANCE = 2
RES_AREA = 3
RES_BLOCKIP = 4
RES_BOOK = 5
RES_CHAMPION = 6
RES_CHARDEF = 7
RES_COMMENT = 8
RES_DEFNAME = 9
RES_DIALOG = 10
RES_EVENTS = 11
RES_FAME = 12
RES_FUNCTION = 13
RES_GMPAGE = 14
RES_ITEMDEF = 15
RES_KARMA = 16
RES_KRDIALOGLIST = 17
RES_MENU = 18
RES_MOONGATES = 19
RES_NAMES = 20
RES_NEWBIE = 21
RES_NOTOTITLES = 22
RES_OBSCENE = 23
RES_PLEVEL = 24
RES_REGIONRESOURCE = 25
RES_REGIONTYPE = 26
RES_RESDEFNAME = 27
RES_RESOURCELIST = 28
RES_RESOURCES = 29
RES_ROOM = 30
RES_RUNES = 31
RES_SCROLL = 32
RES_SECTOR = 33
RES_SERVERS = 34
RES_SKILL = 35
RES_SKILLCLASS = 36
RES_SKILLMENU = 37
RES_SPAWN = 38
RES_SPEECH = 39
RES_SPELL = 40
RES_SPHERE = 41
RES_SPHERECRYPT = 42
RES_STARTS = 43
RES_STAT = 44
RES_TELEPORTERS = 45
RES_TEMPLATE = 46
RES_TIMERF = 47
RES_TIP = 48
RES_TYPEDEF = 49
RES_TYPEDEFS = 50
RES_WC = 51
RES_WEBPAGE = 52
RES_WI = 53
RES_WORLDCHAR = 54
RES_WORLDITEM = 55
RES_WORLDLISTS = 56
RES_WORLDSCRIPT = 57
RES_WORLDVARS = 58
RES_WS = 59
RESTYPE_BIT_SHIFT = 20
```

## serv_log_utility

```
CTCOL_DEFAULT = 0
CTCOL_RED = 1
CTCOL_GREEN = 2
CTCOL_YELLOW = 3
CTCOL_BLUE = 4
CTCOL_MAGENTA = 5
CTCOL_CYAN = 6
CTCOL_WHITE = 7
CTCOL_ORANGE = 8
LOGL_FATAL = 01
LOGL_CRIT = 02
LOGL_ERROR = 03
LOGL_WARN = 04
LOGL_EVENT = 05
LOGL_INFO = 06
LOGL_SUCCESS = 07
LOGL_QTY = 0F
LOGF_CONSOLE_ONLY = 010
LOGF_LOGFILE_ONLY = 020
LOGF_QTY = 0F0
LOGM_ACCOUNTS = 000100
LOGM_INIT = 000200
LOGM_SAVE = 000400
LOGM_CLIENTS_LOG = 000800
LOGM_GM_PAGE = 001000
LOGM_PLAYER_SPEAK = 002000
LOGM_GM_CMDS = 004000
LOGM_CHEAT = 008000
LOGM_KILLS = 010000
LOGM_HTTP = 020000
LOGM_NOCONTEXT = 040000
LOGM_DEBUG = 080000
LOGM_QTY = 0FFF00
```

## autoprivflags

```
priv_gm 00002
priv_gm_page 00008
priv_hearall 00010
priv_allmove 00020
priv_detail 00040
priv_debug 00080
pviv_priv_noshow 00200
priv_telnet_short 00400
priv_jailed 00800
priv_blocked 02000
priv_allshow 04000
```

## combatflags

```
combat_nodirchange 000001
combat_facecombat 000002
combat_prehit 000004
combat_elemental_engine 000008
combat_dclickself_unmounts 000020
combat_allowhitfromship 000040
combat_nopetdesert 000080
combat_archerycanmove 000100
combat_stayinrange 000200
combat_stackarmor 001000
combat_nopoisonhit 002000
combat_slayer 004000
combat_swing_norange 008000
combat_anim_hit_smooth 010000
combat_firsthit_instant 020000
combat_npc_bonusdamage 040000
combat_paralyze_canswing 080000
```

## parryflags

```
parryera_preseformula 001
parryera_seformula 002
parryera_shieldblock 010
parryera_onehandblock 020
parryera_twohandblock 040
parryera_arscaling 080
```

## magicflags

```
magicf_nodirchange 00001
magicf_precast 00002
magicf_ignorear 00004
magicf_canharmself 00008
magicf_stackstats 00010
magicf_freezeoncast 00020
magicf_summonwalkcheck 00040
magicf_nofieldsoverwalls 00080
magicf_noanim 00100
magicf_osiformulas 00200
magicf_nocastfrozenhands 00400
magicf_polymorphstats 00800
magicf_overridefields 01000
magicf_castparalyzed 02000
magicf_noreflectown 04000
magicf_delreflectown 08000
```

## racialflags

```
racialf_human_strongback 0001
racialf_human_tough 0002
racialf_human_workhorse 0004
racialf_human_jackoftrades 0008
racialf_elf_nightsight 0010
racialf_elf_difftrack 0020
racialf_elf_wisdom 0040
racialf_garg_fly 0080
racialf_garg_berserk 0100
racialf_garg_deadlyaim 0200
racialf_garg_mysticinsight 0400
```

## revealflags

```
revealf_detectinghidden 0001
revealf_lootingself 0002
revealf_lootingothers 0004
revealf_speak 0008
revealf_spellcast 0010
revealf_osilikepersonalspace 0020
revealf_snooping 0040
revealf_stealing 0080
revealf_stealing_success 0100
revealf_stealing_fail 0200
```

## emoteflags

```
emotef_attacker 01
emotef_poison 02
emotef_destroy 04
```

## npcaiflags

```
npc_ai_path 0001
npc_ai_food 0002
npc_ai_extra 0004
npc_ai_alwaysint 0008
npc_ai_intfood 0010
npc_ai_combat 0040
npc_ai_looting 0100
npc_ai_moveobstacles 0200
npc_ai_persistentpath 0400
npc_ai_threat 0800
```

## statsflags

```
stat_flag_normal 00
stat_flag_denymax 01
stat_flag_denymaxp 02
stat_flag_denymaxn 04
```

## advancedlosflags

```
advancedlos_disabled 00
advancedlos_player 01
advancedlos_npc 02
```

## petsnotorietyflags

```
pet_noto_good 001
pet_noto_guildsame 002
pet_noto_neutral 004
pet_noto_criminal 008
pet_noto_guildwar 010
pet_noto_evil 020
pet_noto_invul 040
```

## experimentalflags

```
ef_nodiagonalchecklos 000001
ef_dynamicbackgroundsave 000002
ef_itemstacking 000004
ef_itemstackdrop 000008
ef_fastwalkprevention 000010
ef_intrinsic_locals 000020
ef_item_strict_comparison 000040
ef_followerlist 000080
ef_allowtelnetpacketfilter 000200
ef_script_profiler 000400
ef_damagetools 002000
ef_usepingserver 008000
ef_fixcanseeinclosedconts 020000
ef_walkcheckheightmounted 040000
```

## optionflags

```
of_nodclicktarget 00000001
of_nosmoothsailing 00000002
of_scaledamagebydurability 00000004
of_command_sysmsgs 00000008
of_petslot 00000010
of_osimultisight 00000020
of_items_autoname 00000040
of_filecommands 00000080
of_noitemnaming 00000100
of_nohousemutespeech 00000200
of_nocontextmenulos 00000400
of_mapboundarysailing 00000800
of_flood_protection 00001000
of_buffs 00002000
of_noprefix 00004000
of_dyetype 00008000
of_drinkisfood 00010000
of_nodclickturn 00020000
of_nopaperdolltradetitle 00040000
of_notargturn 00080000
of_statallowvalovermax 00100000
of_guardoutsideguardedarea 00200000
of_ownodropcarrieditem 00400000
of_allowcontainerinsidecontainer 00800000
of_ventorstocklimit 01000000
of_enableguildalignnotoriety 02000000
```

## areaflags

```
areaf_roominheritsevents 01
areaf_roominheritsflags 02
areaf_roominheritstags 04
```

## featureflags

```
feature_t2a_update 001
feature_t2a_chat 002
feature_lbr_update 001
feature_lbr_sound 002
feature_aos_update_a 001
feature_aos_update_b 002
feature_aos_popup 004
feature_aos_damage 008
feature_se_update 001
feature_se_ninjasam 002
feature_ml_update 001
feature_kr_update 001
feature_sa_update 001
feature_sa_movement 002
feature_tol_update 001
feature_tol_virtualgold 002
feature_extra_crystal 001
feature_extra_gothic 002
feature_extra_rustic 004
feature_extra_jungle 008
feature_extra_shadowguard 010
feature_extra_roleplayfaces 020
```

## debugflags

```
debugf_npc_emote 00001
debugf_advance_stats 00002
debugf_exp 00200
debugf_level 00400
debugf_scripts 00800
debugf_los 01000
debugf_walk 02000
debugf_packets 04000
debugf_network 08000
```

## experiencemodes

```
exp_mode_raise_combat 001
exp_mode_raise_craft 002
exp_mode_allow_down 004
exp_mode_down_nolevel 008
exp_mode_autoset_exp 010
```

## CompPropsIDs

```
CompProps_ItemChar 0
CompProps_Char 1
CompProps_Item 2
CompProps_ItemEquippable 3
CompProps_ItemWeapon 4
CompProps_ItemWeaponRanged 5
```

## passive_buff_icons

```
passivebufficon_Hidden 1012
passivebufficon_ActiveMeditation 1013
passivebufficon_Incognito 1032
passivebufficon_Disguised 1033
passivebufficon_Polymorph 1035
passivebufficon_GargoyleFly 1054
passivebufficon_Despair 1060
```

## debuff_icons

```
debufficon_NoRemount 1001
debufficon_DeathStrike 1006
debufficon_EvilOmen 1007
debufficon_HealingThrottle 1008
debufficon_StaminaThrottle 1009
debufficon_BloodOathCurse 1015
debufficon_CorpseSkin 1016
debufficon_MindRot 1017
debufficon_PainSpike 1018
debufficon_Strangle 1019
debufficon_ThunderStorm 1022
debufficon_EssenceOfWind 1023
debufficon_MortalStrike 1027
debufficon_Paralyze 1037
debufficon_Poison 1038
debufficon_Bleed 1039
debufficon_Clumsy 1040
debufficon_Feeblemind 1041
debufficon_Weaken 1042
debufficon_Curse 1043
debufficon_MassCurse 1044
debufficon_Sleep 1049
debufficon_SpellPlague 1051
debufficon_Tribulation 1059
debufficon_HitLowerAttack 1063
debufficon_HitLowerDefense 1064
debufficon_SpellFocusing 1071
debufficon_RageFocusing 1072
debufficon_ForceArrow 1076
debufficon_Disarm 1077
debufficon_TalonStrike 1080
debufficon_PhysicAttack 1081
debufficon_EnemyOfOne 1084
debufficon_FandancerFanFire 1105
debufficon_Rage 1106
debufficon_Webbing 1107
debufficon_MedusaStone 1108
debufficon_DragonSlasherFear 1109
debufficon_AuraOfNausea 1110
debufficon_HowlOfCacophony 1111
debufficon_GazeDespair 1112
debufficon_HiryuPhysicalResistance 1113
debufficon_RuneBeetleCorruption 1114
debufficon_BloodWormAnemia 1115
debufficon_RotwormBloodDisease 1116
debufficon_SkillUseDelay 1117
debufficon_FactionStatLoss 1118
debufficon_HeatOfBattle 1119
debufficon_CriminalStatus 1120
debufficon_ArmorPierce 1121
debufficon_SplinteringEffect 1122
debufficon_SwingSpeed 1123
debufficon_Humility 1127
debufficon_Stagger 1131
debufficon_Pierce 1134
debufficon_Onslaught 1137
debufficon_ElementalFury 1139
debufficon_DeathRay 1155
debufficon_InjectedStrike 1161
debufficon_PlayingTheOdds 1164
debufficon_DragonTurtle 1165
debufficon_Thrust 1168
debufficon_Sparks 1176
debufficon_Swarm 1177
debufficon_BoneBreaker 1178
debufficon_Feint 1185
debufficon_Discord 1189
```

## buff_icons

```
bufficon_NoRearm 1002
bufficon_NightSight 1005
bufficon_DivineFury 1010
bufficon_EnemyOfOne 1011
bufficon_BloodOathCaster 1014
bufficon_GiftOfRenewal 1020
bufficon_AttuneWeapon 1021
bufficon_EtherealVoyage 1024
bufficon_GiftOfLife 1025
bufficon_ArcaneEmpowerment 1026
bufficon_ReactiveArmor 1028
bufficon_Protection 1029
bufficon_ArchProtection 1030
bufficon_MagicReflection 1031
bufficon_AnimalForm 1034
bufficon_Invisibility 1036
bufficon_Agility 1045
bufficon_Cunning 1046
bufficon_Strength 1047
bufficon_Bless 1048
bufficon_StoneForm 1050
bufficon_GargoyleBerserk 1052
bufficon_Inspire 1055
bufficon_Invigorate 1056
bufficon_Resilience 1057
bufficon_Perseverance 1058
bufficon_FishPie 1062
bufficon_HitDualWield 1065
bufficon_Block 1066
bufficon_DefenseMastery 1067
bufficon_Despair 1068
bufficon_HealingEffect 1069
bufficon_SpellFocusing 1070
bufficon_RageFocusing 1073
bufficon_Warding 1074
bufficon_Yribulation 1075
bufficon_Surge 1078
bufficon_Feint 1079
bufficon_Consecrate 1082
bufficon_GrapesOfWrath 1083
bufficon_HorrificBeast 1085
bufficon_LichForm 1086
bufficon_VampiricEmbrace 1087
bufficon_CurseWeapon 1088
bufficon_ReaperForm 1089
bufficon_InmolatingWeapon 1090
bufficon_Enchant 1091
bufficon_HonorableExecution 1092
bufficon_Confidence 1093
bufficon_Evasion 1094
bufficon_CounterAttack 1095
bufficon_LightningStrike 1096
bufficon_MomentumStrike 1097
bufficon_OrangePetals 1098
bufficon_RoseOfTrinsic 1099
bufficon_PoisonImmunity 1100
bufficon_Veterinary 1101
bufficon_Perfection 1102
bufficon_Honored 1103
bufficon_ManaPhase 1104
bufficon_WraithForm 1124
bufficon_CityTradeDeal 1126
bufficon_Spirituality 1128
bufficon_Humility 1129
bufficon_Rampage 1130
bufficon_Toughness 1132
bufficon_Thrust 1133
bufficon_PlayingTheOdds 1135
bufficon_FocusedEye 1136
bufficon_ElementalFury 1138
bufficon_CalledShot 1140
bufficon_Knockout 1141
bufficon_WarriorsGifts 1142
bufficon_Conduit 1143
bufficon_EtherealBurst 1144
bufficon_MysticWeapon 1145
bufficon_ManaShield 1146
bufficon_AnticipateHit 1147
bufficon_Warcry 1148
bufficon_Shadow 1149
bufficon_WhiteTigerForm 1150
bufficon_Bodyguard 1151
bufficon_HeightenedSenses 1152
bufficon_Tolerance 1153
bufficon_DeathRay 1154
bufficon_Intuition 1156
bufficon_EnchantedSummoning 1157
bufficon_ShieldBash 1158
bufficon_Whispering 1159
bufficon_CombatTraining 1160
bufficon_InjectedStrike 1162
bufficon_UnknownTomato 1163
bufficon_Boarding 1166
bufficon_Potency 1167
bufficon_FistsOfFury 1169
bufficon_BarrabHemolymphConcentrate 1170
bufficon_JukariBurnPoultice 1171
bufficon_KurakAmbushersEssence 1172
bufficon_BarakoDraftOfMight 1173
bufficon_UraliTranceTonic 1174
bufficon_SakkhraProphylaxis 1175
bufficon_Sparks 1179
bufficon_Swarm 1180
bufficon_BoneBreaker 1181
bufficon_goblin 1182
bufficon_cora 1183
bufficon_virtue_shield 1184
bufficon_caddelliteinfused 1186
bufficon_potionofgloriousfortune 1187
bufficon_mondo 1188
bufficon_chaliceofpilferingprotection 1190
bufficon_battlelust 1191
```

## buff_clilocs

```
buffcliloc_Empty 1070722
buffcliloc_NoRemount_1 1075635
buffcliloc_NoRemount_2 1075636
buffcliloc_ActiveMeditation_1 1075657
buffcliloc_ActiveMeditation_2 1075658
buffcliloc_Curse_1 1075835
buffcliloc_Curse_2 1075836
buffcliloc_Weaken_1 1075837
buffcliloc_Weaken_2 1075838
buffcliloc_MassCurse_1 1075839
buffcliloc_MassCurse_2 1075840
buffcliloc_Agility_1 1075841
buffcliloc_Agility_2 1075842
buffcliloc_Cunning_1 1075843
buffcliloc_Cunning_2 1075844
buffcliloc_Strength_1 1075845
buffcliloc_Strength_2 1075846
buffcliloc_Bless_1 1075847
buffcliloc_Bless_2 1075848
buffcliloc_ReactiveArmor_1 1075812
buffcliloc_ReactiveArmor_2 1075813
buffcliloc_Protection_1 1075814
buffcliloc_Protection_2 1075815
buffcliloc_ArchProtection_1 1075816
buffcliloc_ArchProtection_2 1075815
buffcliloc_Invisibility_1 1075825
buffcliloc_Invisibility_2 1075826
buffcliloc_Paralyze_1 1075827
buffcliloc_Paralyze_2 1075828
buffcliloc_MagicReflection_1 1075817
buffcliloc_MagicReflection_2 1075818
buffcliloc_Clumsy_1 1075831
buffcliloc_Clumsy_2 1075832
buffcliloc_Feeblemind_1 1075833
buffcliloc_Feeblemind_2 1075834
buffcliloc_Incognito_1 1075819
buffcliloc_Incognito_2 1075820
buffcliloc_Polymorph_1 1075824
buffcliloc_Polymorph_2 1075823
buffcliloc_Poison_1 1017383
buffcliloc_Poison_2 1070722
buffcliloc_Nightsight_1 1075643
buffcliloc_Nightsight_2 1075644
buffcliloc_Hidden_1 1075655
buffcliloc_Hidden_2 1075656
buffcliloc_GargoyleFly_1 1112193
buffcliloc_GargoyleFly_2 1112567
buffcliloc_GrapesOfWrath_1 1032247
buffcliloc_GrapesOfWrath_2 1153762
buffcliloc_HorrificBeast_1 1060514
buffcliloc_HorrificBeast_2 1153763
buffcliloc_LichForm_1 1060515
buffcliloc_LichForm_2 1153767
buffcliloc_VampiricEmbrace_1 1060521
buffcliloc_VampiricEmbrace_2 1153768
buffcliloc_WraithForm_1 1060524
buffcliloc_WraithForm_2 1153829
buffcliloc_ReaperForm_1 1071034
buffcliloc_ReaperForm_2 1153781
buffcliloc_StoneForm_1 1080145
buffcliloc_StoneForm_2 1080146
buffcliloc_CriminalStatus_1 1153802
buffcliloc_CriminalStatus_2 1153828
buffcliloc_BarrabHemolymphConcentrate_1 1156724
buffcliloc_BarrabHemolymphConcentrate_2 1156738
buffcliloc_JukariBurnPoultice_1 1156726
buffcliloc_JukariBurnPoultice_2 1156739
buffcliloc_KurakAmbushersEssence_1 1156728
buffcliloc_KurakAmbushersEssence_2 1156740
buffcliloc_BarakoDraftOfMight_1 1156729
buffcliloc_BarakoDraftOfMight_2 1156741
buffcliloc_UraliTranceTonic_1 1156734
buffcliloc_UraliTranceTonic_2 1156742
buffcliloc_SakkhraProphylaxis_1 1156732
buffcliloc_SakkhraProphylaxis_2 1156743
buffcliloc_Sparks_1 1157330
buffcliloc_Sparks_2 1157329
buffcliloc_Swarm_1 1157328
buffcliloc_Swarm_2 1157327
buffcliloc_BoneBreaker_1 1157318
buffcliloc_BoneBreaker_2 1157319
```

## npc_faction_groups

```
npcgroup_none 0
npcgroup_fey 01
npcgroup_elemental 02
npcgroup_abyss 04
npcgroup_humanoid 08
npcgroup_undead 010
npcgroup_arachnid 020
npcgroup_reptilian 040
```

## npc_factions

```
faction_fey 01
faction_elemental 02
faction_air_elemental 04
faction_blood_elemental 08
faction_earth_elemental 010
faction_fire_elemental 020
faction_poison_elemental 040
faction_snow_elemental 080
faction_water_elemental 0100
faction_demon 0200
faction_gargoyle 0400
faction_repond 0800
faction_goblin 01000
faction_vermin 02000
faction_ogre 04000
faction_orc 08000
faction_troll 010000
faction_undead 020000
faction_mage 040000
faction_arachnid 080000
faction_scorpion 0100000
faction_spider 0200000
faction_terathan 0400000
faction_reptile 0800000
faction_dragon 01000000
faction_ophidian 02000000
faction_snake 04000000
faction_lizardman 08000000
faction_bat 010000000
faction_bear 020000000
faction_beetle 040000000
faction_bird 080000000
faction_bovine 0100000000
faction_flame 0200000000
faction_ice 0400000000
faction_wolf 0800000000
```

## staffrobe_colors

```
staffrobe_color_counsel 03
staffrobe_color_seer 03
staffrobe_color_gm 022
staffrobe_color_dev 022
staffrobe_color_admin 022
staffrobe_color_owner 022
staffrobe_color_founder 022
staffrobe_color_root 022
```

## ticket_defs

```
ticket_status_new 0
ticket_status_open 1
ticket_status_progress 2
ticket_status_closed 3
ticket_mask_new 01
ticket_mask_open 02
ticket_mask_progress 04
ticket_mask_closed 08
ticket_mask_active 07
ticket_mask_waiting 010
ticket_event_deleted 0
ticket_event_created 1
ticket_event_message 2
ticket_event_note 3
ticket_event_status 4
```

## discord_defs

```
discord_notify_startup 01
discord_notify_shutdown 02
discord_notify_restart 04
discord_notify_save 08
discord_notify_gmpage 010
discord_notify_ticket 020
discord_notify_report 040
discord_notify_account 080
```

## report_defs

```
report_status_new 0
report_status_open 1
report_status_investigating 2
report_status_resolved 3
report_status_rejected 4
report_mask_new 01
report_mask_open 02
report_mask_investigating 04
report_mask_resolved 08
report_mask_rejected 010
report_mask_active 07
report_mask_closed 018
report_mask_mine 020
report_mask_unassigned 040
report_mask_auto 080
report_mask_player 0100
report_target_none 0
report_target_player 1
report_target_npc 2
report_target_item 3
report_evidence_pending 0
report_evidence_frozen 1
report_evidence_unavailable 2
report_entry_note 0
report_entry_status 1
report_entry_assign 2
report_entry_sanction 3
report_entry_repeat 4
report_event_created 1
report_event_status 2
report_event_note 3
report_event_assigned 4
report_event_sanction 5
report_event_repeated 6
```

## travel_flags

```
travelf_frozen 01
travelf_jailed 02
travelf_src_safe 04
travelf_src_house 08
travelf_src_ship 010
travelf_src_water 020
travelf_src_gatearea 040
travelf_dst_same 0100
travelf_dst_blocker 0200
travelf_dst_enclosed 0400
travelf_dst_lava 0800
travelf_dst_water 01000
travelf_dst_safe 02000
travelf_dst_nopvp 04000
travelf_dst_house 08000
travelf_dst_ship 010000
travelf_dst_recallin 020000
travelf_dst_recallout 040000
travelf_dst_gatearea 080000
travelf_dst_antimagic 0100000
travelf_dst_void 0200000
travelf_telepad 0400000
travelf_onenter 01000000
travelf_script 080000000
travel_stage_caststart 0
travel_stage_castdone 1
travel_stage_gateenter 2
travel_stage_script 3
```

## hitzones

```
hitzone_none 0
hitzone_head 1
hitzone_neck 2
hitzone_back 3
hitzone_chest 4
hitzone_arms 5
hitzone_hands 6
hitzone_legs 7
hitzone_feet 8
```

## placement

```
placement_margin 0
placement_bump 4
placement_bump_mode 0
placement_bump_dist 0
placement_block_dist margin
placement_multi_dist 0
placement_multi_measure 1
placement_region_flags region_flag_nobuilding|region_flag_guarded|region_flag_safe|region_flag_underground
placement_region_dist 0
placement_road -1
placement_road_types t_road
placement_near ""
placement_water_dist -1
placement_terrain_deny ""
placement_terrain_allow ""
placement_maps ""
placement_chars_player 1
placement_chars_npc 1
placement_chars_pet 1
placement_chars_staff 2
placement_chars_self 0
placement_chars_dist 0
placement_eject_to 0
placement_gm 0
placement_ship_multi_dist -1
placement_ship_region_flags 0
```

