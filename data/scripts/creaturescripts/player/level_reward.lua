local table = 
{
	-- [level] = type = "item", id = {ITEM_ID, QUANTITY}, msg = "MESSAGE"},
	-- [level] = type = "bank", id = {QUANTITY, 0}, msg = "MESSAGE"},
	-- [level] = type = "addon", id = {ID_ADDON_FEMALE, ID_ADDON_MALE}, msg = "MESSAGE"},
	-- [level] = type = "coin", id = {QUANTITY, 0}, msg = "MESSAGE"},
	-- [level] = type = "mount", id = {ID_MOUNT, 0}, msg = "MESSAGE"},

	[50] = {type = "money", id = {3043, 5}, msg = "You won 5 crystal coins for reaching the level 50!"},
	[100] = {type = "set", id = {20000, 0}, msg = "You won a medium level weapon for your vocation for reaching level 100!"},
	[150] = {type = "money2", id = {136, 128}, msg = "You won 15 crystal coins for reaching the level 150!"},
	[200] = {type = "money3", id = {5, 0}, msg = "You won 25 crystal coins for reaching the level 200!"},
	[250] = {type = "mount", id = {2, 0}, msg = "You win the mount x!"},
}

local storage = 15000

local levelReward = CreatureEvent("Level Reward")
function levelReward.onAdvance(player, skill, oldLevel, newLevel)
local skillsknight = {
	{skill = SKILL_CLUB, itemId = 8100},  -- Item for highest Club skill
	{skill = SKILL_SWORD, itemId = 8102}, -- Item for highest Sword skill
	{skill = SKILL_AXE, itemId = 8096}    -- Item for highest Axe skill
}

	if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
		return true
	end

	for level, _ in pairs(table) do
		if newLevel >= level and player:getStorageValue(storage) < level then
			if table[level].type == "money" then	
				player:addItem(table[level].id[1], table[level].id[2])
			elseif table[level].type == "set" then
				if player:getVocation():getId() == 1 or player:getVocation():getId() == 2 or player:getVocation():getId() == 5 or player:getVocation():getId() == 6 then
					player:addItem(25700, 1)
					player:addItem(11687, 1)
					player:addItem(10387, 1)
					player:addItem(8076, 1)	
					player:addItem(9103, 1)						
				elseif player:getVocation():getId() == 3 or player:getVocation():getId() == 7 then
					player:addItem(16164, 1)		
					player:addItem(16163, 1)
					player:addItem(8060, 1)		
					player:addItem(10387, 1)
					player:addItem(3414, 1)	
					player:addItem(5741, 1)						
				elseif player:getVocation():getId() == 4 or player:getVocation():getId() == 8 then
					local highestSkill = {value = 0, itemId = 0}
					for _, v in ipairs(skillsknight) do
						local skillValue = player:getSkillLevel(v.skill)
						if skillValue > highestSkill.value then
							highestSkill = {value = skillValue, itemId = v.itemId}
						end
					end
					if highestSkill.itemId > 0 then
						player:addItem(highestSkill.itemId, 1)
						player:addItem(11686, 1)					
						player:addItem(10387, 1)
						player:addItem(3414, 1)	
						player:addItem(5741, 1)						
					end
				end
			player:addItem(3043, 10)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You got a medium set for your vocation for reaching level 100!")				
			elseif table[level].type == "money2" then
				player:addItem(3043, 15)
			elseif table[level].type == "money3" then
				player:addItem(3043, 25)
			else
				return false
			end

			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, table[level].msg)
			player:setStorageValue(storage, level)	
		end
	end

	player:save()

	return true
end

levelReward:register()