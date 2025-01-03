local storeBox = Action()

local REWARD = {44623, 44621, 28719, 39165, 44624, 44622, 39164, 34157, 40591, 36663, 44620, 44619, 31578, 32628, 31579, 31583, 22521, 22522, 22523, 22535,
22531, 22518, 22519, 22520, 22534, 22530, 22527, 22528, 22529, 22537, 22533, 27648, 13993, 22524, 22525, 22526, 22536, 22532, 29423,
11686, 11687, 8055, 8061, 14086, 8862, 8057, 8039, 8059, 8041, 8058, 8038, 8040, 8037, 3394, 8050, 8049, 39166, 28720, 40590, 40589,
39167, 44643, 44642, 32617, 27649, 13999, 32618, 16106, 35517, 16111, 13996, 35516, 8863, 14087, 21168, 823, 
822, 821, 812, 32097, 645, 3382, 10387, 37607, 3364, 3363, 28714, 28715, 30397, 36670, 40588, 36671, 44636, 44637, 34156, 31577,
31582, 27647, 29427, 13995, 16104, 16109, 22757, 11689, 22088, 23474, 22062, 21892, 8864, 21165, 10451, 9103, 11674, 3387, 3400, 3365, 3229, 10385,
28722, 28721, 36656, 34154, 22758, 27650, 29430, 16116, 14000, 13998, 8078, 8079, 8077, 11688, 3423, 3422, 3414, 
36672, 36673, 40594, 20090, 34153, 29426, 29420, 29431, 22755, 14769, 20089, 16107, 11691, 8090, 25699, 20088, 8076, 8075, 28723, 39155, 36657,
36658, 34155, 27651, 31614, 20069, 20066, 30398, 27449, 27450, 29421, 29422, 22760, 3278, 16175, 20065, 20068, 3296, 8102, 11693, 8104, 3288, 20064, 21179, 6527,
28724, 39156, 36661, 36662, 34253, 20075, 30396, 27451, 27452, 32616, 22759, 35515, 8097, 16161, 8098, 20070, 20073, 8096, 28725, 39157, 36659, 36660, 34254, 20081, 20078, 29419,
30395, 31580, 27454, 27453, 35514, 22762, 8099, 7450, 16162, 20080, 20077, 8100, 8101, 14001, 3309, 11692, 28829, 7429, 20079, 20076, 34150, 31581, 36665, 20084, 29417, 27455, 35518, 
22866, 16164, 14246, 39159, 20087, 30393, 27456, 8023, 22867, 20085, 28717, 30399, 36668, 36669, 39162, 28826, 34152, 27457, 28825, 29425, 28716, 34151, 36674, 39163, 30400, 27458,
35521}
local JEWELS = {39693, 32925, 3043}
function storeBox.onUse(cid, item, fromPosition, itemEx, toPosition)
      local randomChance = math.random(1, #REWARD)
      doPlayerAddItem(cid, REWARD[randomChance], 1)
      doPlayerSendTextMessage(cid, 22, "You found an reward!")

local randomLoot = math.random(1,40)
    if randomLoot == 1 then
    doPlayerSendTextMessage(cid, 22, "You found an extra item!")
      local randomChance = math.random(1, #REWARD)
      doPlayerAddItem(cid, REWARD[randomChance], 1)
    end

local randomJewel = math.random(1,10)
    if randomJewel == 1 then
    doPlayerSendTextMessage(cid, 22, "You found an extra item!")
      local randomChance = math.random(1, #JEWEL)
      doPlayerAddItem(cid, JEWEL[randomChance], 1)
    end

   doSendMagicEffect(getPlayerPosition(cid), 197)
   doRemoveItem(item.uid, 1)
   return true
end

storeBox:id(12057)
storeBox:register()