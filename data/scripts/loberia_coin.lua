local LoberiaCoin = {}

-- Obtiene el balance de loberia_coin para una cuenta específica
function LoberiaCoin.getBalance(accountId)
    local result = db.query("SELECT `loberia_coin` FROM `accounts` WHERE `id` = " .. accountId .. ";")
    if not result or #result == 0 then
        return 0  -- Si no hay resultado o falla, devolvemos un balance de 0
    end
    return result[1].loberia_coin or 0
end

-- Agrega monedas a la cuenta especificada
function LoberiaCoin.addCoins(accountId, amount)
    local currentBalance = db.query("SELECT `loberia_coin` FROM `accounts` WHERE `id` = " .. accountId .. ";")
	
    local newBalance = currentBalance + amount
    db.query("UPDATE `accounts` SET `loberia_coin` = " .. newBalance .. " WHERE `id` = " .. accountId .. ";")
end

-- Remueve monedas de la cuenta especificada
function LoberiaCoin.removeCoins(accountId, amount)
    local currentBalance = LoberiaCoin.getBalance(accountId)
    local newBalance = math.max(0, currentBalance - amount)  -- Asegura que no sea negativo
    db.query("UPDATE `accounts` SET `loberia_coin` = " .. newBalance .. " WHERE `id` = " .. accountId .. ";")
end

return LoberiaCoin
