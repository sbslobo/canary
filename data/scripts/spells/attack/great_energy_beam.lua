local function formulaFunction(player, level, maglevel)
    local min = (level / 5) + (maglevel * 4)
    local max = (level / 5) + (maglevel * 7)

    -- Verifica si el jugador tiene una wand equipada con nivel mayor a 0
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


function onGetFormulaValues(player, level, maglevel)
    return formulaFunction(player, level, maglevel)
end

function onGetFormulaValuesWOD(player, level, maglevel)
    return formulaFunction(player, level, maglevel)
end

local function createCombat(area, combatFunc)
    local initCombat = Combat()
    initCombat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, combatFunc)
    initCombat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
    initCombat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
    initCombat:setArea(createCombatArea(area))
    return initCombat
end

local combat = createCombat(AREA_BEAM8, "onGetFormulaValues")
local combatWOD = createCombat(AREA_BEAM10, "onGetFormulaValuesWOD")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
    local player = creature:getPlayer()
    if not creature or not player then
        return false
    end
    return player:instantSkillWOD("Beam Mastery") and combatWOD:execute(creature, var) or combat:execute(creature, var)
end

spell:group("attack", "greatbeams")
spell:id(23)
spell:name("Great Energy Beam")
spell:words("exevo gran vis lux")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_GREAT_ENERGY_BEAM)
spell:level(29)
spell:mana(110)
spell:isPremium(false)
spell:needDirection(true)
spell:blockWalls(true)
spell:cooldown(6 * 1000)
spell:groupCooldown(2 * 1000, 6 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()
