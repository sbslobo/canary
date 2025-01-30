local config = {
    actionId = 18562, -- on lever
    lever = {
        left = 2772,
        right = 2773
    },
    playItem = {
        itemId = 49699, -- item required to pull lever
        count = 1
    },
    rouletteOptions = {
        rareItemChance_broadcastThreshold = 500,
        ignoredItems = {1617}, -- if you have tables/counters/other items on the roulette tiles, add them here
        winEffects = {CONST_ANI_FIRE, CONST_ME_SOUND_YELLOW, CONST_ME_SOUND_PURPLE, CONST_ME_SOUND_BLUE, CONST_ME_SOUND_WHITE}, -- first effect needs to be distance effect
        effectDelay = 333,
        spinTime = {min = 8, max = 12}, -- seconds
        spinSlowdownRamping = 5,
        rouletteStorage = 48550 -- required storage to avoid player abuse (if they logout/die before roulette finishes.. they can spin again for free)
    },
    prizePool = {
		{itemId = 43864, count = {1, 1}, chance = 10000},
		{itemId = 43864, count = {1, 1}, chance = 10000},			
		{itemId = 44623, count = {1, 1}, chance = 10000},
		{itemId = 44621, count = {1, 1}, chance = 10000},
		{itemId = 28719, count = {1, 1}, chance = 10000},
		{itemId = 39165, count = {1, 1}, chance = 10000},
		{itemId = 44624, count = {1, 1}, chance = 10000},
		{itemId = 44622, count = {1, 1}, chance = 10000},
		{itemId = 39164, count = {1, 1}, chance = 10000},
		{itemId = 34157, count = {1, 1}, chance = 10000},
		{itemId = 40591, count = {1, 1}, chance = 10000},
		{itemId = 36663, count = {1, 1}, chance = 10000},
		{itemId = 44620, count = {1, 1}, chance = 10000},
		{itemId = 44619, count = {1, 1}, chance = 10000},
		{itemId = 31578, count = {1, 1}, chance = 10000},
		{itemId = 32628, count = {1, 1}, chance = 10000},
		{itemId = 31579, count = {1, 1}, chance = 10000},
		{itemId = 31583, count = {1, 1}, chance = 10000},
		{itemId = 22521, count = {1, 1}, chance = 10000},
		{itemId = 22522, count = {1, 1}, chance = 10000},
		{itemId = 22523, count = {1, 1}, chance = 10000},
		{itemId = 22535, count = {1, 1}, chance = 10000},
		{itemId = 22531, count = {1, 1}, chance = 10000},
		{itemId = 22518, count = {1, 1}, chance = 10000},
		{itemId = 22519, count = {1, 1}, chance = 10000},
		{itemId = 22520, count = {1, 1}, chance = 10000},
		{itemId = 22534, count = {1, 1}, chance = 10000},
		{itemId = 22530, count = {1, 1}, chance = 10000},
		{itemId = 22527, count = {1, 1}, chance = 10000},
		{itemId = 22528, count = {1, 1}, chance = 10000},
		{itemId = 22529, count = {1, 1}, chance = 10000},
		{itemId = 22537, count = {1, 1}, chance = 10000},
		{itemId = 22533, count = {1, 1}, chance = 10000},
		{itemId = 27648, count = {1, 1}, chance = 10000},
		{itemId = 13993, count = {1, 1}, chance = 10000},
		{itemId = 22524, count = {1, 1}, chance = 10000},
		{itemId = 22525, count = {1, 1}, chance = 10000},
		{itemId = 22526, count = {1, 1}, chance = 10000},
		{itemId = 22536, count = {1, 1}, chance = 10000},
		{itemId = 22532, count = {1, 1}, chance = 10000},
		{itemId = 29423, count = {1, 1}, chance = 10000},
		{itemId = 11686, count = {1, 1}, chance = 10000},
		{itemId = 11687, count = {1, 1}, chance = 10000},
		{itemId = 14086, count = {1, 1}, chance = 10000},
		{itemId = 8862, count = {1, 1}, chance = 10000},
		{itemId = 39166, count = {1, 1}, chance = 10000},
		{itemId = 28720, count = {1, 1}, chance = 10000},
		{itemId = 40590, count = {1, 1}, chance = 10000},
		{itemId = 40589, count = {1, 1}, chance = 10000},
		{itemId = 39167, count = {1, 1}, chance = 10000},
		{itemId = 44643, count = {1, 1}, chance = 10000},
		{itemId = 44642, count = {1, 1}, chance = 10000},
		{itemId = 32617, count = {1, 1}, chance = 10000},
		{itemId = 27649, count = {1, 1}, chance = 10000},
		{itemId = 13999, count = {1, 1}, chance = 10000},
		{itemId = 32618, count = {1, 1}, chance = 10000},
		{itemId = 16106, count = {1, 1}, chance = 10000},
		{itemId = 35517, count = {1, 1}, chance = 10000},
		{itemId = 16111, count = {1, 1}, chance = 10000},
		{itemId = 13996, count = {1, 1}, chance = 10000},
		{itemId = 35516, count = {1, 1}, chance = 10000},
		{itemId = 8863, count = {1, 1}, chance = 10000},
		{itemId = 14087, count = {1, 1}, chance = 10000},
		{itemId = 21168, count = {1, 1}, chance = 10000},
		{itemId = 32097, count = {1, 1}, chance = 10000},
		{itemId = 645, count = {1, 1}, chance = 10000},
		{itemId = 3382, count = {1, 1}, chance = 10000},
		{itemId = 10387, count = {1, 1}, chance = 10000},
		{itemId = 37607, count = {1, 1}, chance = 10000},
		{itemId = 3364, count = {1, 1}, chance = 10000},
		{itemId = 3363, count = {1, 1}, chance = 10000},
		{itemId = 28714, count = {1, 1}, chance = 10000},
		{itemId = 28715, count = {1, 1}, chance = 10000},
		{itemId = 30397, count = {1, 1}, chance = 10000},
		{itemId = 36670, count = {1, 1}, chance = 10000},
		{itemId = 40588, count = {1, 1}, chance = 10000},
		{itemId = 36671, count = {1, 1}, chance = 10000},
		{itemId = 44636, count = {1, 1}, chance = 10000},
		{itemId = 44637, count = {1, 1}, chance = 10000},
		{itemId = 34156, count = {1, 1}, chance = 10000},
		{itemId = 31577, count = {1, 1}, chance = 10000},
		{itemId = 31582, count = {1, 1}, chance = 10000},
		{itemId = 27647, count = {1, 1}, chance = 10000},
		{itemId = 29427, count = {1, 1}, chance = 10000},
		{itemId = 13995, count = {1, 1}, chance = 10000},
		{itemId = 16104, count = {1, 1}, chance = 10000},
		{itemId = 16109, count = {1, 1}, chance = 10000},
		{itemId = 22757, count = {1, 1}, chance = 10000},
		{itemId = 11689, count = {1, 1}, chance = 10000},
		{itemId = 22088, count = {1, 1}, chance = 10000},
		{itemId = 23474, count = {1, 1}, chance = 10000},
		{itemId = 22062, count = {1, 1}, chance = 10000},
		{itemId = 21892, count = {1, 1}, chance = 10000},
		{itemId = 8864, count = {1, 1}, chance = 10000},
		{itemId = 21165, count = {1, 1}, chance = 10000},
		{itemId = 10451, count = {1, 1}, chance = 10000},
		{itemId = 9103, count = {1, 1}, chance = 10000},
		{itemId = 11674, count = {1, 1}, chance = 10000},
		{itemId = 3400, count = {1, 1}, chance = 10000},
		{itemId = 3365, count = {1, 1}, chance = 10000},
		{itemId = 10385, count = {1, 1}, chance = 10000},
		{itemId = 28722, count = {1, 1}, chance = 10000},
		{itemId = 28721, count = {1, 1}, chance = 10000},
		{itemId = 36656, count = {1, 1}, chance = 10000},
		{itemId = 34154, count = {1, 1}, chance = 10000},
		{itemId = 22758, count = {1, 1}, chance = 10000},
		{itemId = 27650, count = {1, 1}, chance = 10000},
		{itemId = 29430, count = {1, 1}, chance = 10000},
		{itemId = 16116, count = {1, 1}, chance = 10000},
		{itemId = 14000, count = {1, 1}, chance = 10000},
		{itemId = 13998, count = {1, 1}, chance = 10000},
		{itemId = 8078, count = {1, 1}, chance = 10000},
		{itemId = 8079, count = {1, 1}, chance = 10000},
		{itemId = 8077, count = {1, 1}, chance = 10000},
		{itemId = 11688, count = {1, 1}, chance = 10000},
		{itemId = 3423, count = {1, 1}, chance = 10000},
		{itemId = 3422, count = {1, 1}, chance = 10000},
		{itemId = 3414, count = {1, 1}, chance = 10000},	
		{itemId = 36672, count = {1, 1}, chance = 10000},
		{itemId = 36673, count = {1, 1}, chance = 10000},
		{itemId = 40594, count = {1, 1}, chance = 10000},
		{itemId = 20090, count = {1, 1}, chance = 10000},
		{itemId = 34153, count = {1, 1}, chance = 10000},
		{itemId = 29426, count = {1, 1}, chance = 10000},
		{itemId = 29420, count = {1, 1}, chance = 10000},
		{itemId = 29431, count = {1, 1}, chance = 10000},
		{itemId = 22755, count = {1, 1}, chance = 10000},
		{itemId = 14769, count = {1, 1}, chance = 10000},
		{itemId = 20089, count = {1, 1}, chance = 10000},
		{itemId = 16107, count = {1, 1}, chance = 10000},
		{itemId = 11691, count = {1, 1}, chance = 10000},
		{itemId = 8090, count = {1, 1}, chance = 10000},
		{itemId = 25699, count = {1, 1}, chance = 10000},
		{itemId = 20088, count = {1, 1}, chance = 10000},
		{itemId = 8076, count = {1, 1}, chance = 10000},
		{itemId = 8075, count = {1, 1}, chance = 10000},
		{itemId = 28723, count = {1, 1}, chance = 10000},
		{itemId = 39155, count = {1, 1}, chance = 10000},
		{itemId = 36657, count = {1, 1}, chance = 10000},
		{itemId = 36658, count = {1, 1}, chance = 10000},
		{itemId = 34155, count = {1, 1}, chance = 10000},
		{itemId = 27651, count = {1, 1}, chance = 10000},
		{itemId = 31614, count = {1, 1}, chance = 10000},
		{itemId = 20069, count = {1, 1}, chance = 10000},
		{itemId = 20066, count = {1, 1}, chance = 10000},
		{itemId = 30398, count = {1, 1}, chance = 10000},
		{itemId = 27449, count = {1, 1}, chance = 10000},
		{itemId = 27450, count = {1, 1}, chance = 10000},
		{itemId = 29421, count = {1, 1}, chance = 10000},
		{itemId = 29422, count = {1, 1}, chance = 10000},
		{itemId = 22760, count = {1, 1}, chance = 10000},
		{itemId = 3278, count = {1, 1}, chance = 10000},
		{itemId = 16175, count = {1, 1}, chance = 10000},
		{itemId = 20065, count = {1, 1}, chance = 10000},
		{itemId = 20068, count = {1, 1}, chance = 10000},
		{itemId = 3296, count = {1, 1}, chance = 10000},
		{itemId = 8102, count = {1, 1}, chance = 10000},
		{itemId = 11693, count = {1, 1}, chance = 10000},
		{itemId = 8104, count = {1, 1}, chance = 10000},
		{itemId = 20064, count = {1, 1}, chance = 10000},
		{itemId = 6527, count = {1, 1}, chance = 10000},
		{itemId = 28724, count = {1, 1}, chance = 10000},
		{itemId = 39156, count = {1, 1}, chance = 10000},
		{itemId = 36661, count = {1, 1}, chance = 10000},
		{itemId = 36662, count = {1, 1}, chance = 10000},
		{itemId = 34253, count = {1, 1}, chance = 10000},
		{itemId = 20075, count = {1, 1}, chance = 10000},
		{itemId = 30396, count = {1, 1}, chance = 10000},
		{itemId = 27451, count = {1, 1}, chance = 10000},
		{itemId = 27452, count = {1, 1}, chance = 10000},
		{itemId = 32616, count = {1, 1}, chance = 10000},
		{itemId = 22759, count = {1, 1}, chance = 10000},
		{itemId = 35515, count = {1, 1}, chance = 10000},
		{itemId = 8097, count = {1, 1}, chance = 10000},
		{itemId = 16161, count = {1, 1}, chance = 10000},
		{itemId = 8098, count = {1, 1}, chance = 10000},
		{itemId = 20070, count = {1, 1}, chance = 10000},
		{itemId = 20073, count = {1, 1}, chance = 10000},
		{itemId = 8096, count = {1, 1}, chance = 10000},
		{itemId = 28725, count = {1, 1}, chance = 10000},
		{itemId = 39157, count = {1, 1}, chance = 10000},
		{itemId = 36659, count = {1, 1}, chance = 10000},
		{itemId = 36660, count = {1, 1}, chance = 10000},
		{itemId = 34254, count = {1, 1}, chance = 10000},
		{itemId = 20081, count = {1, 1}, chance = 10000},
		{itemId = 20078, count = {1, 1}, chance = 10000},
		{itemId = 29419, count = {1, 1}, chance = 10000},
		{itemId = 30395, count = {1, 1}, chance = 10000},
		{itemId = 31580, count = {1, 1}, chance = 10000},
		{itemId = 27454, count = {1, 1}, chance = 10000},
		{itemId = 27453, count = {1, 1}, chance = 10000},
		{itemId = 35514, count = {1, 1}, chance = 10000},
		{itemId = 22762, count = {1, 1}, chance = 10000},
		{itemId = 8099, count = {1, 1}, chance = 10000},
		{itemId = 7450, count = {1, 1}, chance = 10000},
		{itemId = 16162, count = {1, 1}, chance = 10000},
		{itemId = 20080, count = {1, 1}, chance = 10000},
		{itemId = 20077, count = {1, 1}, chance = 10000},
		{itemId = 8100, count = {1, 1}, chance = 10000},
		{itemId = 8101, count = {1, 1}, chance = 10000},
		{itemId = 14001, count = {1, 1}, chance = 10000},
		{itemId = 3309, count = {1, 1}, chance = 10000},
		{itemId = 11692, count = {1, 1}, chance = 10000},
		{itemId = 28829, count = {1, 1}, chance = 10000},
		{itemId = 7429, count = {1, 1}, chance = 10000},
		{itemId = 20079, count = {1, 1}, chance = 10000},
		{itemId = 20076, count = {1, 1}, chance = 10000},
		{itemId = 34150, count = {1, 1}, chance = 10000},
		{itemId = 31581, count = {1, 1}, chance = 10000},
		{itemId = 36665, count = {1, 1}, chance = 10000},
		{itemId = 20084, count = {1, 1}, chance = 10000},
		{itemId = 29417, count = {1, 1}, chance = 10000},
		{itemId = 27455, count = {1, 1}, chance = 10000},
		{itemId = 35518, count = {1, 1}, chance = 10000},
		{itemId = 22866, count = {1, 1}, chance = 10000},
		{itemId = 16164, count = {1, 1}, chance = 10000},
		{itemId = 14246, count = {1, 1}, chance = 10000},
		{itemId = 39159, count = {1, 1}, chance = 10000},
		{itemId = 20087, count = {1, 1}, chance = 10000},
		{itemId = 30393, count = {1, 1}, chance = 10000},
		{itemId = 27456, count = {1, 1}, chance = 10000},
		{itemId = 8023, count = {1, 1}, chance = 10000},
		{itemId = 22867, count = {1, 1}, chance = 10000},
		{itemId = 20085, count = {1, 1}, chance = 10000},
		{itemId = 28717, count = {1, 1}, chance = 10000},
		{itemId = 30399, count = {1, 1}, chance = 10000},
		{itemId = 36668, count = {1, 1}, chance = 10000},
		{itemId = 36669, count = {1, 1}, chance = 10000},
		{itemId = 39162, count = {1, 1}, chance = 10000},
		{itemId = 28826, count = {1, 1}, chance = 10000},
		{itemId = 34152, count = {1, 1}, chance = 10000},
		{itemId = 27457, count = {1, 1}, chance = 10000},
		{itemId = 28825, count = {1, 1}, chance = 10000},
		{itemId = 29425, count = {1, 1}, chance = 10000},
		{itemId = 28716, count = {1, 1}, chance = 10000},
		{itemId = 34151, count = {1, 1}, chance = 10000},
		{itemId = 36674, count = {1, 1}, chance = 10000},
		{itemId = 39163, count = {1, 1}, chance = 10000},
		{itemId = 30400, count = {1, 1}, chance = 10000},
		{itemId = 27458, count = {1, 1}, chance = 10000},
		{itemId = 35521, count = {1, 1}, chance = 10000},
		{itemId = 43865, count = {1, 1}, chance = 10000}, -- Grand Sanguine Blade
		{itemId = 43871, count = {1, 1}, chance = 10000}, -- Grand Sanguine Razor
		{itemId = 43870, count = {1, 1}, chance = 10000}		 
    },
    roulettePositions = { -- hard-coded to 7 positions.
        Position(1086, 1028, 5),
        Position(1087, 1028, 5),
        Position(1088, 1028, 5),
        Position(1089, 1028, 5), -- position 4 in this list is hard-coded to be the reward location, which is the item given to the player
        Position(1090, 1028, 5),
        Position(1091, 1028, 5),
        Position(1092, 1028, 5),
    }
}

local chancedItems = {} -- used for broadcast. don't edit

local function resetLever(position)
    local lever = Tile(position):getItemById(config.lever.right)
    lever:transform(config.lever.left)
end

local function updateRoulette(newItemInfo)
    local positions = config.roulettePositions
    for i = #positions, 1, -1 do
        local item = Tile(positions[i]):getTopVisibleThing()
        if item and item:getId() ~= Tile(positions[i]):getGround():getId() and not table.contains(config.rouletteOptions.ignoredItems, item:getId()) then
            if i ~= 7 then
                item:moveTo(positions[i + 1])
            else
                item:remove()
            end
        end
    end
    if ItemType(newItemInfo.itemId):getCharges() then
        local item = Game.createItem(newItemInfo.itemId, 1, positions[1])
        item:setAttribute("charges", newItemInfo.count)
    else
        Game.createItem(newItemInfo.itemId, newItemInfo.count, positions[1])
    end
end

local function clearRoulette(newItemInfo)
    local positions = config.roulettePositions
    for i = #positions, 1, -1 do
        local item = Tile(positions[i]):getTopVisibleThing()
        if item and item:getId() ~= Tile(positions[i]):getGround():getId() and not table.contains(config.rouletteOptions.ignoredItems, item:getId()) then
            item:remove()
        end
        if newItemInfo == nil then
            positions[i]:sendMagicEffect(CONST_ME_POFF)
        else
            if ItemType(newItemInfo.itemId):getCharges() then
                local item = Game.createItem(newItemInfo.itemId, 1, positions[i])
                item:setAttribute("charges", newItemInfo.count)
            else
                Game.createItem(newItemInfo.itemId, newItemInfo.count, positions[i])
            end
        end
    end
end

local function chanceNewReward()
    local newItemInfo = {itemId = 0, count = 0}
    
    local rewardTable = {}
    while #rewardTable < 1 do
        for i = 1, #config.prizePool do
            if config.prizePool[i].chance >= math.random(10000) then
                rewardTable[#rewardTable + 1] = i
            end
        end
    end
    
    local rand = math.random(#rewardTable)
    newItemInfo.itemId = config.prizePool[rewardTable[rand]].itemId
    newItemInfo.count = math.random(config.prizePool[rewardTable[rand]].count[1], config.prizePool[rewardTable[rand]].count[2])
    chancedItems[#chancedItems + 1] = config.prizePool[rewardTable[rand]].chance
    
    return newItemInfo
end

local function initiateReward(leverPosition, effectCounter)
    if effectCounter < #config.rouletteOptions.winEffects then
        effectCounter = effectCounter + 1
        if effectCounter == 1 then
            config.roulettePositions[1]:sendDistanceEffect(config.roulettePositions[4], config.rouletteOptions.winEffects[1])
            config.roulettePositions[7]:sendDistanceEffect(config.roulettePositions[4], config.rouletteOptions.winEffects[1])
        else
            for i = 1, #config.roulettePositions do
                config.roulettePositions[i]:sendMagicEffect(config.rouletteOptions.winEffects[effectCounter])
            end
        end
        if effectCounter == 2 then
            local item = Tile(config.roulettePositions[4]):getTopVisibleThing()
            local newItemInfo = {itemId = item:getId(), count = item:getCount()}
            clearRoulette(newItemInfo)
        end
        addEvent(initiateReward, config.rouletteOptions.effectDelay, leverPosition, effectCounter)
        return
    end
    resetLever(leverPosition)
end

local function rewardPlayer(playerId, leverPosition)
    local player = Player(playerId)
    if not player then
        return
    end
    
    local item = Tile(config.roulettePositions[4]):getTopVisibleThing()
    
    if ItemType(item:getId()):getCharges() then
        local addedItem = player:addItem(item:getId(), 1, true)
        addedItem:setAttribute("charges", item:getCharges())
    else
        player:addItem(item:getId(), item:getCount(), true)
    end

    player:setStorageValue(config.rouletteOptions.rouletteStorage, -1)
    if chancedItems[#chancedItems - 3] <= config.rouletteOptions.rareItemChance_broadcastThreshold then
        Game.broadcastMessage("The player " .. player:getName() .. " has won " .. item:getName() .. " from the roulette!", MESSAGE_EVENT_ADVANCE)
    end
end

local function roulette(playerId, leverPosition, spinTimeRemaining, spinDelay)
    local player = Player(playerId)
    if not player then
        resetLever(leverPosition)
        return
    end
    
    local newItemInfo = chanceNewReward()
    updateRoulette(newItemInfo)
    
    if spinTimeRemaining > 0 then
        spinDelay = spinDelay + config.rouletteOptions.spinSlowdownRamping
        addEvent(roulette, spinDelay, playerId, leverPosition, spinTimeRemaining - (spinDelay - config.rouletteOptions.spinSlowdownRamping), spinDelay)
        return
    end
    
    initiateReward(leverPosition, 0)
    rewardPlayer(playerId, leverPosition)
end

local casinoRoulette = Action()

function casinoRoulette.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if item:getId() == config.lever.right then
        player:sendTextMessage(MESSAGE_STATUS, "Casino Roulette is currently in progress. Please wait.")
        return true
    end
    
    if player:getItemCount(config.playItem.itemId) < config.playItem.count then
        if player:getStorageValue(config.rouletteOptions.rouletteStorage) < 1 then
            player:sendTextMessage(MESSAGE_STATUS, "Casino Roulette requires " .. config.playItem.count .. " " .. (ItemType(config.playItem.itemId):getName()) .. " to use.")
            return true
        end
        -- player:sendTextMessage(MESSAGE_STATUS, "Free Spin being used due to a previous unforeseen error.")
    end
    
    item:transform(config.lever.right)
    clearRoulette()
    chancedItems = {}
    
    player:removeItem(config.playItem.itemId, config.playItem.count)
    player:setStorageValue(config.rouletteOptions.rouletteStorage, 1)
    
    local spinTimeRemaining = math.random((config.rouletteOptions.spinTime.min * 1000), (config.rouletteOptions.spinTime.max * 1000))
    roulette(player:getId(), toPosition, spinTimeRemaining, 100)
    return true
end

casinoRoulette:aid(config.actionId)
casinoRoulette:register()


local disableMovingItemsToRoulettePositions = MoveEvent()

disableMovingItemsToRoulettePositions.onAddItem = function(moveitem, tileitem, position, item, count, fromPosition, toPosition)
    for v, k in pairs(config.roulettePositions) do
        if toPosition == k then
            return false
        end
    end
    return true
end

disableMovingItemsToRoulettePositions:position(config.roulettePositions)
disableMovingItemsToRoulettePositions:register()