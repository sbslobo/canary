local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 4.5) + 35
	local max = (level / 5) + (maglevel * 7.3) + 55
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

    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack", "ultimatestrikes")
spell:id(155)
spell:name("Ultimate Energy Strike")
spell:words("exori max vis")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
spell:impactSound(SOUND_EFFECT_TYPE_SPELL_ULTIMATE_ENERGY_STRIKE)
spell:level(100)
spell:mana(100)
spell:isPremium(true)
spell:range(3)
spell:needCasterTargetOrDirection(true)
spell:blockWalls(true)
spell:cooldown(30 * 1000)
spell:groupCooldown(2 * 1000, 30 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()
