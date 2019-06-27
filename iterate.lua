-- iterate.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 6/24/2019, 10:01:13 PM

local Iterate = {}

local Group = require('lib.stdlib.oop.group')

---enumUnitsOfPlayer
---@param player Player
---@param callback UnitCallback
function Iterate:enumUnitsOfPlayer(player, callback)
    local group = Group:create()
    group:enumUnitsOfPlayer(player)
    group:forEach(callback)
end

---iterateUnitsOfPlayer
---@param player Player
---@return fun(): Unit
function Iterate:iterateUnitsOfPlayer(player)
    local group = Group:create()
    group:enumUnitsOfPlayer(player)

    return coroutine.wrap(function()
        local unit = group:firstOf()
        if unit then
            coroutine.yield(unit)
            group:removeUnit(unit)
        end
    end)
end

return Iterate
