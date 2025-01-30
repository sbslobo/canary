local taskSystemKill = CreatureEvent("taskSystemKill")


function taskSystemKill.onDeath(player, target)

	if target:isPlayer() or target:getMaster() then
		return true
	end
		
	local countTaskStorage = 58745		
	
    
	for index, tasks in ipairs(taskSystemtable) do 
	local counttasks = player:getStorageValue(countTaskStorage)	
	local counter = player:getStorageValue(tasks.storagecount)	
		if player:getStorageValue(tasks.storage) == 1 then
			if isInArray(tasks.names, getCreatureName(target)) then			
					if counter < tasks.count then
						player:setStorageValue(tasks.storagecount, counter + 1)
						player:sendTextMessage(MESSAGE_LOGIN, "You have killed "..counter + 1 .."/" ..tasks.count.." " ..tasks.name.."s.")
						if counter == (tasks.count - 1) then
							player:sendTextMessage(MESSAGE_LOGIN, "Congratulations, you have finished your task: "..tasks.name.."Here's your reward")
							player:setStorageValue(tasks.storage, 0)
							player:addExperience(tasks.experience, true)
							player:addItem(tasks.item, tasks.itemcount)
							player:setStorageValue(countTaskStorage, counttasks - 1)
						end
						break				
					end

			else
				return true
			end
        end
    end
    return true
end			


taskSystemKill:register()

