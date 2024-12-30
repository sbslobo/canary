local taskSystem = CreatureEvent("taskSystem")
function taskSystem.onModalWindow(player, modalWindowId, buttonId, choiceId)  
    player:unregisterEvent("taskSystem")
	
	

	local tableid = 1
	local countTaskStorage = 58745
	
		
	for index, value in ipairs(taskSystemtable) do  
		local counttasks = player:getStorageValue(countTaskStorage)	
		if modalWindowId == 1000 then
			if buttonId == 100 then
				if choiceId == tableid then
					if player:getStorageValue(value.storage) == 1 then
						player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Finish the task to get additional experience and money.")					
					elseif player:getStorageValue(value.storage) <= 0 then	
						if player:getStorageValue(countTaskStorage) >= 0 then
							player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are already doing a task, please complete or leave your current task to do another.")
						elseif player:getStorageValue(countTaskStorage) < 0 then
					--player:addItem(taskSystemtable[tableid].item, 1)
							player:sendTextMessage(MESSAGE_EVENT_ADVANCE, value.msgstart)
							player:setStorageValue(value.storage, 1)
							player:setStorageValue(value.storagecount, 0)
							player:setStorageValue(countTaskStorage, counttasks + 1)
						end
					end
				end
			elseif buttonId == 102 then
				if choiceId == tableid then
					if player:getStorageValue(value.storage) == 1 then
						player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You've quit the task "..value.name..".")
						player:setStorageValue(value.storage, 0)
						player:setStorageValue(value.storagecount, 0)	
						player:setStorageValue(countTaskStorage, counttasks - 1)
					elseif player:getStorageValue(value.storage) < 1 then
						player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You're not doing this task right now.")
					end
				end
			end
		end
		tableid = tableid + 1
	end
end
taskSystem:register()

