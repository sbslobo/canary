local addLoberiaCoin = TalkAction("/addloberiacoin")

function addLoberiaCoin.onSay(player, words, param)
    -- Verifica que el nombre del jugador se haya especificado
    if param == "" then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Please specify a player name.")
        return false
    end

    -- Busca el jugador en línea para obtener su accountId
    local targetPlayer = Player(param)
    if not targetPlayer then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Player " .. param .. " is not online.")
        return false
    end

    local accountId = targetPlayer:getAccountId()

    -- Consulta la cantidad actual de Loberia Coins
    local result = db.query("SELECT `loberia_coin` FROM `accounts` WHERE `id` = " .. accountId .. ";")
    if not result then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Failed to retrieve Loberia Coins for player " .. param .. ".")
        return false
    end

    -- Actualiza el valor de loberia_coin sumando 100
    local updateResult = db.query("UPDATE `accounts` SET `loberia_coin` = `loberia_coin` + 100 WHERE `id` = " .. accountId .. ";")
    if updateResult then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Successfully added 100 Loberia Coins to " .. param .. ".")
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have received 100 Loberia Coins.")
    else
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Failed to add Loberia Coins to player " .. param .. ".")
    end

    return true
end

addLoberiaCoin:separator(" ")
addLoberiaCoin:groupType("god") -- Define el grupo de permisos necesario para el comando
addLoberiaCoin:register()
