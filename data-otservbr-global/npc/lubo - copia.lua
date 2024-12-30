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
	lookType = 128,
	lookHead = 115,
	lookBody = 39,
	lookLegs = 96,
	lookFeet = 118,
	lookAddons = 3,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Come trade your Loberia coins here" },
}

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

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	-- Citizen outfit addon
	local addonProgress = player:getStorageValue(Storage.Quest.U7_8.CitizenOutfits.AddonBackpack)
	if MsgContains(message, "exchange") then
		npcHandler:say("I have this offers for you:", npc, creature)
		npcHandler:setTopic(playerId, 1)
		if npcHandler:getTopic(playerId) == 1 then
			if MsgContains(message, "backpack") then
				npcHandler:say("The backpack costs 20 Loberia coins", npc, creature)
			end
			if MsgContains(message, "yes") then
				npcHandler:say("There you go", npc, creature)
				db.query("UPDATE `accounts` SET `loberia_coin` = `loberia_coin` - 20 WHERE `id` = " .. accountId .. ";")
			end
		end
	end
end

keywordHandler:addKeyword({ "job" }, StdModule.say, { npcHandler = npcHandler, text = "I am selling equipment for adventurers. If you need anything, let me know." })
keywordHandler:addKeyword({ "dog" }, StdModule.say, { npcHandler = npcHandler, text = "This is Ruffy my dog, please don't do him any harm." })
keywordHandler:addKeyword({ "offer" }, StdModule.say, { npcHandler = npcHandler, text = "I sell torches, fishing rods, worms, ropes, water hoses, backpacks, apples, and maps." })
keywordHandler:addKeyword({ "name" }, StdModule.say, { npcHandler = npcHandler, text = "I am Lubo, the owner of this shop." })
keywordHandler:addKeyword({ "maps" }, StdModule.say, { npcHandler = npcHandler, text = "Oh! I'm sorry, I sold the last one just five minutes ago." })
keywordHandler:addKeyword({ "hat" }, StdModule.say, { npcHandler = npcHandler, text = "My hat? Hanna made this one for me." })
keywordHandler:addKeyword({ "finger" }, StdModule.say, { npcHandler = npcHandler, text = "Oh, you sure mean this old story about the mage Dago, who lost two fingers when he conjured a dragon." })
keywordHandler:addKeyword({ "pet" }, StdModule.say, { npcHandler = npcHandler, text = "There are some strange stories about a magicians pet names. Ask Hoggle about it." })

npcHandler:setMessage(MESSAGE_GREET, "Welcome to my adventurer shop, |PLAYERNAME|! What do you need? Ask me for a {exchange} to look at my wares.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
	{ itemName = "backpack", clientId = 2854, buy = 25 },
	{ itemName = "basket", clientId = 2855, buy = 6 },
	{ itemName = "bottle", clientId = 2875, buy = 3 },
	{ itemName = "bucket", clientId = 2873, buy = 4 },
	{ itemName = "candelabrum", clientId = 2927, buy = 8 },
	{ itemName = "candlestick", clientId = 2917, buy = 2 },
	{ itemName = "closed trap", clientId = 3481, buy = 280, sell = 75 },
	{ itemName = "crowbar", clientId = 3304, buy = 260, sell = 50 },
	{ itemName = "crusher", clientId = 46627, buy = 500 },
	{ itemName = "fishing rod", clientId = 3483, buy = 150, sell = 40 },
	{ itemName = "hand auger", clientId = 31334, buy = 25 },
	{ itemName = "machete", clientId = 3308, buy = 35, sell = 6 },
	{ itemName = "net", clientId = 31489, buy = 50 },
	{ itemName = "pick", clientId = 3456, buy = 50, sell = 15 },
	{ itemName = "present", clientId = 2856, buy = 10 },
	{ itemName = "red apple", clientId = 3585, buy = 3 },
	{ itemName = "rope", clientId = 3003, buy = 50, sell = 15 },
	{ itemName = "scythe", clientId = 3453, buy = 50, sell = 10 },
	{ itemName = "shovel", clientId = 3457, buy = 50, sell = 8 },
	{ itemName = "watch", clientId = 2906, buy = 20, sell = 6 },
	{ itemName = "waterskin of water", clientId = 2901, buy = 10, count = 1 },
	{ itemName = "wooden hammer", clientId = 3459, sell = 15 },
	{ itemName = "worm", clientId = 3492, buy = 1 },
}
-- On buy npc shop message

npcType:register(npcConfig)
