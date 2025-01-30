local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SMALLPLANTS)
combat:setArea(createCombatArea(AREA_CIRCLE6X6))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 5)
	local max = (level / 5) + (maglevel * 10)
	local wand = player:getSlotItem(CONST_SLOT_LEFT) -- Slot de la mano izquierda
	if wand then
		local itemType = ItemType(wand:getId()) -- Obtén el tipo del ítem
		local itemLevel = wand:getAttribute(ITEM_ATTRIBUTE_ITEMLEVEL)
		local extradmg = 1 + (itemLevel * 0.03)

		-- Obtiene el nombre del ítem y verifica si contiene "rod"
		local itemName = wand:getName():lower() -- Convierte el nombre a minúsculas para evitar problemas de mayúsculas/minúsculas
		if itemType and itemType:getWeaponType() == 6 and itemLevel > 0 and itemName:find("rod") then
			-- Aplica daño extra si el nombre contiene "rod"
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
spell:id(56)
spell:name("Wrath of Nature")
spell:words("exevo gran mas tera")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_WRATH_OF_NATURE)
spell:level(55)
spell:mana(700)
spell:isPremium(true)
spell:isSelfTarget(true)
spell:cooldown(40 * 1000)
spell:groupCooldown(4 * 1000, 40 * 1000)
spell:needLearn(false)
spell:vocation("druid;true", "elder druid;true")
spell:register()
