player = {}

function player.load()
    ground_ = 720
    ground = ground_ + roof

    player.x, player.y = 30, 0 + roof
    player.xvel, player.yvel = 0, 0
    player.fr, player.spd = 5, 4000
    player.w, player.h = 60, 60
    player.alpha, player.alphab = 255, 255
    player.alphac = 255
    player.gun_x, player.gun_y = 0, 0
    move_x, move_y = true, true
    player.up = true

    leveladd_l, leveladd_r = true, true

    -- Propiedades del personaje
    showplayer, controlplayer = true, true
    activategun, player.firerate = false, 50
    player.damage, player.dead = false, false
    screenlimit = true
end

function player.draw()
    if activategun == true then
        if player.gun_x ~= 0 then 
            love.graphics.setColor(236,240,241,255)
            love.graphics.rectangle("fill", player.x+20+player.gun_x, player.y+20, player.w-40, player.h-40)
            love.graphics.setLineWidth(3)
            love.graphics.setColor(52,73,94,255)
            love.graphics.rectangle("line", player.x+20+player.gun_x, player.y+20, player.w-40, player.h-40)
        end

        if player.gun_y ~= 0 then
            love.graphics.setColor(236,240,241,255)
            love.graphics.rectangle("fill", player.x+20, player.y+20+player.gun_y, player.w-40, player.h-40)
            love.graphics.setLineWidth(3)
            love.graphics.setColor(52,73,94,255)
            love.graphics.rectangle("line", player.x+20, player.y+20+player.gun_y, player.w-40, player.h-40)
        end
    end

    if showplayer == true then
        love.graphics.setColor(236, 240, 241,player.alphab)
        love.graphics.setLineWidth(20)
        love.graphics.rectangle("line", player.x+10, player.y+10, player.w-20, player.h-20)
        love.graphics.setColor(52,73,94,player.alphac)
        love.graphics.setLineWidth(6)
        love.graphics.rectangle("line", player.x+3, player.y+3, player.w-6, player.h-6)
        love.graphics.setColor(52,152,219,player.alpha)
        love.graphics.rectangle("fill", player.x+20, player.y+20, player.w-40, player.h-40)
        love.graphics.setColor(44,62,80,255)
        love.graphics.setLineWidth(1)
        love.graphics.rectangle("line", player.x, player.y, player.w, player.h)
        love.graphics.rectangle("line", player.x+6, player.y+6, player.w-12, player.h-12)
        love.graphics.setLineWidth(2)
        love.graphics.rectangle("line", player.x+20, player.y+20, player.w-40, player.h-40)
    end
end

function player.life()
    if player.damage == true then
        if player.alpha > 0 then player.alpha = player.alpha - 2 end -- Bug dt
        if player.alpha < 0 then player.alpha = 0 end

        if player.alpha == 0 and player.alphab > 0 then player.alphab = player.alphab - 1.5 end
        if player.alphab < 0 then player.alphab = 0 end

        if player.alphab == 0 and player.alphac > 0 then player.alphac = player.alphac - 1 end
        if player.alphac < 0 then player.alphac = 0 end

        if player.alphac == 0 then
            player.dead = true
        end
    end
end

function player.math(dt)
    player.alpha2 = player.alpha - 215
    if player.alpha2 < 0 then player.alpha2 = 0 end

    if actual_level ~= 16 then player.damage = false end
end

function player.physics(dt)
    -- Velocidad
    
    if move_x == true then player.x = player.x + player.xvel * dt end
    
    if screenlimit == true then
        if (player.y + player.yvel * dt) <= ground+1 - player.h then
            move_y = true
        else
            move_y = false
            player.y = ground - player.h
            player.yvel = 0
        end

        if (player.y + player.yvel * dt) >= roof-1 then
            move_y = true
        else
            move_y = false
            player.y = roof
            player.yvel = 0
        end
    end

    if move_y == true then player.y = player.y + player.yvel * dt end
    
    -- Fricción
    player.xvel = player.xvel * (1 - math.min(dt * player.fr, 1))
    
    -- Gravedad
    --if player.y ~= roof then
        player.yvel = player.yvel + gravity * dt
    --end
end

function player.move(dt)
    if controlplayer == true then
        --if player.y >= roof or player.y >= 720-player.h+roof then move_y = false end

        --if love.keyboard.isDown('d') and player.xvel < player.spd then
    	if love.keyboard.isDown('d') and player.xvel < player.spd then
            player.xvel = player.xvel + player.spd * dt
        end
        if love.keyboard.isDown('a') and player.xvel > -player.spd then
    		player.xvel = player.xvel - player.spd * dt
        end
        if love.keyboard.isDown('w') and player.yvel > -player.spd and player.up == true then
            player.yvel = player.yvel - player.spd*2 * dt
        end
        if love.keyboard.isDown('s') and player.yvel > -player.spd then
            player.yvel = player.yvel + player.spd*2 * dt
        end
        --[[if love.keyboard.isDown('w') or love.keyboard.isDown('s') and player.yvel > -player.spd then
            if gravity > 0 then player.yvel = player.yvel - player.spd * dt
            else player.yvel = player.yvel + player.spd * dt end
        end]]--

        -- Gun  -- Bug dt
        if love.keyboard.isDown('right') then
            player.gun_x = player.gun_x + 0.01
        end

        if love.keyboard.isDown('left') then
            player.gun_x = player.gun_x - 0.01
        end

        if love.keyboard.isDown('down') then
            player.gun_y = player.gun_y + 0.01
        end

        if love.keyboard.isDown('up') then
            player.gun_y = player.gun_y - 0.01
        end

        if player.gun_x > 0 then
            if player.gun_x < 1000 then player.gun_x = player.gun_x + player.firerate end
            if player.gun_x >= 1000 then player.gun_x = 0 end
        end

        if player.gun_x < 0 then
            if player.gun_x > -1000 then player.gun_x = player.gun_x - player.firerate end
            if player.gun_x <= -1000 then player.gun_x = 0 end
        end
        
        if player.gun_y > 0 then
            if player.gun_y < 1000 then player.gun_y = player.gun_y + player.firerate end
            if player.gun_y >= 1000 then player.gun_y = 0 end
        end

        if player.gun_y < 0 then
            if player.gun_y > -1000 then player.gun_y = player.gun_y - player.firerate end
            if player.gun_y <= -1000 then player.gun_y = 0 end
        end

        -- Fin bug dt
    end
end

function player.screenlimit()
    ground = ground_ + roof

    if screenlimit == true then
        if player.x < -player.w then
    		player.x = 1280 - 5
    		player.xvel = 0
            if leveladd_l == true then actual_level = actual_level - 1 end
        end
        if player.x > 1280 then
            player.x = -player.w + 5
            player.xvel = 0
            if leveladd_r == true then actual_level = actual_level + 1 end
        end
        if player.y < roof then 
            player.y = roof
            player.yvel = 0
        end
        if player.y + player.h > ground then 
    		player.y = ground - player.h
    		player.yvel = 0
        end
    end

    if -- Limitar cambio de nivel izquierda
        actual_level == -1 or
        actual_level == 9 or
        actual_level == 11 or
        actual_level == 15 or
        actual_level == 16 or
        actual_level == 17
    then
        leveladd_l = false
    else leveladd_l = true end

    if -- Limitar cambio de nivel derecha
        actual_level == 16 or
        actual_level == 9
    then
        leveladd_r = false
    else leveladd_r = true end
end

function UPDATE_PLAYER(dt)
    player.life()
    player.math()
    player.screenlimit()
    player.physics(dt)
    player.move(dt, key)
end

function DRAW_PLAYER()
    player.draw()
end
