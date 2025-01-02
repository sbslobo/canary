local supremeCube = Action()

local config = {
    price = 50000,
    storage = 9007,
    cooldown = 120,
    restrictedZones = {
        {
            from = {x = 32416, y = 32509, z = 7},
            to = {x = 32461, y = 32540, z = 7}
        },
        {
            from = {x = 32456, y = 32507, z = 6},
            to = {x = 32462, y = 32509, z = 6}
        },
        {
            from = {x = 33354, y = 31309, z = 9},
            to = {x = 33373, y = 31347, z = 9}
        },
        {
            from = {x = 33407, y = 32638, z = 6},
            to = {x = 33385, y = 32667, z = 6}
        },
        {
            from = {x = 33903, y = 31613, z = 8},
            to = {x = 33930, y = 31663, z = 8}
        },
        {
            from = {x = 33171, y = 31945, z = 15},  -- Zona de Leiden
            to = {x = 33132, y = 31963, z = 15}
        },	
        {
            from = {x = 31940, y = 32313, z = 10},  -- Zona de Brain Head
            to = {x = 31965, y = 32337, z = 10}
        },
        {
            from = {x = 33466, y = 31463, z = 13},  -- Zona de Duke Krule
            to = {x = 33447, y = 31503, z = 13}
        },	
        {
            from = {x = 33434, y = 31463, z = 13},  -- Zona de Lord Azaram
            to = {x = 33414, y = 31503, z = 13}
        },	
        {
            from = {x = 33433, y = 31403, z = 13},  -- Zona de Sir Baeloc
            to = {x = 33413, y = 31451, z = 13}
        },
        {
            from = {x = 33433, y = 31403, z = 13},  -- Zona de Sir Baeloc
            to = {x = 33413, y = 31451, z = 13}
        },		
        {
            from = {x = 33464, y = 31404, z = 13},  -- Zona de Count Vlakorth
            to = {x = 33446, y = 31448, z = 13}
        },	
        {
            from = {x = 33477, y = 31428, z = 13},  -- Zona de Earl Osam
            to = {x = 33525, y = 31447, z = 13}
        },	
        {
            from = {x = 33431, y = 31537, z = 13},  -- Zona de King Zelos
            to = {x = 33498, y = 31556, z = 13}
        },
        {
            from = {x = 33696, y = 31529, z = 14},  -- Zona de The Unwelcome
            to = {x = 33720, y = 31548, z = 14}
        },	
        {
            from = {x = 33699, y = 31493, z = 14},  -- Zona de The Dread Maiden
            to = {x = 33724, y = 31514, z = 14}
        },	
        {
            from = {x = 33703, y = 31462, z = 14},  -- Zona de The Fear Feaster
            to = {x = 33720, y = 31478, z = 14}
        },	
        {
            from = {x = 33793, y = 31495, z = 14},  -- Zona de The Pale Worm
            to = {x = 33818, y = 31516, z = 14}
        },
        {
            from = {x = 33701, y = 31176, z = 7},  -- Zona de Tentuglys
            to = {x = 33737, y = 31191, z = 7}
        },	
        {
            from = {x = 33704, y = 31176, z = 6},  -- Zona de Tentuglys
            to = {x = 33738, y = 31191, z = 6}
        },			
    },
    towns = {
        { name = "Ab'Dendriel", teleport = Position(32732, 31634, 7) },
        { name = "Ankrahmun", teleport = Position(33194, 32853, 8) },
        { name = "Carlin", teleport = Position(32360, 31782, 7) },
        { name = "Darashia", teleport = Position(33213, 32454, 1) },
        { name = "Edron", teleport = Position(33217, 31814, 8) },
        { name = "Farmine", teleport = Position(33023, 31521, 11) },
        { name = "Gray Beach", teleport = Position(33447, 31323, 9) },
        { name = "Issavi", teleport = Position(33921, 31477, 5) },
        { name = "Kazordoon", teleport = Position(32649, 31925, 11) },
        { name = "Krailos", teleport = Position(33657, 31665, 8) },
        { name = "Liberty Bay", teleport = Position(32317, 32826, 7) },
        { name = "Marapur", teleport = Position(33842, 32853, 7) },
        { name = "Port Hope", teleport = Position(32594, 32745, 7) },
        { name = "Rathleton", teleport = Position(33594, 31899, 6) },
        { name = "Roshamuul", teleport = Position(33513, 32363, 6) },
        { name = "Svargrond", teleport = Position(32212, 31132, 7) },
        { name = "Thais", teleport = Position(32369, 32241, 7) },
        { name = "Venore", teleport = Position(32957, 32076, 7) },
        { name = "Yalahar", teleport = Position(32787, 31276, 7) }, 
    },
    bosses = {
		{ name = "Brain Head", teleport = Position(31977, 32327, 10) },
		{ name = "Count Vlakorth", teleport = Position(33457 ,31411, 13) },
		{ name = "Dream Courts", teleport = Position(32208, 32036, 13) },
		{ name = "Drume", teleport = Position(32423, 32448, 7) },
		{ name = "Duke Krule", teleport = Position(33457 ,31494 ,13) },
		{ name = "Earl Osam", teleport = Position(33518, 31441, 13) },
		{ name = "Faceless Bane", teleport = Position(33640, 32561, 13) },
		{ name = "Gnomprona", teleport = Position(33533, 32877, 14) },
		{ name = "Grand Master Oberon", teleport = Position(33366, 31342, 9) },
		{ name = "King Zelos", teleport = Position(33488, 31546, 13) },
		{ name = "Leiden", teleport = Position(33135, 31955, 15) },
		{ name = "Lord Azaram", teleport = Position(33423, 31494, 13) },
		{ name = "Rotten Blood", teleport = Position(34081, 31995, 13) },
		{ name = "Scarlett Etzel", teleport = Position(33395, 32668, 6) },
		{ name = "Sir Baeloc", teleport = Position(33426 ,31411, 13) },
		{ name = "Soulwar", teleport = Position(33621, 31429, 10) },
		{ name = "Tentugly's Head", teleport = Position(33793, 31389, 6) },
		{ name = "The Dread Maiden", teleport = Position(33746, 31506, 14) },
		{ name = "The Fear Feaster", teleport = Position(33746, 31506, 14) },
		{ name = "The Pale Worm", teleport = Position(33776, 31504, 14) },
		{ name = "The Unwelcome", teleport = Position(33744, 31537, 14) },
		{ name = "Timira", teleport = Position(33807, 32700, 8) },
		{ name = "Urmahlullu the Weakened", teleport = Position(33920, 31624, 8) }		
    }
}

local function isInRestrictedZone(position)
    for _, zone in pairs(config.restrictedZones) do
        local from, to = zone.from, zone.to
        if position.x >= math.min(from.x, to.x) and position.x <= math.max(from.x, to.x) and 
           position.y >= math.min(from.y, to.y) and position.y <= math.max(from.y, to.y) and 
           position.z == from.z then
            return true
        end
    end
    return false
end

local function supremeCubeMessage(player, effect, message)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, message)
    player:getPosition():sendMagicEffect(effect)
end

local function openTownSelectionWindow(player)
    local window = ModalWindow({
        title = "Select a Town",
        message = "Choose your destination - Price: " .. config.price .. " gold."
    })

    for _, town in pairs(config.towns) do
        window:addChoice(town.name, function(player, button, choice)
            if button.name == "Select" then
                player:teleportTo(town.teleport, true)
                supremeCubeMessage(player, CONST_ME_TELEPORT, "Welcome to " .. town.name)
                player:setStorageValue(config.storage, os.time() + config.cooldown)
            end
            return true
        end)
    end

    window:addButton("Select")
    window:addButton("Close")
    window:setDefaultEnterButton(0)
    window:setDefaultEscapeButton(1)
    window:sendToPlayer(player)
end

local function openBossSelectionWindow(player)
    local window = ModalWindow({
        title = "Select a Boss",
        message = "Choose your destination from the options below. Each teleportation will cost you " .. config.price .. " gold. Make sure you are prepared for the journey and meet all the requirements!"
    })

    for _, boss in pairs(config.bosses) do
        window:addChoice(boss.name, function(player, button, choice)
            if button.name == "Select" then
                player:teleportTo(boss.teleport, true)
                player:setStorageValue(config.storage, os.time() + config.cooldown)
            end
            return true
        end)
    end

    window:addButton("Select")
    window:addButton("Close")
    window:setDefaultEnterButton(0)
    window:setDefaultEscapeButton(1)
    window:sendToPlayer(player)
end

local function teleportToHouse(player)
    local house = player:getHouse()
    if house then
        player:teleportTo(house:getExitPosition(), true)
        supremeCubeMessage(player, CONST_ME_TELEPORT, "Welcome home!")
    else
        supremeCubeMessage(player, CONST_ME_POFF, "You do not own a house.")
    end
end

function supremeCube.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local inPz = player:getTile():hasFlag(TILESTATE_PROTECTIONZONE)
    local inFight = player:isPzLocked() or player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT)

    if isInRestrictedZone(player:getPosition()) then
        supremeCubeMessage(player, CONST_ME_POFF, "You can't use the cube in this area.")
        return false
    end

    if not inPz and inFight then
        supremeCubeMessage(player, CONST_ME_POFF, "You can't use this when you're in a fight.")
        return false
    end

    if player:getStorageValue(config.storage) > os.time() then
        local remainingTime = player:getStorageValue(config.storage) - os.time()
        supremeCubeMessage(player, CONST_ME_POFF, "You can use it again in: " .. remainingTime .. " seconds.")
        return false
    end

    local mainWindow = ModalWindow({
        title = "Supreme Cube",
        message = "Choose an option:"
    })

    mainWindow:addChoice("Towns", function(player, button, choice)
        if button.name == "Select" then
            openTownSelectionWindow(player)
        end
        return true
    end)

    mainWindow:addChoice("Bosses", function(player, button, choice)
        if button.name == "Select" then
            openBossSelectionWindow(player)
        end
        return true
    end)
	
	mainWindow:addChoice("House", function(player, button, choice)
        if button.name == "Select" then
            teleportToHouse(player)
        end
        return true
    end)

    mainWindow:addButton("Select")
    mainWindow:addButton("Close")
    mainWindow:setDefaultEnterButton(0)
    mainWindow:setDefaultEscapeButton(1)
    mainWindow:sendToPlayer(player)

    return true
end

supremeCube:id(31633)
supremeCube:register()
