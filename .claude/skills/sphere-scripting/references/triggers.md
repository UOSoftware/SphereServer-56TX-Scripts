# Tetikleyiciler
<!-- Üretildi: SphereServer-56TX/utilities/scripting-skill.ps1. Elle değiştirilmez; motor değişince yeniden üretilir. -->

Motorun tanıdığı tetikleyiciler ve kaynağın yanlarına yazdığı açıklamalar (`sm_szTrigName` dizileri). Script'te `ON=@Ad` ile yazılır, büyük-küçük harf farksız. Argümanları (ARGN1-3, ARGO, ARGS, LOCAL.x) için motor kaynağında tetikleyicinin adıyla arama yapılır (`Grep "CTRIG_Ad\b" src/game`, `ITRIG_`, `RTRIG_`, `SPTRIG_`, `SKTRIG_`) ya da paketteki bir kullanımına bakılır. Sunucu olay fonksiyonları (f_on*) serv-functions.md'de.

## İçindekiler

- Karakter tetikleyicileri (CHARDEF, EVENTS, TEVENTS; oyuncu ve NPC)
- Eşya tetikleyicileri (ITEMDEF, TYPEDEF, TEVENTS)
- Bölge tetikleyicileri (AREADEF, ROOMDEF, REGIONTYPE; EVENTS ile)
- Büyü tetikleyicileri ([SPELL] bölümünde)
- Skill tetikleyicileri ([SKILL] bölümünde)
- Kaynak tetikleyicileri ([REGIONRESOURCE])
- Bonus tetikleyicileri ([BONUS], 0.56TX)
- Web sayfası tetikleyicileri ([WEBPAGE])

## Karakter tetikleyicileri (CHARDEF, EVENTS, TEVENTS; oyuncu ve NPC)

Eşya tetikleyicilerinin `@Item...` biçimi (ör. `@ItemDClick`, `@ItemEquip`) karakterde çalışır: eşyanın kendi tetikleyicisi `RETURN 1` dönmezse eşyadan sonra. `@Charxxx` biçimi (`@CharClick`...) başka bir karakter bu karaktere bir şey yaptığında o karakterde. Eşyanın kendi tetikleyicileri aşağıda.

- `@AddMulti`: Adding a multi to the MultiStorage,
- `@AfkMode`: Changing afk mode by using .AFK command.
- `@AfterClick`
- `@AfterEat`: 0.56TX: @Eat'ten sonra, stat'lar değişince.
- `@ArmorCalc`: 0.56TX: gösterilen AR hesaplandı.
- `@ArrowQuest_Add`
- `@ArrowQuest_Close`
- `@Attack`: I am attacking someone (SRC)
- `@Bonus`: 0.56TX: vuruşumda bir bonus denenecek (Bonuses)
- `@CallGuards`
- `@CarveCorpse`: 0.56TX: bir ceset kestim (0.56T)
- `@charAttack`: Here starts @charXXX section
- `@charClick`
- `@charClientTooltip`
- `@charClientTooltip_AfterDefault`
- `@charContextMenuRequest`
- `@charContextMenuSelect`
- `@charDClick`
- `@charShove`
- `@charTradeAccepted`
- `@Click`: I got clicked on by someone.
- `@ClientTooltip`: Sending tooltips to someone
- `@ClientTooltip_AfterDefault`
- `@CombatAdd`
- `@CombatDelete`
- `@CombatEnd`
- `@CombatStart`
- `@ContextMenuRequest`
- `@ContextMenuSelect`
- `@Create`: Newly created (not in the world yet)
- `@CreateLoot`
- `@Criminal`: Called before somebody becomes "gray" for someone
- `@DClick`: Someone has dclicked on me.
- `@Death`: +I just got killed.
- `@DeathCorpse`
- `@DelMulti`: Removing a multi to the MultiStorage,
- `@Destroy`: +I am nearly destroyed
- `@Dismount`: I am trying to get rid of my ride right now
- `@DismountAfter`: 0.56TX: attan indim
- `@Drink`: I am drinking something.
- `@Dye`: My color has been changed
- `@Eat`
- `@EnvironChange`: my environment changed somehow (light,weather,season,region)
- `@ExpChange`: EXP is going to change
- `@ExpLevelChange`: Experience LEVEL is going to change
- `@Falling`: char is falling from height >= 10
- `@FameChange`: Fame is changing
- `@FamilyJoin`: 0.56TX: aileye giriyorum (Family)
- `@FamilyLeave`: 0.56TX: aileden çıktım (Family)
- `@FollowersUpdate`
- `@GetHit`: I just got hit.
- `@Hit`: I just hit someone. (TARG)
- `@HitCheck`: Checking if I can hit my target, overriding also default checks if set to.
- `@HitIgnore`: I'm going to avoid a target (attacker.n.ignore=1) , should I un-ignore him?.
- `@HitMiss`: I just missed.
- `@HitParry`: I succesfully parried an hit.
- `@HitRate`: Hit rate damage trigger
- `@HitReactive`: Reactive damage trigger
- `@HitTry`: I am trying to hit someone. starting swing.
- `@HitZone`: 0.56TX: vuruş bölgesi seçildi (CombatHitLocation=0)
- `@HouseDesignBegin`: Starting to customize.
- `@HouseDesignCommit`: I committed a new house design.
- `@HouseDesignCommitItem`: I committed an item to the house design.
- `@HouseDesignExit`: I exited house design mode.
- `@itemAfterClick`
- `@itemBuy`
- `@itemCarveCorpse`: I am carving a corpse.
- `@itemClick`: I clicked on an item
- `@itemClientTooltip`: Receiving tooltip for something
- `@itemClientTooltip_AfterDefault`
- `@itemContextMenuRequest`
- `@itemContextMenuSelect`
- `@itemCreate`: ?
- `@itemDamage`: ?
- `@itemDCLICK`: I have dclicked item
- `@itemDestroy`: +I am nearly destroyed
- `@itemDropOn_Char`: I have been dropped on this char
- `@itemDropOn_Ground`: I dropped an item on the ground
- `@itemDropOn_Item`: I have been dropped on this item
- `@itemDropOn_Self`: An item has been dropped on
- `@ItemDropOn_Trade`
- `@itemEQUIP`: I have equipped an item
- `@itemEQUIPTEST`
- `@itemMemoryEquip`
- `@itemPICKUP_GROUND`
- `@itemPICKUP_PACK`: picked up from inside some container.
- `@itemPICKUP_SELF`: picked up from this container
- `@itemPICKUP_STACK`: picked up from a stack
- `@itemRedeed`
- `@ItemRegionEnter`
- `@ItemRegionLeave`
- `@itemSELL`
- `@itemSmelt`: I am smelting an item.
- `@itemSPELL`: cast some spell on the item.
- `@itemSTEP`: stepped on an item
- `@itemTARGON_CANCEL`
- `@itemTARGON_CHAR`
- `@itemTARGON_GROUND`
- `@itemTARGON_ITEM`: I am being combined with an item
- `@itemTimer`: ?
- `@itemToolTip`: Did tool tips on an item
- `@itemUNEQUIP`: i have unequipped (or try to unequip) an item
- `@Jailed`
- `@KarmaChange`: Karma is changing
- `@Kill`: +I have just killed someone
- `@LogIn`: Client logs in
- `@LogOut`: Client logs out (21)
- `@Mount`: I'm trying to mount my horse (or whatever)
- `@MountAfter`: 0.56TX: bindim (0.56T)
- `@MurderDecay`: One of my kills is gonna to be cleared
- `@MurderMark`: I am gonna to be marked as a murderer
- `@NotoSend`: Sending notoriety
- `@NPCAcceptItem`: (NPC only) i've been given an item i like (according to DESIRES)
- `@NPCActCast`: (NPC only) I decided to cast a spell.
- `@NPCActFight`: (NPC only) I have to fight against my target.
- `@NPCActFollow`: (NPC only) following someone right now
- `@NPCAction`
- `@NPCActWander`: (NPC only) i'm wandering aimlessly
- `@NPCDismount`: 0.56TX: (NPC only) binicim iniyor (0.56T)
- `@NPCDismountAfter`: 0.56TX: (NPC only) binicim indi
- `@NPCHearGreeting`: (NPC only) i have been spoken to for the first time. (no memory of previous hearing)
- `@NPCHearUnknown`: +(NPC only) I heard something i don't understand.
- `@NPCLookAtChar`: (NPC only) look at a character
- `@NPCLookAtItem`: (NPC only) look at a character
- `@NPCLostTeleport`: +(NPC only) ready to teleport back to spawn
- `@NPCMount`: 0.56TX: (NPC only) bana biniliyor (0.56T)
- `@NPCMountAfter`: 0.56TX: (NPC only) bana binildi (0.56T)
- `@NPCRefuseItem`: (NPC only) i've been given an item i don't want.
- `@NPCRestock`: (NPC only)
- `@NPCRestockTick`: 0.56TX: (NPC only) stok boşaltıldı (0.56T)
- `@NPCSeeNewPlayer`: +(NPC only) i see u for the first time. (in 20 minutes) (check memory time)
- `@NPCSeeWantItem`: (NPC only) i see something good.
- `@NPCShrink`: 0.56TX: (NPC only) figürine döndüm (0.56T)
- `@NPCSpecialAction`: Idle
- `@NPCUnShrink`: 0.56TX: (NPC only) figürinden çıkacağım (0.56T)
- `@OpenBank`: 0.56TX: bankam açılıyor (0.56T)
- `@PartyAdd`: Player joined the party.
- `@PartyDisband`: I just disbanded my party
- `@PartyInvite`: SRC invited me to join a party, so I may chose
- `@PartyJoin`: 0.56TX: partiye girdim (0.56T)
- `@PartyLeave`
- `@PartyRemove`: I have ben removed from the party by SRC
- `@PayGold`: I'm going to give out money for a service (Skill Training, hiring...).
- `@PersonalSpace`: +i just got stepped on by other char.
- `@PetDesert`: I just went wild again
- `@PetRelease`: I just been released by my master
- `@Profile`: someone hit the profile button for me.
- `@ReceiveItem`: I was just handed an item (Not yet checked if i want it)
- `@RegenStat`: Regenerating any stat
- `@RegionEnter`
- `@RegionLeave`
- `@RegionResourceFound`: I just discovered a resource
- `@RegionResourceGather`
- `@Rename`
- `@Resurrect`
- `@Reveal`: Character is revealing.
- `@SeeCrime`: I saw a crime
- `@SeeHidden`: Can I see hidden chars?
- `@SeeSnoop`
- `@SeeSteal`: 0.56TX: birinin hırsızlığını fark ettim (SRC hırsız, ARGO kurban, ARGN2 eşya; RETURN 1 görmemiş sayılırım)
- `@SendPaperdoll`: Server send paperdollpacket
- `@SkillAbort`
- `@SkillChange`
- `@SkillFail`
- `@SkillGain`
- `@SkillMakeItem`
- `@SkillMenu`
- `@SkillPreStart`
- `@SkillSelect`
- `@SkillStart`
- `@SkillStroke`
- `@SkillSuccess`
- `@SkillTargetCancel`
- `@SkillUseQuick`
- `@SkillWait`
- `@SpellBook`
- `@SpellCast`: Char is casting a spell.
- `@SpellEffect`: A spell just hit me.
- `@SpellEffectAdd`: A spell memory item is going to be placed upon me.
- `@SpellEffectRemove`: A spell memory item is going to be removed from me.
- `@SpellEffectTick`: A spell is going to tick and have an effect on me.
- `@SpellFail`: The spell failed
- `@SpellInterrupt`: The spell was interrupted
- `@SpellSelect`: Selected a spell
- `@SpellSuccess`: The spell succeeded
- `@SpellTargetCancel`: cancelled spell target
- `@StatChange`
- `@StepStealth`: Made a step in stealth mode
- `@Targon_Cancel`: closing target from TARGETF*
- `@ToggleFlying`: Flying On/Off
- `@ToolTip`: someone did tool tips on me.
- `@TradeAccepted`: Everything went well, and we are about to exchange trade items
- `@TradeClose`
- `@TradeCreate`
- `@TravelCheck`: 0.56TX: yolculuk büyüsünün kontrolü (TravelCheck)
- `@UserBugReport`
- `@UserChatButton`
- `@UserExtCmd`
- `@UserExWalkLimit`
- `@UserGuildButton`
- `@UserKRToolbar`
- `@UserMailBag`
- `@UserQuestArrowClick`
- `@UserQuestButton`
- `@UserSkills`
- `@UserSpecialMove`
- `@UserStats`
- `@UserUltimaStoreButton`
- `@UserVirtue`
- `@UserVirtueInvoke`
- `@UserWarmode`: War mode ?

## Eşya tetikleyicileri (ITEMDEF, TYPEDEF, TEVENTS)

Çalışma sırası: eşyanın `EVENTS`'i, `TYPEDEF`'i, ITEMDEF'i; sonra karakterdeki `@Item...` karşılığı. `RETURN 1` motorun varsayılan davranışını durdurur.

- `@AddObj`: For t_spawn when obj is add to list
- `@AddRedCandle`
- `@AddWhiteCandle`
- `@AfterClick`
- `@ArmorHit`: 0.56TX: örttüğüm bölgeye vuruş geldi (CombatHitLocation=0).
- `@Buy`
- `@CarveCorpse`: I am a corpse and i am going to be carved.
- `@Click`
- `@ClientTooltip`: Sending tooltip to a client
- `@ClientTooltip_AfterDefault`
- `@Complete`
- `@ContextMenuRequest`
- `@ContextMenuSelect`
- `@Create`
- `@DAMAGE`: I have been damaged in some way
- `@DCLICK`: I have been dclicked.
- `@DelObj`: For t_spawn when obj is remove from list
- `@DelRedCandle`
- `@DelWhiteCandle`
- `@Destroy`: +I am nearly destroyed
- `@DropOn_Char`: I have been dropped on this char
- `@DropOn_Ground`: I have been dropped on the ground here
- `@DropOn_Item`: I have been dropped on this item
- `@DropOn_Self`: An item has been dropped here
- `@DropOn_Trade`
- `@Dye`: My color has been changed
- `@EQUIP`: I have been unequipped
- `@EQUIPTEST`
- `@GetHit`
- `@Hit`
- `@Level`
- `@MemoryEquip`
- `@PICKUP_GROUND`: I was picked up off the ground.
- `@PICKUP_PACK`: picked up from inside some container.
- `@PICKUP_SELF`: picked up from here
- `@PICKUP_STACK`: was picked up from a stack
- `@PreSpawn`
- `@Redeed`
- `@RegionEnter`
- `@RegionLeave`
- `@ResourceGather`
- `@ResourceTest`
- `@SELL`
- `@Ship_Move`
- `@Ship_Stop`
- `@Ship_Turn`
- `@Smelt`: I am going to be smelted.
- `@Spawn`
- `@SpellEffect`: cast some spell on me.
- `@Start`
- `@STEP`: I have been walked on.
- `@Stop`
- `@TARGON_CANCEL`
- `@TARGON_CHAR`
- `@TARGON_GROUND`
- `@TARGON_ITEM`: I am being combined with an item
- `@TIMER`: My timer has expired.
- `@ToolTip`
- `@UNEQUIP`: i have been unequipped (or try to unequip)

## Bölge tetikleyicileri (AREADEF, ROOMDEF, REGIONTYPE; EVENTS ile)

- `@CLIPERIODIC`
- `@ENTER`
- `@EXIT`
- `@REGPERIODIC`
- `@STEP`

## Büyü tetikleyicileri ([SPELL] bölümünde)

Atan karakterin `@Spell...` karşılıkları karakter listesinde.

- `@EFFECT`
- `@EFFECTADD`
- `@EFFECTREMOVE`
- `@EFFECTTICK`
- `@FAIL`
- `@SELECT`
- `@START`
- `@SUCCESS`
- `@TARGETCANCEL`

## Skill tetikleyicileri ([SKILL] bölümünde)

Karakterin `@Skill...` karşılıkları karakter listesinde (`@SkillStart`, `@SkillSuccess`...).

- `@ABORT`
- `@FAIL`: we failed the skill check.
- `@GAIN`
- `@PRESTART`
- `@SELECT`: just selecting params for the skill
- `@START`: params for skill are done.
- `@STROKE`
- `@SUCCESS`
- `@TARGETCANCEL`
- `@USEQUICK`
- `@WAIT`

## Kaynak tetikleyicileri ([REGIONRESOURCE])

- `@RESOURCEFOUND`
- `@RESOURCEGATHER`
- `@RESOURCETEST`

## Bonus tetikleyicileri ([BONUS], 0.56TX)

- `@END`
- `@START`
- `@TICK`

## Web sayfası tetikleyicileri ([WEBPAGE])

- `@LOAD`

