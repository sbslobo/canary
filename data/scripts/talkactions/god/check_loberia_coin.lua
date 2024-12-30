-- Comando: /checkloberiacoin <playername>
local checkLoberiaCoin = TalkAction("/checkloberiacoin")

function checkLoberiaCoin.onSay(player, words, param)
    -- Verificar si el jugador ha proporcionado el nombre
    if param == "" then
        player:sendCancelMessage("Player name param required.")
        return true
    end

    -- Dividir el parámetro para obtener el nombre del jugador
    local split = param:split(",")
    local playerName = split[1]:trim()

    -- Normalizar el nombre del jugador
    local normalizedName = Game.getNormalizedPlayerName(playerName)
    if not normalizedName then
        player:sendCancelMessage("A player with name " .. playerName .. " does not exist.")
        return true
    end
    playerName = normalizedName

    -- Realizar la consulta para obtener el saldo de Loberia Coins
    local resultId = db.storeQuery("SELECT `loberia_coin` FROM `accounts` WHERE `id` = (SELECT `account_id` FROM `players` WHERE `name` = '" .. playerName .. "' LIMIT 1);")
    
    -- Verificar si la consulta fue exitosa
    if resultId ~= false then
        local loberiaCoins = Result.getNumber(resultId, "loberia_coin") or 0  -- Obtener el saldo de Loberia Coins
        local message = string.format("Player %s has %d Loberia Coins.", playerName, loberiaCoins)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, message)
        Result.free(resultId)  -- Liberar la consulta
    else
        player:sendCancelMessage("Failed to retrieve Loberia Coins. Player not found or query failed.")
    end

    return true
end

-- Registrar el talkaction
checkLoberiaCoin:separator(" ")
checkLoberiaCoin:groupType("god")
checkLoberiaCoin:register()
