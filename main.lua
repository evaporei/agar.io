local Blob = require('blob')

WWIDTH, WHEIGHT = love.graphics.getDimensions()

local player = Blob(WWIDTH / 2, WHEIGHT / 2, 64)

local blobs = {}

local zoom = 1

MOUSE_FOCUS = false

function math.lerp(a, b, t)
    return (1 - t) * a + t * b
end

function love.load()
    love.window.setTitle('agar.io')
    -- love.graphics.setDefaultFilter('nearest', 'nearest')

    math.randomseed(os.time())

    for _ = 1, 200 do
        local x, y = math.random(-WWIDTH * 2, WWIDTH * 2), math.random(-WHEIGHT * 2, WHEIGHT * 2)
        table.insert(blobs, Blob(x, y, 16))
    end
end

function love.resize(w, h)
    WWIDTH, WHEIGHT = w, h
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
    for _, blob in pairs(blobs) do
        if not blob.deleted and player:eats(blob) then
            blob.deleted = true
        end
    end
    player:update(dt)
end

function love.draw()
    -- camera: WOW
    -- love.graphics.translate(WWIDTH / 2 - player.pos.x, WHEIGHT / 2 - player.pos.y)
    love.graphics.translate(WWIDTH / 2, WHEIGHT / 2)

    zoom = math.lerp(zoom, 64 / player.r, 0.4)
    love.graphics.scale(zoom)

    love.graphics.translate(-player.pos.x, -player.pos.y)

    player:draw()

    for _, blob in pairs(blobs) do
        if not blob.deleted then
            blob:draw()
        end
    end
end
