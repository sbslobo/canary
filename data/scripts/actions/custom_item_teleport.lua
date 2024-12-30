local CustomTP = Action()

-- Tabla para almacenar el último uso de cada jugador
local cooldowns = {}

function CustomTP.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local destination = Position(32369, 32241, 7)
    local playerId = player:getId()

    -- Verificar si el jugador tiene cooldown
    if cooldowns[playerId] then
        local lastUse = cooldowns[playerId]
        local timeRemaining = lastUse + 600 - os.time()  -- 600 segundos de cooldown (10 minutos)
        
        if timeRemaining > 0 then
            -- Convertir los segundos a minutos y segundos
            local minutes = math.floor(timeRemaining / 60)
            local seconds = timeRemaining % 60
            -- Enviar mensaje de espera con formato de minutos y segundos
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have to wait " .. minutes .. " minutes and " .. seconds .. " seconds to use the teleportation bell again.")
            return false
        end
    end

    -- Si el jugador está en la misma posición, no lo teletransportamos
    if player:getPosition() == destination then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are already at the destination.")
        return false
    end

    -- Verificamos si el jugador está en pelea o bloqueado en zona segura
    if not player:isPzLocked() and not player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) then
        player:teleportTo(destination)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
        
        -- Registrar el uso del teletransportador y establecer el cooldown
        cooldowns[playerId] = os.time()
    else
        player:sendTextMessage(MESSAGE_FAILURE, "You can't use this when you're in a fight.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
    end

    return true
end

CustomTP:id(30195)
CustomTP:register()
