local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_STONES)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 0.4) + 2
	local max = (level / 5) + (maglevel * 1.59) + 10
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

local rune = Spell("rune")

function rune.onCastSpell(creature, var, isHotkey)
	return combat:execute(creature, var)
end

rune:id(77)
rune:group("attack")
rune:name("stalagmite rune")
rune:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
rune:impactSound(SOUND_EFFECT_TYPE_SPELL_STALAGMITE_RUNE)
rune:runeId(3179)
rune:allowFarUse(true)
rune:charges(10)
rune:level(24)
rune:magicLevel(3)
rune:cooldown(2 * 1000)
rune:groupCooldown(2 * 1000)
rune:needTarget(true) -- True = Solid / False = Creature
rune:register()
