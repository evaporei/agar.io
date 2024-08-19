local Base = require('base')
local Vector = require('vector')

local Blob = Base:extend()

function Blob:constructor(x, y, r)
    self.pos = Vector.new(x, y)
    self.r = r
end

function Blob:update(dt)
    if MOUSE_FOCUS then
        local mouse = Vector.new(love.mouse.getPosition())
        local vel = mouse - self.pos
        self.pos = self.pos + vel:setMag(3)
    end
end

function Blob:draw()
    love.graphics.circle('fill', self.pos.x, self.pos.y, self.r)
end

return Blob
