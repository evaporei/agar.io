local Base = require('base')
local Vector = require('vector')

local Blob = Base:extend()

function Blob:constructor(x, y, r)
    self.pos = Vector.new(x, y)
    self.r = r
end

function Blob:draw()
    love.graphics.circle('fill', self.pos.x, self.pos.y, self.r)
end

return Blob
