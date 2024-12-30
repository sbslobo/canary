local taskSystem = TalkAction("!task")

function taskSystem.onSay(cid, words, param)
	local player = Player(cid)
    player:registerEvent("taskSystem")
	
 	local countTaskStorage = 58745
	local countTask = player:getStorageValue(countTaskStorage) + 1
    local title = "Choose whatever task you want!"
    local message = "Here are the task that are available for you at this momment. By completing a task you will receive experience and money. \nYou are already doing " ..countTask.. "/1"
  
    local window = ModalWindow(1000, title, message)
	local tableid = 1

    window:addButton(100, "Confirm")
    window:addButton(101, "Exit")
    window:addButton(102, "Leave Task")	
 
	for index, value in ipairs(taskSystemtable) do 
		if player:getStorageValue(value.storage) == 1 then
			window:addChoice(tableid,"" ..value.name.. " [" ..player:getStorageValue(value.storagecount).."/" ..value.count.."]")
		else
			window:addChoice(tableid, value.name)
		end
		tableid = tableid + 1
	end
  
    window:setDefaultEnterButton(100)
    window:setDefaultEscapeButton(101)
  
    window:sendToPlayer(player)
    return false
end

taskSystem:groupType("normal")
taskSystem:register()

