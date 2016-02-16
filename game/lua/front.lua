front = {}

function front.load()
    -- Objeto 'a'
    front.a_w = 60
    front.a_h = 60
    front.a_x = 640
    front.a_y = 720 - front.a_w + roof

    -- shadowplayer
    shadowplayer = false
    splayer_x, splayer_y = 0, 0
    splayer_w, splayer_h = 0, 0

    -- Blackscreen
    blackscreenshow = false
    blackscreenalpha = 0
end

function front.draw()
    if actual_level == 0 or actual_level == 11 then
        love.graphics.setColor(236,240,241,50)
        love.graphics.rectangle("fill", 29, roof, player.w+2, 720)
    end

    if actual_level == -1 or actual_level == -2 then
        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(bg1_, 0 , roof)
    end
    
    if actual_level == 0 then
        love.graphics.setColor(255,255,255,255)
        if showtuto == true then love.graphics.draw(wasd, 0 , roof) end
    end

    if actual_level == 1 then -- Hacer que el sol suba
        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(bg1a, 0 , roof)
        love.graphics.setColor(255, 255, 255, background.bg2_alpha)
        love.graphics.draw(bg1, 0, roof)
    end

    if actual_level == 2 then
        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(bg2a, 0 , roof)
        love.graphics.setColor(255, 255, 255, 255)
        if showbg2b > -1 then love.graphics.draw(bg2b, 0, roof) end
    end

    if actual_level == 3 then
        love.graphics.setColor(236,240,241,50)
        love.graphics.rectangle("fill",320-(317/2),roof,317,720)
        love.graphics.rectangle("fill",960-(234/2),roof,234,720)
        love.graphics.setColor(236,240,241,255)
        love.graphics.draw(yes, 320-(317/2) , roof + (720/2)-(147/2))
        love.graphics.draw(no, 960-(234/2) , roof + (720/2)-(147/2))
    end

    if actual_level == 5 then
        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(bg5, 0 , roof)
    end

    if actual_level == 6 then
        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(bg6, 0 , roof)
    end

    if actual_level == 7 then
        love.graphics.setColor(236,240,241,80)
        love.graphics.rectangle("fill", (1280/2)-(player.w/2), roof, player.w, 720)
    end

    if actual_level == 8 then
        love.graphics.setColor(255,255,255,255)
        if bg8loop == 0 or bg8loop == 2 then love.graphics.draw(bg8a, 0 , roof) end
        if bg8loop == 1 then love.graphics.draw(bg8b, 0 , roof) end
    end

    if actual_level == 13 then
        love.graphics.setColor(241,196,15,200)
        if showthing == true then
            love.graphics.rectangle("fill", 73, roof, 4, 720)
            love.graphics.rectangle("fill", 206, roof, 12, 720)
            love.graphics.rectangle("fill", 278, roof, 2, 720)
            love.graphics.rectangle("fill", 1036, roof, 92, 720)
            love.graphics.rectangle("fill", 1182, roof, 10, 720)
            love.graphics.rectangle("fill", 1240, roof, 40, 720)
        else
            love.graphics.rectangle("fill", 32, roof, 36, 720)
            love.graphics.rectangle("fill", 115, roof, 86, 720)
            love.graphics.rectangle("fill", 263, roof, 11, 720)
            love.graphics.rectangle("fill", 1020, roof, 8, 720)
            love.graphics.rectangle("fill", 1131, roof, 6, 720)
            love.graphics.rectangle("fill", 1197, roof, 3, 720)
        end
    end

    if actual_level == 14 then
        love.graphics.setColor(0,0,0,200)
        if showthing == true then
            love.graphics.rectangle("fill", 32, roof, 36, 720)
            love.graphics.rectangle("fill", 115, roof, 86, 720)
            love.graphics.rectangle("fill", 263, roof, 11, 720)
            love.graphics.rectangle("fill", 1020, roof, 8, 720)
            love.graphics.rectangle("fill", 1131, roof, 6, 720)
            love.graphics.rectangle("fill", 1197, roof, 3, 720)
        else
            love.graphics.rectangle("fill", 73, roof, 4, 720)
            love.graphics.rectangle("fill", 206, roof, 12, 720)
            love.graphics.rectangle("fill", 278, roof, 2, 720)
            love.graphics.rectangle("fill", 1036, roof, 92, 720)
            love.graphics.rectangle("fill", 1182, roof, 10, 720)
            love.graphics.rectangle("fill", 1240, roof, 40, 720)
        end
    end

    if actual_level == 15 then
        love.graphics.setColor(255,255,255,255)
        if bg15loop == 0 then love.graphics.draw(bg15_a, 0 , roof) end
        if bg15loop == 1 then love.graphics.draw(bg15_b, 0 , roof) end
        if bg15loop == 2 then love.graphics.draw(bg15_c, 0 , roof) end
    end

    if actual_level == 16 then -- Entities, Entities_front
        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(bg16_c, 0 , roof)
    end

    if actual_level == 19 then
        love.graphics.setColor(255,255,255,255)
        if level_a == true then love.graphics.draw(bg19_a, 0, roof) end
        if level_b == true then love.graphics.draw(bg19_b, 0, roof) end
        if level_c == true then love.graphics.draw(bg19_c, 0, roof) end
    end
    
    -- dead
    if player.dead == true then
        love.graphics.setColor(0,0,0,100)
        love.graphics.rectangle("fill", 0, roof, 1280, 720)
    end
    
    -- shadowplayer
    if shadowplayer == true then
        love.graphics.setColor(192, 57, 43, 255)
        love.graphics.rectangle("fill", (player.x)+splayer_x, (player.y)+splayer_y, (player.w)+splayer_w, (player.h)+splayer_h)
        love.graphics.setColor(230,126,34,25)
        love.graphics.rectangle("fill", (player.x)+splayer_x, (player.y)+splayer_y, (5)+splayer_w, (player.h)+splayer_h)
        love.graphics.rectangle("fill", (player.x+(player.w-5))+splayer_x, (player.y)+splayer_y, (5)+splayer_w, (player.h)+splayer_h)
        love.graphics.rectangle("fill", (player.x)+splayer_x, (player.y)+splayer_y, (5)+splayer_w, (player.h)+splayer_h)
        love.graphics.rectangle("fill", (player.x)+splayer_x, (player.y)+splayer_y, (player.w)+splayer_w, (5)+splayer_h)
        love.graphics.rectangle("fill", (player.x)+splayer_x, (player.y+(player.h-5))+splayer_y, (player.w)+splayer_w, (5)+splayer_h)
        love.graphics.setColor(52,152,219,255)
        love.graphics.rectangle("fill", (player.x+player.w/3)+splayer_x, (player.y+player.h/3)+splayer_y,
            (player.w/3)+splayer_w, (player.h/3)+splayer_h)
    end

    -- Blackscreen
    love.graphics.setColor(0,0,0,blackscreenalpha)
    love.graphics.rectangle("fill", 0 , roof, 1280,720)
    
    -- Resfix
    love.graphics.setColor(0, 0, 0, 255)
    love.graphics.rectangle("fill", 0, 0, 1280, roof)
    love.graphics.rectangle("fill", 0, 720+roof, 1280, roof)
end

function front.math(dt)
    -- Blackscreen
    if blackscreenshow == true then
        if blackscreenalpha < 255 then blackscreenalpha = blackscreenalpha + 1 end
    elseif blackscreenshow == false then
        if blackscreenalpha > 0 then blackscreenalpha = blackscreenalpha - 1 end
    end
end

function UPDATE_FRONT(dt)
    front.math(dt)
end

function DRAW_FRONT()
    front.draw()
end
