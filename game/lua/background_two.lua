background_two = {}

function background_two.load()
    -- Global
    player_img = love.graphics.newImage("/images/images/player.png")

     -- Boss
    boss1 = love.graphics.newImage("/images/bosses/boss1.png")
    boss1body = love.graphics.newImage("/images/bosses/boss1body.png")
    hat = love.graphics.newImage("/images/bosses/hat.png")
    boss1_x, boss1_y = math.random(700,950), math.random(10,400)
    xtemp, ytemp = boss1_x, boss1_y
    boss1_eyelaser = true

    boss1_xspd = 100

    -- bg15
    bg15_a = love.graphics.newImage("/images/bg2/bg15/bg15a.png")
    bg15_b = love.graphics.newImage("/images/bg2/bg15/bg15b.png")
    bg15_c = love.graphics.newImage("/images/bg2/bg15/bg15c.png")

    bg15loop = 0
    bg15scanx, bg15scany = 0, 0

    -- bg16
    bg16 = love.graphics.newImage("/images/bg2/bg16/bg16.png")
    bg16_b = love.graphics.newImage("/images/bg2/bg16/bg16b.png")
    bg16_c = love.graphics.newImage("/images/bg2/bg16/bg16c.png")

    bg16x, bg16y = 0,0
    bg16count, bg16factor = 0, 80
    bg16_r, bg16_l, bg16_er, bg16_el = false, false, true, false
    bg16left = false

    -- bg17
    bg17 = love.graphics.newImage("/images/bg2/bg17.png")

    rail_y = 240-15

    level_a = true
    level_b = false
    level_c = false

    -- bg18
    bg18_a1 = love.graphics.newImage("/images/bg2/bg18/a1.png")
    bg18_a2 = love.graphics.newImage("/images/bg2/bg18/a2.png")
    bg18_a3 = love.graphics.newImage("/images/bg2/bg18/a3.png")

    bg18_b1 = love.graphics.newImage("/images/bg2/bg18/b1.png")
    bg18_b2 = love.graphics.newImage("/images/bg2/bg18/b2.png")
    bg18_b3 = love.graphics.newImage("/images/bg2/bg18/b3.png")

    bg18_c1 = love.graphics.newImage("/images/bg2/bg18/c1.png")
    bg18_c2 = love.graphics.newImage("/images/bg2/bg18/c2.png")
    bg18_c3 = love.graphics.newImage("/images/bg2/bg18/c3.png")

    bg18loop, rail = 0, -100

    -- bg19
    bg19_a = love.graphics.newImage("/images/bg2/bg19/bg19a.png")
    bg19_b = love.graphics.newImage("/images/bg2/bg19/bg19b.png")
    bg19_c = love.graphics.newImage("/images/bg2/bg19/bg19c.png")
    

    ---- Level A

    --bg20
    bg20la_a = love.graphics.newImage("/images/bg2/bg20la/bg20la_a.png")
    bg20la_b = love.graphics.newImage("/images/bg2/bg20la/bg20la_b.png")

    showbg20la, showb0player_la = 1.5, false

    --bg21
    bg21la = love.graphics.newImage("/images/bg2/bg21la.png")

    moon1 = love.graphics.newImage("/images/images/moon1.png")
    moon2 = love.graphics.newImage("/images/images/moon2.png")

    la21_x = -30

    moonalpha = 0
end

function background_two.draw()
    -- bg15
    if actual_level == 15 then
        if bg15loop == 0 then love.graphics.setColor(231,76,60,255)
        else love.graphics.setColor(60,139,190,255) end
        love.graphics.rectangle("fill", 0, roof, 1280, 720)

        love.graphics.setColor(236,240,241,255)
        if bg15loop == 0 or bg15loop == 1 then
        love.graphics.rectangle("fill", 0, ground_+1+roof, 1280, 720)
        else love.graphics.rectangle("fill", 0, 690+15+1+roof, 1280, 720) end
        
        if bg15loop == 0 then love.graphics.rectangle("fill", player.x, roof, 60, 720) end
        
        love.graphics.setColor(236,240,241,50)
        if bg15loop == 1 then
            love.graphics.rectangle("fill", bg15scanx, roof, 20, 720)
            love.graphics.rectangle("fill", 35+bg15scanx, roof, 20, 720)
        end
        if bg15loop == 2 then
            love.graphics.rectangle("fill", 0, bg15scany+roof, 1280, 20)
            love.graphics.rectangle("fill", 0, 35+bg15scany+roof, 1280, 20)
        end
    end  

    -- bg16
    if actual_level == 16 then -- Entities, Entities_front
        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(bg16, bg16x , bg16y+roof)
        love.graphics.draw(bg16_b, 0 , roof)

         -- levelthigns
        -- wall
        love.graphics.setColor(52,73,94,100)
        --love.graphics.rectangle("fill", 650, roof, 30, 200)
        --love.graphics.rectangle("fill", 650, 720-200+roof, 30, 200)
    end

    -- bg17
    if actual_level == 17 then -- front
        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(bg17, 0 , roof)

        -- Borde de los railes
        love.graphics.setLineWidth(2)
        love.graphics.setColor(236,240,241,255)
        love.graphics.rectangle("line", 1280/2+1, 240-14+roof, 1280/2, 13)
        love.graphics.rectangle("line", 1280/2+1, 480-14+roof, 1280/2, 13)
        love.graphics.rectangle("line", 1280/2+1, 720-14+roof, 1280/2, 13)

        -- Iluminar posición
        love.graphics.setColor(236,240,241,255)
        if player.x > 1280/2 then
            love.graphics.rectangle("fill", player.x, rail_y+roof, player.w, 13)
        end

        if player.x > 1280/2-player.w and player.x < 1280/2 then
            love.graphics.rectangle("fill", 1280/2, rail_y+roof, player.w, 15)
        end
    end

    if actual_level == 18 then -- front
        if level_a == true then
            love.graphics.setColor(34,157,171,255)
            love.graphics.rectangle("fill", 0, roof, 1280, 720)

            love.graphics.setColor(255,255,255,255)
            if bg18loop == 0 then love.graphics.draw(bg18_a1, 0 , roof) end
            if bg18loop == 1 then love.graphics.draw(bg18_a2, 0 , roof) end
            if bg18loop == 2 then love.graphics.draw(bg18_a3, 0 , roof) end
        end

        if level_b == true then
            love.graphics.setColor(239,206,152,255)
            love.graphics.rectangle("fill", 0, roof, 1280, 720)
            
            love.graphics.setColor(255,255,255,255)
            if bg18loop == 0 then love.graphics.draw(bg18_b1, 0 , roof) end
            if bg18loop == 1 then love.graphics.draw(bg18_b2, 0 , roof) end
            if bg18loop == 2 then love.graphics.draw(bg18_b3, 0 , roof) end
        end

        if level_c == true then
            love.graphics.setColor(176,91,96,255)
            love.graphics.rectangle("fill", 0, roof, 1280, 720)

            love.graphics.setColor(255,255,255,255)
            if bg18loop == 0 then love.graphics.draw(bg18_c1, 0 , roof) end
            if bg18loop == 1 then love.graphics.draw(bg18_c2, 0 , roof) end
            if bg18loop == 2 then love.graphics.draw(bg18_c3, 0 , roof) end
        end
        
        --rail
        if player.y ~= roof then
            love.graphics.setColor(236,240,241,255)
            love.graphics.rectangle("fill", player.x, rail-1, player.w, 15)
        end
        
        if player.y > 247 and player.y < 500 then
            love.graphics.setLineWidth(2)
            love.graphics.setColor(236,240,241,255)
            love.graphics.rectangle("line", -1, rail, 1284, 13)
        end
    end

    if actual_level == 19 then
        if level_a == true then
            love.graphics.setColor(34,157,171,255)
            love.graphics.rectangle("fill", 0, roof, 1280, 720)
        end

        if level_b == true then
            love.graphics.setColor(239,206,152,255)
            love.graphics.rectangle("fill", 0, roof, 1280, 720)
        end

        if level_c == true then
            love.graphics.setColor(176,91,96,255)
            love.graphics.rectangle("fill", 0, roof, 1280, 720)
        end
    end

    -- Level A
    if level_a == true then
        if actual_level == 20 then
            love.graphics.setColor(236,240,241,255)
            love.graphics.rectangle("fill", 0, roof, 1280, 720)

            love.graphics.setColor(255,255,255,255)
            love.graphics.draw(bg20la_a, (player.x * 0.08/2), roof)
            
            if showbg20la > 4 then
                love.graphics.setColor(255,255,255,255)
                love.graphics.draw(bg20la_b, -(player.x * 0.08/2), roof)
            end

            love.graphics.setColor(52,73,94,255)
            love.graphics.rectangle("fill", 0, ground, 1280, 720)
        end

        if actual_level == 21 then
            --love.graphics.setColor(213,218,220,255)
            love.graphics.setColor(236,240,241,255)
            --love.graphics.setColor(0,0,0,255)
            love.graphics.rectangle("fill", 0, roof, 1280, 720)

            -- bg
            love.graphics.setColor(255,255,255,255)
            love.graphics.draw(bg21la, 0, roof)
            
            -- Moon
            love.graphics.setColor(255,255,255,255)
            --love.graphics.draw(moon1, 1280-(720/10)-300, (720/10)+roof)
            love.graphics.setColor(255,255,255,moonalpha)
            love.graphics.draw(moon2, 1280-(720/10)-300, (720/10)+roof)
        end

        if actual_level == 22 then

        end
    end

    -- Level B
    if level_b == true then
        if actual_level == 20 then
            love.graphics.setColor(239,206,152,255)
            love.graphics.rectangle("fill", 0, roof, 1280, 720)
        end
    end

    -- Level C
    if level_c == true then
        if actual_level == 20 then
            love.graphics.setColor(176,91,96,255)
            love.graphics.rectangle("fill", 0, roof, 1280, 720)
        end
    end
end

function background_two.math(dt)
    if actual_level >= 15 and actual_level <= 18 then
        activategun = true else activategun = false
    end
    ----

    if actual_level == 15 then
        if bg15scany < 720 then
            bg15scany = bg15scany + 140 else bg15scany = 0
        end

        if bg15scanx < 1280 then
            bg15scanx = bg15scanx + 140 else bg15scanx = 0
        end


        if bg15loop == 0 then ground_ = 660 end
        if bg15loop == 1 then ground_ = 660+30 end
        if bg15loop == 2 then
            --[[if player.x > 119 and player.x < 1160 and player.y+player.h < 690+15+roof then
                ground_ = 690+15
            else ground_ = 528 end]]--
            if player.x < 120-player.w or player.x > 1161 then
                ground_ = 690+15
            end

            if player.x > 120-player.w and player.x < 1161 and player.y+player.h < 528+roof then
                ground_ = 528
            end
        end

        if player.x > 1280 and bg15loop < 2 then
            player.x = -player.w
            bg15loop = bg15loop + 1
        end
    end

    if actual_level == 16 then
        activategun = true
        ground_ = 720

        player.yvel = 0
        player.y = 720/2 - player.h/2 + roof

        -- Move backgroud
        if bg16_er == true then
            bg16x, bg16y = bg16x-(16/bg16factor),bg16y-(9/bg16factor)

            if bg16x < -1279 then bg16_er, bg16_r = false, true end
        end

        if bg16_r == true then
            bg16y = bg16y+(9/bg16factor)
            if bg16y > -1 then bg16_r, bg16_el = false, true end
        end

        if bg16_el == true then
            bg16x, bg16y = bg16x+(16/bg16factor),bg16y-(9/bg16factor)
            if bg16x > -1 then bg16_el, bg16_l = false, true end
        end

        if bg16_l == true then
            bg16y = bg16y+(9/bg16factor)
            if bg16y > -1 then bg16_l, bg16_er = false, true end
        end
    end

    if actual_level == 17 then
        player.w, player.h = 60, 60
        player.dead = false

        player.alpha, player.alphab = 255, 255
        player.alphac = 255
        
        if level_a == true and player.x > 1280 then player.x, actual_level = -30, 18 end
        if level_b == true and player.x > 1280 then player.x, actual_level = -150, 18 end
        if level_b == true and player.x > 1280 then player.x, actual_level = -60*3, 18 end

        if player.x > 1280/2-player.w then player.spd = 15000 else player.spd = 4000 end

        -- fondo
        if player.y > 0+roof and player.y < 240+roof then rail_y, level_a = 240-15, true
        else level_a = false end

        if player.y > 240+roof and player.y < 480+roof then rail_y, level_b = 480-15, true
        else level_b = false end

        if player.y > 480+roof and player.y < 720+roof  then rail_y, level_c = 720-15, true
        else level_c = false end

        if player.y == 0+roof and player.x > 1280/2-player.w then player.y = 239-15-player.h+roof end
        if player.x > 1280/2-player.w and player.y > roof and player.y < 240+roof then
            player.y = 239-15-player.h+roof
            player.yvel = 0
            level_a = true
        end

        if player.x > 1280/2-player.w and player.y > 240+roof and player.y < 480+roof then
            player.y = 479-15-player.h+roof
            player.yvel = 0
            level_b = true
        end

        if player.x > 1280/2-player.w and player.y > 480+roof and player.y < 720+roof then
            player.y = 719-15-player.h+roof
            player.yvel = 0
        end
    end

    if actual_level > 18 then bg18loop = 2 end
    if actual_level == 18 then
        showplayer = true
        player.spd = 15000

        if level_a == true then
            if player.x > 1280 and bg18loop == 0 then player.x, bg18loop = -90, 1 end
            if player.x > 1280 and bg18loop == 1 then player.x, bg18loop = -60*3, 2 end
            if player.x > 1280 and bg18loop == 2 then 
                showplayer = false
                player.x, actual_level = -60, 19
            end
        end
        
        if level_b == true then
            if player.x > 1280 and bg18loop == 0 then player.x, bg18loop = -180, 1 end
            if player.x > 1280 and bg18loop == 1 then player.x, bg18loop = -210, 2 end
            if player.x > 1280 and bg18loop == 2 then player.x, actual_level = -60, 19 end
        end

        if level_c == true then
            if player.x > 1280 and bg18loop == 0 then player.x, bg18loop = -90, 1 end
            if player.x > 1280 and bg18loop == 1 then player.x, bg18loop = -30, 2 end
            --if player.x > 1280 and bg18loop == 2 then player.x, actual_level = -60, 19 end
        end

        if bg18loop == 0 then
            if level_a == true then
                player.w, player.h = 30, 30
                player.y, player.yvel = 720/2-((30+15)/2)+roof, 0
            end

           if level_b == true then
                player.w, player.h = 150, 150
                player.y, player.yvel = 720/2-((150)/2)+roof, 0
            end

            if level_c == true then
                player.w, player.h = 60*3, 60*3
                player.y, player.yvel = 720/2-((60*3+15)/2)+roof, 0
            end

            if player.x < -player.w and level_a == true then player.y = 239-15-player.h+roof end
            if player.x < -player.w and level_b == true then player.y = 479-15-player.h+roof end
            if player.x < -player.w and level_c == true then player.y = 719-15-player.h+roof end
        end

        if bg18loop == 1 then
            if level_a == true then
                player.w, player.h = 90, 90
                player.y, player.yvel = 720/2-((90+15)/2)+roof, 0
            end

           if level_b == true then
                player.w, player.h = 180, 180
                player.y, player.yvel = 720/2-((180+15)/2)+roof, 0
            end

            if level_c == true then
                player.w, player.h = 90, 90
                player.y, player.yvel = 720/2-((90+15)/2)+roof, 0
            end
        end
        
        if bg18loop == 2 then
            if level_a == true then
                player.w, player.h = 60*3, 60*3
                player.y, player.yvel = 720/2-((60*3+15)/2)+roof, 0
            end

            if level_b == true then
                player.w, player.h = 210, 210
                player.y, player.yvel = 720/2-((210+15)/2)+roof, 0
            end

            if level_c == true then
                player.w, player.h = 30, 30
                player.y, player.yvel = 720/2-((30+15)/2)+roof, 0
            end            
        end

        -- loop
        if player.x > 1280 and bg18loop == 0 then
            player.x = -player.w
            actual_level = 18
            bg18loop = bg18loop + 1
        end

        if player.x < -player.w and bg18loop > 0 then
            actual_level = 18
            player.x = 1280
            bg18loop = bg18loop - 1
        end

        rail = player.y+player.h+2
    end

    if actual_level == 19 then
        player.w, player.h = 60, 60
        player.spd = 8000

        if player.y == 720/2 - player.h/2 + roof then showplayer = true end

        if player.x <= -60 then player.y = 720/2 - player.h/2 + roof end
        
        player.yvel = 0
        player.y = 720/2 - player.h/2 + roof

        if player.x < -player.w then showplayer = false else showplayer = true end
        
        showb0player_la = false
        if player.x > 1280 then
            if level_a == true then player.w, player.h = 30, 30 end
            player.y = 720 - player.h
            player.x, actual_level = -30, 20
        end
    end

    -- Level A
    if level_a == true then
        if actual_level == 20 then
            player.spd = 2000

            if player.x * 0.08 > 30 then
                player.w, player.h = player.x * 0.08, player.x * 0.08
            else player.w, player.h = 30, 30 end
            
            if showbg20la < 20 then
                showbg20la = showbg20la + 0.15
                if showbg20la >= 20 then showbg20la = 0 end
            end

            if player.x > -player.w then
                ground_ =  720 - (player.x * 0.08) - 1
                player.y, player.yvel = ground - player.h, 0
            else ground_ = 720 end

            if player.x > 1280 and bg18loop == 2 then player.x, actual_level = -60, 21 end
        end

        if actual_level == 21 then
            player.w, player.h = 60, 60
            
            if la21_x < 1280 then la21_x = la21_x + 10 else la21_x = -60 end

            if player.x < 1280/2-(60*3)/2 or player.x > ((1280/2-(60*3)/2)+60*3)-60 then
                ground_ = 720-60 -2
            else ground_ = 720+60+2 end
            
            --if player.x < 1280/2-(60*3)/2 then controlplayer = true else controlplayer = false end

            if player.y == 720+2 then player.x = -60 end

            if player.x > 0 then moonalpha = player.x * 0.2 end
        end

        if actual_level == 22 then
            ground_ = 720

        end
    end
end

function UPDATE_BG_TWO(dt)
    background_two.math(dt)
end

function DRAW_BG_TWO()
    background_two.draw()
end
