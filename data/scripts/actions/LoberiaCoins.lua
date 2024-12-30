local openModalWindowAction = Action()

function openModalWindowAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Obtener el ID de la cuenta del jugador
    local accountID = player:getAccountId()
    player:registerEvent("LoberiaStore") 
    -- Ejecutar la consulta a la base de datos
    local resultId = db.storeQuery("SELECT loberia_coin FROM accounts WHERE id = " .. accountID)
    
    -- Comprobar si hay un resultado y obtener el valor de loberia_coin
    local loberiaCoins = 0
    if resultId ~= false then
        loberiaCoins = result.getNumber(resultId, "loberia_coin") or 0
        result.free(resultId)
    end

    -- Crear la modal window
	local tableid = 1
    local modal = ModalWindow(1001)
    modal:setTitle("Mi Modal Window")
    modal:setMessage("Actualmente tienes: " .. loberiaCoins .. " en tu cuenta.")
    modal:addButton(100, "Aceptar")
    modal:addButton(101, "Cancelar")
	
	for index, value in ipairs(loberiastoretable) do 
		modal:addChoice(tableid,"" ..value.name.." (Price: ".. value.price ..")")
		tableid = tableid + 1
	end
    modal:sendToPlayer(player)
    
    -- Registrar el evento para manejar la respuesta del jugador
    
    return true
end

-- Callback para manejar la interacción de la ventana modal

-- IDs de los items que activarán la ventana modal
openModalWindowAction:id(43853)
openModalWindowAction:register()
