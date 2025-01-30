local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat:setArea(createCombatArea(AREA_CIRCLE5X5))


local validSpellbooks = {
    [40594] = true,
    [39154] = true,
    [39152] = true,
    [22755] = true,
    [29426] = true,
    [36672] = true,
    [36673] = true,
    [29420] = true,
    [11691] = true,
    [29431] = true
}

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 10)
	local max = (level / 5) + (maglevel * 14)
    local spellbook = player:getSlotItem(CONST_SLOT_RIGHT)
    if spellbook then
        local itemId = spellbook:getId()
        local itemName = spellbook:getName():lower() -- Convierte el nombre a minúsculas

        -- Verifica si es un spellbook válido por ID o por nombre
        if validSpellbooks[itemId] or itemName:find("spellbook") then
            local itemLevel = spellbook:getAttribute(ITEM_ATTRIBUTE_ITEMLEVEL) or 0
            if itemLevel > 0 then
                local extradmg = 1 + (itemLevel * 0.03) -- 3% de daño extra por nivel
                min = min * extradmg
                max = max * extradmg
            end
        end
    end

    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:group("attack", "focus")
spell:id(24)
spell:name("Hell's Core")
spell:words("exevo gran mas flam")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_HELL_SCORE)
spell:level(60)
spell:mana(1100)
spell:isSelfTarget(true)
spell:isPremium(true)
spell:cooldown(40 * 1000)
spell:groupCooldown(4 * 1000, 40 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()
