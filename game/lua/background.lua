background = {}

function background.load()
    -- Global
    yes = love.graphics.newImage("/images/images/yes.png")
    no = love.graphics.newImage("/images/images/no.png")
    wasd = love.graphics.newImage("/images/images/wasd.png")

    -- bg-1
    bg1_ = love.graphics.newImage("/images/bg/bg-1.png")

    -- bg
    bg = love.graphics.newImage("/images/bg/bg.png")
    background.posx = 0
    background.spd = 100
    showtuto = true

    -- bg1
    bg1 = love.graphics.newImage("/images/bg/bg1.png")
    bg1a = love.graphics.newImage("/images/bg/bg1a.png")

    background.moon_x = 1280 / 2
    background.moon_y = 720 / 2 - 40
    background.alpha = 10

    -- bg2
    bg2a = love.graphics.newImage("/images/bg/bg2a.png")
    bg2b = love.graphics.newImage("/images/bg/bg2b.png")
    
    background.bg2_alpha = 0

    showbg2b = 0

    -- bg3
    bg3a = love.graphics.newImage("/images/bg/bg3a.png")
    bg3b = love.graphics.newImage("/images/bg/bg3b.png")
    bg3c = love.graphics.newImage("/images/bg/bg3c.png")
    bg3d = love.graphics.newImage("/images/bg/bg3d.png")
    bg3e = love.graphics.newImage("/images/bg/bg3e.png")

    bg3time = 5
    bg3yn = false

    -- bg5
    bg5 = love.graphics.newImage("/images/bg/bg5.png")

    -- bg6
    bg6 = love.graphics.newImage("/images/bg/bg6.png")

    -- bg7
    bg7 = love.graphics.newImage("/images/bg/bg7.png")

    -- bg8
    bg8a = love.graphics.newImage("/images/bg/bg8a.png")
    bg8b = love.graphics.newImage("/images/bg/bg8b.png")

    bg8loop = 0

    --bg9
    eyea = love.graphics.newImage("/images/images/eyea.png")
    eyeb = love.graphics.newImage("/images/images/eyeb.png")

    -- Eyetalk
    eye1 = love.graphics.newImage("/images/talk/eye/eye1.png")
    eye2 = love.graphics.newImage("/images/talk/eye/eye2.png")

    eyelid1, eyelid2 = 0, 720/2
    eyelidspeed, eyecount = 13, 0
    eyeopen, eyetalk = true, false
    eyetime = 300

    --bg10
    bg10 = love.graphics.newImage("/images/bg/bg10.png")
    bg10b = love.graphics.newImage("/images/bg/bg10b.png")
    bg10c = love.graphics.newImage("/images/bg/bg10c.png")
    bg10d = love.graphics.newImage("/images/bg/bg10d.png")
    planet = love.graphics.newImage("/images/images/planet.png")

    bg10move, moveplayer10 = true, false
    bg10posy, bg10spd = -1440, 1
    showplanet = false
    bg10posyb, bg10posyc = -440, -940
    bg10posyd = -1200
    planetspeed = 0
    changegravity = false

    --bg11
    bg11b = love.graphics.newImage("/images/bg/bg11b.png")
    robot = love.graphics.newImage("/images/images/robot.png")
    
    bg11bshow = false
    bg11bcount = 0
    bg11talkspd = 10

    --bg12
    bg12 = love.graphics.newImage("/images/bg/bg12.png")
    showcursor, cursorcount = true, 10

    --bg13
    bg13 = love.graphics.newImage("/images/bg/bg13.png")
    bg13b = love.graphics.newImage("/images/bg/bg13b.png")
    bg13c = love.graphics.newImage("/images/bg/bg13c.png")

    bg13alpha = 0

    --bg14
    bg14 = love.graphics.newImage("/images/bg/bg14.png")
end

function background.draw()
    if actual_level == 0 then -- Front
        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(bg, background.posx , roof)
        love.graphics.draw(bg, background.posx - 1280 , roof)
    end

    if actual_level == 1 then -- Hacer que el sol suba
        love.graphics.setColor(127,140,141,255)
        love.graphics.rectangle("fill", 0, roof, 1280, 720)
    end
    
    if actual_level == 2 then
        love.graphics.setColor(52,152,219,255)
        love.graphics.rectangle("fill", 0, roof, 1280, 720)
        love.graphics.setColor(230,126,34, background.bg2_alpha)
        love.graphics.rectangle("fill", 0, roof, 1280, 720)
    end
    
    -- Revisar tiempo de refreso
    if actual_level == 3 then -- Front
        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(bg3, 0 , roof)
    end
    
    if actual_level == 4 then
        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(bg3, 0 , roof)
        love.graphics.draw(bg3a, player.x-1280, player.y-720)
        love.graphics.draw(bg3c, player.x-1280, player.y+player.h)
        love.graphics.draw(bg3b, player.x+player.w , player.y-720)
        love.graphics.draw(bg3d, player.x+player.w , player.y+player.h)
        love.graphics.setColor(236,240,241,255)
        love.graphics.rectangle("fill", player.x, roof, player.w, 720)
        love.graphics.rectangle("fill", 0, player.y, 1280, player.h)
    end
    
    if actual_level == 5 then -- Front
        love.graphics.setColor(34,157,171,255)
        love.graphics.rectangle("fill", 0, roof, 1280, 720)
    end

    if actual_level == 6 then -- Front
        love.graphics.setColor(176,91,96,255)
        love.graphics.rectangle("fill", 0, roof, 1280, 720)
    end
    
    if actual_level == 7 then -- Front
        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(bg7, 0 , roof)
    end

    if actual_level == 8 then
        love.graphics.setColor(213,189,45,255)
        love.graphics.rectangle("fill", 0, roof, 1280, 720)
    end

    if actual_level == 9 then
        love.graphics.setColor(255,255,255,255)
        if eyetalk == false then
            love.graphics.draw(eyea, 0 , roof)
            love.graphics.draw(eye1, 0 , roof)
        end
        if eyetalk == true then 
            love.graphics.draw(eyeb, 0 , roof)
            love.graphics.draw(eye2, 0 , roof)
        end

        love.graphics.setColor(33,142,163,255)
        love.graphics.rectangle("fill", 0 , eyelid1-360+roof, 1280,720)
        love.graphics.setColor(44,62,80,200)
        love.graphics.rectangle("fill", 0 , eyelid1+350+roof, 1280,10)

        love.graphics.setColor(33,142,163,255)
        love.graphics.rectangle("fill", 0 , eyelid2+roof, 1280,720)
        love.graphics.setColor(44,62,80,200)
        love.graphics.rectangle("fill", 0 , eyelid2+roof, 1280,10)
    end

    if actual_level == 10 then -- Front
        love.graphics.setColor(16,46,66,255)
        love.graphics.rectangle("fill", 0, roof, 1280, 720)
        love.graphics.setColor(255,255,255,255)
        
        love.graphics.draw(bg10d, 0 , (bg10posyd+roof+1440)*-1)
        love.graphics.draw(bg10d, 0 , (bg10posyd-2160+roof+1440)*-1)

        love.graphics.draw(bg10b, 0 , (bg10posyb+roof+1440)*-1)
        love.graphics.draw(bg10b, 0 , (bg10posyb-2160+roof+1440)*-1)

        love.graphics.draw(bg10c, 0 , (bg10posyc+1440+roof)*-1)
        love.graphics.draw(bg10c, 0 , (bg10posyc-2160+1440+roof)*-1)

        love.graphics.draw(bg10, 0 , (bg10posy+1440+roof)*-1)
        love.graphics.draw(bg10, 0 , (bg10posy-2160+1440+roof)*-1)

        if bg10spd < 1440 and showplanet == true then
            love.graphics.draw(planet, -160/2 , bg10spd/planetspeed+roof)
        end
    end

    if actual_level == 11 then -- Entities front
        love.graphics.setColor(80,159,189,255)
        love.graphics.rectangle("fill", 0, roof, 1280, 720)
    end

    if actual_level == 12 then -- Front
        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(bg12, 0 , roof)
        if showcursor == true then
            love.graphics.setColor(236,240,241,255)
            love.graphics.rectangle("fill", 0, 651+roof, 15, 30)
        end
    end
    
    if actual_level == 13 then -- Entities
        love.graphics.setColor(241,196,15,255)
        love.graphics.rectangle("fill", 0, roof, 1280, 720)
        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(bg13, 0 , roof)
        love.graphics.setColor(255,255,255,bg13alpha)
        love.graphics.draw(bg13b, 0 , roof)
        if showthing == true then
            love.graphics.setColor(44,62,80,120)
            love.graphics.rectangle("fill", 645, 520+roof, thing_w, 3)
        end
    end

    if actual_level == 14 then -- Front, Entities
        love.graphics.setColor(236,240,241,255)
        love.graphics.rectangle("fill", 0, roof, 1280, 720)

        love.graphics.setColor(255,255,255,255)
        if showthing == true then
            love.graphics.draw(bg13b, 0 , roof)
        else love.graphics.draw(bg14, 0 , roof) end
        love.graphics.draw(bg13c, 0 , roof)
    end
end

function background.math(dt)
    -- bg
    if actual_level ~= 0 then showtuto = false end
    if background.posx > 1280 then background.posx = 0 end
    background.posx = background.posx + background.spd * dt

    -- bg1
    if front.a_x > 640 then background.alpha = front.a_x * 0.2 end

    -- bg2
    if player.x > 0 then
        background.bg2_alpha = player.x * 0.2
    end
    if showbg2b < 10 then
        showbg2b = showbg2b + 0.35
        if showbg2b > 9 then showbg2b = -10 end
    end
    if actual_level == 2 then
        if player.x < 201-player.w or player.x > 201 and player.x < 538-player.w or player.x > 598 then
            ground_ = 720
        end

        if player.x > 201-player.w and player.x < 261 and player.y+player.h < 363+roof then
            ground_ = 362
        end

        if player.x > 538-player.w and player.x < 598 and player.y+player.h < 483+roof then
            ground_ = 482
        end
    end
    
    -- bg3
    if actual_level == 3 then -- Activar yes/no
        gravity = 900

        if player.x > 320-(317/2) and player.x < (320-(317/2)+317)-player.w then 
            bg3yn = true
        end
        if player.x > 960-(234/2) and player.x < (960-(234/2)+234)-player.w then 
            bg3yn = false
        end

        if bg3yn == true then
            if dt > 0 and dt < 4 then bg3time = bg3time + 1 end
            if bg3time > 3 then bg3time = 0 end
        end
        
        if bg3time == 0 then bg3 = bg3a end
        if bg3time == 1 then bg3 = bg3b end
        if bg3time == 2 then bg3 = bg3c end
        if bg3time == 3 then bg3 = bg3d end

        if player.x > 1280 then
            gravity = 900
        end
    end
    if bg3time == 5 then bg3 = bg3e end

    -- bg4
    
    if actual_level == 4 then gravity = -900 end

    -- bg5

    if actual_level == 5 then
        gravity = 900
        --if player.x < -player.w then player.x, player.y = 1280/2, 720/2 end
    end

    -- bg6
    if actual_level == 6 then
        player.h = 300
    end

    -- bg7
    if actual_level == 7 then 
        if player.x < 1280/2 then player.h = 300
        else player.h = 60 end
        --if player.x > 1280/2 and player.h == 300 then player.h = 60 end
        --if player.x < 1280/2-player.w and player.h == 60 then player.h = 300 end
    end

    -- bg8
    if actual_level > 8 then bg8loop = 2 end -- Inicializar bucle bg8

    if  actual_level == 8 then
        if player.x > 1280 and bg8loop == 0 then
            player.x = 1280/2 - (player.w/2)
            player.xvel = 0
            actual_level = 8
            bg8loop = bg8loop + 1
        end

        if player.x > 1280 and bg8loop == 1 then
            player.x = 1280/2 - (player.w/2)
            player.xvel = 0
            actual_level = 8
            bg8loop = 0
        end

        if player.x < -player.w and bg8loop == 1 then
            player.x = 1280/2 - (player.w/2)
            player.xvel = 0
            actual_level = 8
            bg8loop = bg8loop + 1
        end

        if player.x < -player.w and bg8loop == 2 then
            player.x = 1280/2 - (player.w/2)
            player.xvel = 0
            actual_level = 8
            bg8loop = bg8loop - 1
        end
    end

    -- bg9
    if actual_level == 9 then
        --blackscreenshow = true

        if eyeopen == true and eyecount < 2 and eyetime >= 300 then
            eyelid1 = eyelid1 - eyelidspeed * dt
            eyelid2 = eyelid2 + eyelidspeed * dt
            if eyelid2 > 530 then 
                eyeopen = false
                eyelidspeed = 30
            end
        end
        
        if eyeopen == false then
            if eyetime > 0 then eyetime = eyetime - 3 end
        end

        if eyeopen == false and eyetime <= 0 then
            eyelid1 = eyelid1 + eyelidspeed * dt
            eyelid2 = eyelid2 - eyelidspeed * dt
            if eyelid2 < 354 then
                eyeopen = true
                eyelidspeed = 12
                eyetalk = true
                eyecount = eyecount + 1
            end
        end

        if eyeopen == true then
            if eyetime <= 300 then eyetime = eyetime + 10 end
        end

        if eyecount == 1 and eyeopen == false and eyelid2 < 375 then blackscreenshow = true end

        if blackscreenalpha == 255 then
            player.x = 1280/2 - (player.w/2)
            screenlimit = false
            player.y, player.yvel = roof-player.h, 0
            gravity = 2.45
            actual_level = 10
        end
    end

    -- bg10
    if actual_level == 10 then
        player.x = 1280/2 - (player.w/2)
        move_y = true
        if player.y <= 720+1 - player.h + roof and moveplayer10 == false then
            screenlimit = false
            player.y, moveplayer10 = roof-player.h, true
            player.yvel = 0
        end
        
        if changegravity == true then player.y = player.y + 1 end
        if player.y > roof+player.h-10 then changegravity, gravity = false, 2 end
        --if player.y > roof and player.y < 40 then player.yvel = player.yvel + 0.01 end

        blackscreenshow = false
        controlplayer = false

        player.w, player.h = 50, 50

        -- Fondo
        if bg10posy > 720 then bg10posy = -1440 end
        if bg10posyc > 720 then bg10posyc = -1440 end
        if bg10posyb > 720 then bg10posyb = -1440 end
        if bg10posyd > 720 then bg10posyd = -1440 end
        
        bg10posy = bg10posy + bg10spd*0.5 * dt
        bg10posyc = bg10posyc + bg10spd*0.375 * dt
        bg10posyb = bg10posyb + bg10spd*0.28125 * dt
        bg10posyd = bg10posyd + bg10spd*0.2109375 * dt
        
        planetspeed = 0.5

        if bg10spd < 1700 and bg10move == true then bg10spd = bg10spd + 10 end
        if bg10spd > 1699 or bg10move == false then
            bg10move = false
            if bg10spd > -1440 then
                showplanet = true
                if bg10spd > 1440/8 then bg10spd = bg10spd - 2 end
                if bg10spd <= 1440/8 and bg10spd >= 1440/8-10 then bg10spd = bg10spd - 1 end
                if bg10spd <= (1440/8-5) then bg10spd = bg10spd - 0.5 end
            end
            if player.y+player.h/2+roof > bg10spd/planetspeed+roof then
                gravity = 1000
                blackscreenshow = true
            end
        end
        
        if blackscreenalpha == 255 and showplanet == true then
            player.x = 30
            gravity = -900
            player.y = roof-player.h
            actual_level = 11
        end
    end

    -- bg11
    bg11bcount = bg11bcount + 10*dt
    if bg11bcount > 7 then
        bg11bcount = 0
        if bg11bshow == false then bg11bshow = true else bg11bshow = false end
    end
    if actual_level == 11 then
        player.w, player.h = 60, 60
        controlplayer = true
        blackscreenshow = false
        screenlimit, player.up = true, true
        gravity = 900
    end 
    
    -- bg12
    if cursorcount < 15 then
        cursorcount = cursorcount + 17*dt
        if cursorcount > 6 then showcursor = true else showcursor = false end
        if cursorcount > 15 then cursorcount = -7 end
    end

    -- bg13
    if actual_level == 13 then
        if showthing == false then
            bg13alpha = math.random(0,255)
        end
    end

    -- bg14
    if actual_level == 14 then
        if showthing == true and player.x > 1280 then
            player.x = -player.w
            actual_level = 14
        end
    end
end

function background.rules(dt)
    
end

function UPDATE_BG(dt)
    background.rules(dt)
    background.math(dt)
end

function DRAW_BG()
    background.draw()
end

function background_nil()
    -- Global
    yes, no = nil, nil

    -- bg-1
    bg1_ = nil

    -- bg
    bg = nil

    -- bg1
    bg1 = nil
    bg1a = nil

    -- bg2
    bg2a = nil
    bg2b = nil

    -- bg3
    bg3a = nil
    bg3b = nil
    bg3c = nil
    bg3d = nil
    bg3e = nil

    -- bg5
    bg5 = nil

    -- bg6
    bg6 = nil

    -- bg7
    bg7 = nil

    -- bg8
    bg8a = nil
    bg8b = nil

    --bg9
    eyea = nil

    -- Eyetalk
    eye1 = nil
    eye2 = nil

    --bg10
    eyeb = nil

    --bg10
    bg10 = nil
    bg10b = nil
    bg10c = nil
    bg10d = nil
    planet = nil

    --bg12
    bg12 = nil
    bg12b = nil
    bg12c = nil

    --bg13
    bg13 = nil
    
    --bg11
    bg11b = nil
    robot = nil
    
    --bg15
    bg15 = nil
end
