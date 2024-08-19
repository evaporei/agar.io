local Base = require('base')
local Vector = require('vector')

local Blob = Base:extend()

function Blob:constructor(x, y, r)
    self.pos = Vector.new(x, y)
    self.r = r
end

function Blob:update(dt)
    if MOUSE_FOCUS then
        local mouseX, mouseY = love.mouse.getPosition()
        local mouse = Vector.new(mouseX - WWIDTH / 2, mouseY - WHEIGHT / 2)
        self.pos = self.pos + mouse:setMag(3)
    end
end

function Blob:draw()
    love.graphics.circle('fill', self.pos.x, self.pos.y, self.r)
end

return Blob
