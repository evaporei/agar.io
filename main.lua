local Blob = require('blob')

local wwidth, wheight = love.graphics.getDimensions()

local player = Blob(wwidth / 2, wheight / 2, 64)

local blobs = {}

MOUSE_FOCUS = false

function love.load()
    love.window.setTitle('agar.io')
    -- love.graphics.setDefaultFilter('nearest', 'nearest')

    math.randomseed(os.time())

    for _ = 1, 10 do
        table.insert(blobs, Blob(math.random(wwidth), math.random(wheight), 16))
    end
end

function love.resize(w, h)
    wwidth, wheight = w, h
end

function love.mousefocus(f)
    MOUSE_FOCUS = f
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.update(dt)
    player:update(dt)
end

function love.draw()
    player:draw()

    for _, blob in pairs(blobs) do
        blob:draw()
    end
end
