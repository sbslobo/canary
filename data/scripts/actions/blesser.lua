local codex = Action()

-- ID del Codex of Redemption
codex:id(49279)

function codex.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Verifica si el jugador ya tiene todas las bendiciones
    local allBlessings = true
    for blessingId = 1, 8 do
        if not player:hasBlessing(blessingId) then
            allBlessings = false
            break
        end
    end

    if allBlessings then
        -- Mensaje si ya tiene todas las bendiciones
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already have all blessings.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF) -- Efecto visual
        return true
    end

    -- Otorgar todas las bendiciones
    player:addMissingBless(true, true)

    -- Mensaje y efecto visual
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Codex of Redemption has restored all your blessings!")
    player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)

    return true
end

-- Registrar el Codex
codex:register()



