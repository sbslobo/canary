local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 2.2) + 12
	local max = (level / 5) + (maglevel * 3.4) + 21
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

spell:group("attack", "special")
spell:id(149)
spell:name("Lightning")
spell:words("exori amp vis")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_LIGHTNING)
spell:level(55)
spell:mana(60)
spell:isPremium(true)
spell:range(4)
spell:needCasterTargetOrDirection(true)
spell:blockWalls(true)
spell:cooldown(8 * 1000)
spell:groupCooldown(2 * 1000, 8 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()
