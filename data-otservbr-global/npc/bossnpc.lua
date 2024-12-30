local internalNpcName = "Gritua"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 73,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 1
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{text = 'I can take you to some bosses location.'}
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

-- Travel
local function addTravelKeyword(keyword, cost, destination)
	local travelKeyword = keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = 'Do you seek a passage to ' .. keyword:titleCase() .. ' for |TRAVELCOST|?', cost = cost})
		travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, cost = cost, discount = 'postman', destination = destination})
		travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'We would like to serve you some time.', reset = true})
end

addTravelKeyword('grand master oberon', 30000, Position(33363, 31342, 9)) -- {x = 32954, y = 32022, z = 6}
addTravelKeyword('drume', 30000, Position(32423, 32448, 7)) -- {x = 33176, y = 31765, z = 6}
addTravelKeyword('scarlett etzel', 30000, Position(33395, 32662, 6)) -- {x = 33479, y = 31985, z = 7}
addTravelKeyword('urmahlullu the weakened', 30000, Position(33920, 31624, 8)) -- {x = 33289, y = 32481, z = 6}
addTravelKeyword('leiden', 30000, Position(33124, 31950, 15)) --
addTravelKeyword('duke krule', 30000, Position(33457, 31495, 13))
addTravelKeyword('lord azaram', 30000, Position{x = 33423, y = 31497, z = 13})
addTravelKeyword('sir baeloc', 30000, Position{x = 33426, y = 31407, z = 13})
addTravelKeyword('count vlarkorth', 30000, Position{x = 33454, y = 31413, z = 13})
addTravelKeyword('earl osam', 30000, Position{x = 33515, y = 31444, z = 13})
--addTravelKeyword('king zelos', 30000, Position{x = 33484, y = 31546, z = 13})
addTravelKeyword('the unwelcome', 30000, Position{x = 33735, y = 31537, z = 14})
addTravelKeyword('the dread maiden', 30000, Position{x = 33738, y = 31506, z = 14})
addTravelKeyword('the fear feaster', 30000, Position{x = 33735, y = 31471, z = 14})
addTravelKeyword('the pale worm', 30000, Position{x = 33771, y = 31504, z = 14})

-- Darashia

-- Kick
keywordHandler:addKeyword({'kick'}, StdModule.kick, {npcHandler = npcHandler, destination = {Position(33498, 31711, 6)}})

-- Basic
keywordHandler:addKeyword({'bosses'}, StdModule.say, {npcHandler = npcHandler, text = 'I have you warn you, this travel is {ONE-WAY ONLY}, I cannot take you back! Tell me, wich boss would you like to defeat now? {Drume}, {Grand Master Oberon}, {Earl Osam}, {Scarlett Etzel}, {Urmahlullu the Weakened}, {Leiden}, {Duke Krule}, {Lord Azaram}, {Sir Baeloc}, {Count Vlarkorth}, {The Unwelcome}, {The Dread Maiden}, {The Fear Feaster}, {The Pale Worm}'})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = 'I am the captain of this ship.'})
keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, text = 'I am the captain of this ship.'})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, text = 'This is Venore. Where do you want to go?'})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = 'My name is Captain Pelagia from the Royal Tibia Line.'})

npcHandler:setMessage(MESSAGE_GREET, 'Hello, |PLAYERNAME|. I am Gritua, the boss slayer. Since I have already defeated some {bosses} of this world, I am able to take you to their locations.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye. Recommend us if you were satisfied with our service.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good bye then.')

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)
-- npcType registering the npcConfig table
npcType:register(npcConfig)
