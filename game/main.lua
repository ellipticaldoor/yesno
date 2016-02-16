require "/lua/library/GUIFonts"
require "/lua/background"
require "/lua/background_two"
require "/lua/front"
require "/lua/entities"
require "/lua/entities_front"
require "/lua/talk"
require "/lua/player"

math.randomseed( os.time() )

function love.load()
    -- Variables
    actual_level = 0
    roof = 0
    gravity = 900
    
    scale = 1
    
    local f = love.graphics.newFont(love._vera_ttf, 20)
    love.graphics.setFont(f)

    love.graphics.setMode( 1280, 720, false, true, 0 )
    --love.window.setMode(1280, 720, {vsync = true, fullscreen = "false"})

    --Loading classes
    love.mouse.setVisible(false)

    background.load()
    background_two.load()
    entities.load()
    player.load()
    entities_front.load()
    front.load()
    talk.load()
end

function love.update(dt)
    UPDATE_BG(dt)
    UPDATE_BG_TWO(dt)
    UPDATE_ENTITIES(dt)
    UPDATE_PLAYER(dt)
    UPDATE_ENTITIES_FRONT(dt)
    UPDATE_FRONT(dt)
    UPDATE_TALK(dt)

    cap=love.graphics.setCaption
    local fps=love.timer.getFPS
    cap("YESno - "..fps().." FPS")
end

function love.draw()
    if scale ~= 1 then love.graphics.scale(scale) end

    DRAW_BG()
    DRAW_BG_TWO()
    DRAW_ENTITIES()
    DRAW_PLAYER()
    DRAW_ENTITIES_FRONT()
    DRAW_FRONT()
    DRAW_TALK()
end

function love.keypressed(key) -- Parar el juego al cambiar la resolución
    if key == "o" then -- Fullscreen - 16:10
        player.y = player.y - roof
        roof = 40
        player.y = player.y + roof
        scale = 1
        love.graphics.setMode( 1280, 800, true, true, 0 )
    end

    if key == "p" then -- Windowed - 16:9
        player.y = player.y - roof
        roof = 0
        player.y = player.y + roof
        scale = 1
        love.graphics.setMode( 1280, 720, false, true, 0 )
    end

    if key == "i" then -- Fullscreen - 4:3
        player.y = player.y - roof
        roof = 120 -- 75/0.625
        player.y = player.y + roof
        scale = 0.625
        love.graphics.setMode( 800, 600, false, true, 0 )
    end

    if key == "u" then -- Fullscreen - 4:3
        player.y = player.y - roof
        roof = 120 -- 75/0.625
        player.y = player.y + roof
        scale = 0.625
        love.graphics.setMode( 800, 600, false, true, 0 )
    end

    if key == "m" then -- Fullscreen - 4:3
        blackscreenshow = true
    end
    
    if key == "1" then actual_level = actual_level - 1 end

    if key == "2" then actual_level = actual_level + 1 end

    if key == 'escape' then love.event.quit() end
end
