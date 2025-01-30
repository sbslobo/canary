local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_BIGCLOUDS)
combat:setArea(createCombatArea(AREA_CIRCLE6X6))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 7)
	local max = (level / 5) + (maglevel * 14)
    local wand = player:getSlotItem(CONST_SLOT_LEFT) -- Slot de la mano izquierda
    if wand then
        local itemType = ItemType(wand:getId()) -- Obtén el tipo del ítem
        local itemLevel = wand:getAttribute(ITEM_ATTRIBUTE_ITEMLEVEL)
        local extradmg = 1 + (itemLevel * 0.03)

        -- Obtiene el nombre del ítem y verifica si contiene "rod"
        local itemName = wand:getName():lower() -- Convierte el nombre a minúsculas para evitar problemas de mayúsculas/minúsculas
        if itemType and itemType:getWeaponType() == 6 and itemLevel > 0 and not itemName:find("rod") then
            -- Solo aplica daño extra si no es una "rod"
            min = min * extradmg
            max = max * extradmg
        end
    end
	local spellbook = player:getSlotItem(CONST_SLOT_RIGHT) -- Slot de la mano derecha
    if spellbook then
        local itemLevel = spellbook:getAttribute(ITEM_ATTRIBUTE_ITEMLEVEL) or 0
        local itemName = spellbook:getName():lower()
        -- IDs de los spellbooks válidos o verificar por nombre
        local validSpellbooks = {
            [40594] = true, [39154] = true, [39152] = true,
            [22755] = true, [29426] = true, [36672] = true,
            [36673] = true, [29420] = true, [11691] = true,
            [29431] = true
        }
        if validSpellbooks[spellbook:getId()] or itemName:find("spellbook") then
            local extradmg = 1 + (itemLevel * 0.03)
            min = min * extradmg
            max = max * extradmg
        end
    end

	return -min, -max

end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack", "focus")
spell:id(119)
spell:name("Rage of the Skies")
spell:words("exevo gran mas vis")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_RAGE_OF_THE_SKIES)
spell:level(55)
spell:mana(600)
spell:isSelfTarget(true)
spell:isPremium(true)
spell:cooldown(40 * 1000)
spell:groupCooldown(4 * 1000, 40 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()
