local LoberiaStore = CreatureEvent("LoberiaStore")
function LoberiaStore.onModalWindow(player, modalWindowId, buttonId, choiceId)
    player:unregisterEvent("LoberiaStore")

    local tableid = 1
	
	for index, items in ipairs(loberiastoretable) do
		if modalWindowId == 1001 and buttonId == 100 and choiceId == tableid then
			local ConfirmModal = ModalWindow(2002)
			ConfirmModal:setTitle("Are you sure?")
			ConfirmModal:setMessage("Are you sure?")
			ConfirmModal:addButton(200, "Yes")
			ConfirmModal:addButton(201, "No")
			ConfirmModal:sendToPlayer(player)	
			if modalWindowId == confirmModal and buttonId == 200 then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Confirmación completada")
			end
		end
        tableid = tableid + 1
    end
end
LoberiaStore:register()