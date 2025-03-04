local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_CARNIPHILA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLEARTH)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 0.4) + 3
	local max = (level / 5) + (maglevel * 0.7) + 5
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
spell:id(174)
spell:name("Mud Attack")
spell:words("exori infir tera")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
spell:impactSound(SOUND_EFFECT_TYPE_SPELL_MUD_ATTACK)
spell:level(1)
spell:mana(6)
spell:isAggressive(true)
spell:isPremium(false)
spell:range(3)
spell:needCasterTargetOrDirection(true)
spell:blockWalls(true)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("druid;true", "elder druid;true")
spell:register()
