local mod	= DBM:NewMod("Rotface", "DBM-Icecrown", 2)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20250929220131")
mod:SetCreatureID(36627)
mod:SetEncounterID(850)
mod:SetUsedIcons(1, 2)
mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 69508 69774 69839",
	"SPELL_AURA_APPLIED 71208 69760 69558 69674 71224 73022 73023 72272 72273",
	"SPELL_AURA_APPLIED_DOSE 69558",
	"SPELL_AURA_REMOVED 69674 71224 73022 73023",
	"CHAT_MSG_MONSTER_YELL"
)

local warnSlimeSpray			= mod:NewSpellAnnounce(69508, 2)
local warnMutatedInfection		= mod:NewTargetNoFilterAnnounce(69674, 4)
local warnRadiatingOoze			= mod:NewSpellAnnounce(69760, 3)
local warnOozeSpawn				= mod:NewAnnounce("WarnOozeSpawn", 1)
local warnStickyOoze			= mod:NewSpellAnnounce(69774, 1)
local warnUnstableOoze			= mod:NewStackAnnounce(69558, 2)
local warnVileGas				= mod:NewTargetAnnounce(72272, 3)

local specWarnMutatedInfection	= mod:NewSpecialWarningYou(69674, nil, nil, nil, 1, 2)
local specWarnStickyOoze		= mod:NewSpecialWarningMove(69774, nil, nil, nil, 1, 2)
local specWarnOozeExplosion		= mod:NewSpecialWarningDodge(69839, nil, nil, nil, 1, 2)
local specWarnSlimeSpray		= mod:NewSpecialWarningSpell(69508, false, nil, nil, 1, 2)
local specWarnRadiatingOoze		= mod:NewSpecialWarningSpell(69760, "-Tank", nil, nil, 1, 2)
local specWarnLittleOoze		= mod:NewSpecialWarning("SpecWarnLittleOoze", false, nil, nil, 1, 2)
local specWarnVileGas			= mod:NewSpecialWarningYou(72272, nil, nil, nil, 1, 2, 3)

local timerStickyOoze			= mod:NewNextTimer(15, 69774, nil, "Tank", nil, 5, nil, DBM_COMMON_L.TANK_ICON)
local timerWallSlime			= mod:NewNextTimer(25, 69789)
local timerSlimeSpray			= mod:NewNextTimer(20, 69508, nil, nil, nil, 3)
local timerMutatedInfection		= mod:NewTargetTimer(12, 69674, nil, nil, nil, 5)
local timerOozeExplosion		= mod:NewCastTimer(4, 69839, nil, nil, nil, 2, nil, DBM_COMMON_L.MYTHIC_ICON, nil, 3)
local timerVileGasCD			= mod:NewCDTimer(29.1, 72272, nil, nil, nil, 3)

mod:AddRangeFrameOption(10, 72272
