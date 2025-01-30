local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SMALLPLANTS)
combat:setArea(createCombatArea(AREA_SQUAREWAVE5, AREADIAGONAL_SQUAREWAVE5))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 3.5)
	local max = (level / 5) + (maglevel * 7)
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

	return -min, -max

end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(120)
spell:name("Terra Wave")
spell:words("exevo tera hur")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_TERRA_WAVE)
spell:level(38)
spell:mana(170)
spell:isPremium(true)
spell:needDirection(true)
spell:cooldown(4 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("druid;true", "elder druid;true")
spell:register()
