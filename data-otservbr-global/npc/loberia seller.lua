local internalNpcName = "Loberia Seller"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = { 
	lookType = 472,
	lookHead = 47,
	lookBody = 112,
	lookLegs = 0,
	lookFeet = 114,
	lookAddons = 3,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Trading tokens! First-class equipment available!" },
}

npcConfig.currency = 22720


local itemsTable = {
	["armors"] = {
		{ name = "Bear Skin", clientId = 31578, buy = 50 },
		{ name = "Ghost Chestplate", clientId = 32628, buy = 50 },
		{ name = "Embrace of Nature", clientId = 31579, buy = 50 },
		{ name = "Toga Mortis", clientId = 31583, buy = 50 },
		{ name = "Firemind Raiment", clientId = 22534, buy = 50 },
		{ name = "Ornate Chestplate", clientId = 13993, buy = 50 },
		{ name = "Dream Shroud", clientId = 29423, buy = 50 },
		{ name = "Thundermind Raiment", clientId = 22536, buy = 50 }
	},
	["weapons"] = {
		{ name = "Shiny Blade", clientId = 16175, buy = 50 },
		{ name = "Throwing Axe", clientId = 17851, buy = 50 },
		{ name = "Maimer", clientId = 22762, buy = 50 },
		{ name = "Energized Limb", clientId = 29425, buy = 50 },
		{ name = "Jungle Bow", clientId = 35518, buy = 50 },
		{ name = "Royal Crossbow", clientId = 8023, buy = 50 }
	},
	["legs"] = {
		{ name = "Ornate Legs", clientId = 13999, buy = 50 },
		{ name = "Prismatic Legs", clientId = 16111, buy = 50 },
		{ name = "Soulful Legs", clientId = 32618, buy = 50 }
	},
	["shields"] = {
		{ name = "Prismatic Shield", clientId = 16116, buy = 50 },
		{ name = "Spirit Guide", clientId = 29431, buy = 50 }
	},
	["boots"] = {
		{ name = "Prismatic Boots", clientId = 16112, buy = 50 },
		{ name = "Pair of Nightmare Boots", clientId = 32619, buy = 50 },
		{ name = "Firewalker Boots", clientId = 9018, buy = 50 },
		{ name = "Depth Calcei", clientId = 13997, buy = 50 }
	},
	["collars"] = {
		{ name = "Collar of Blue Plasma", clientId = 23526, buy = 5 },
		{ name = "Collar of Green Plasma", clientId = 23527, buy = 5 },
		{ name = "Collar of Red Plasma", clientId = 23528, buy = 5 },
		{ name = "Ring of Blue Plasma", clientId = 23529, buy = 5 },
		{ name = "Ring of Green Plasma", clientId = 23531, buy = 5 },
		{ name = "Ring of Red Plasma", clientId = 23533, buy = 5 }
	},
	["rings"] = {
		{ name = "Collar of Blue Plasma", clientId = 23526, buy = 5 },
		{ name = "Collar of Green Plasma", clientId = 23527, buy = 5 },
		{ name = "Collar of Red Plasma", clientId = 23528, buy = 5 },
		{ name = "Ring of Blue Plasma", clientId = 23529, buy = 5 },
		{ name = "Ring of Green Plasma", clientId = 23531, buy = 5 },
		{ name = "Ring of Red Plasma", clientId = 23533, buy = 5 }
	},
	["utilities"] = {
		{ name = "Roulette Ticket", clientId = 49699, buy = 50 },
	},	
}

npcConfig.shop = {}
for _, categoryTable in pairs(itemsTable) do
	for _, itemTable in ipairs(categoryTable) do
		table.insert(npcConfig.shop, itemTable)
	end
end
-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

local answerType = {}
local answerLevel = {}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

local function greetCallback(npc, creature)
	local playerId = creature:getId()
	npcHandler:setTopic(playerId, 0)
	return true
end

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()
	local categoryTable = itemsTable[message:lower()]

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end
	
	
		npc:openShopWindowTable(player, categoryTable)
		
		
	if MsgContains(message, "trade") then
		npcHandler:setTopic(playerId, 1)
		npcHandler:say("I can offer you some {armors}, {weapons}, {legs}, {shields}, {boots}, {rings}, {amulets} and {utilities}.", npc, creature)
		if npcHandler:getTopic(playerId) == 1 then
			npc:openShopWindowTable(player, categoryTable)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(
	MESSAGE_GREET,
	"Hello, |PLAYERNAME|! \z
	I can offer you few useful items if you {trade} some Loberia Coins with me for them."
)
npcHandler:setCallback(CALLBACK_SET_INTERACTION, onAddFocus)
npcHandler:setCallback(CALLBACK_REMOVE_INTERACTION, onReleaseFocus)

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, false)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
