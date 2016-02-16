entities = {}

function entities.load()
    -- thing
    thing_w, thing_h = 30, 30
    thing_alpha = 255
    showthing = true

    -- Beam
    beamsize = 0
end

function entities.draw()
    if actual_level == 14 then
        if showthing == true then
            love.graphics.setColor(241,196,14,thing_alpha)
            love.graphics.rectangle("fill", 645, 340+roof, thing_w, thing_h)
            love.graphics.setColor(44,62,80,120)
            --love.graphics.rectangle("fill", 645, 520+roof, thing_w, 3)
        end
    end

    if actual_level == 16 then -- Entities_Front
        -- Boss1 beam
        for i = 1, beamsize do
            love.graphics.setColor(241,196,15,255)
            --love.graphics.rectangle("fill", (50*-i)+(boss1_x+321/2)+10, (boss1_y+285/2)+40+roof, 25, 25) 
        end
    end
end

function entities.levelmath(dt)
    if actual_level == 13 or actual_level == 14 then
        thing_w, thing_h = math.random(0,40), 40

        if player.x > 645-player.w and player.x < 645+thing_w and actual_level == 14 and showthing == true then
            if player.y > 340 and player.y < 340+thing_h then
                showthing = false
                actual_level = 13
            end
        end
    end

    if actual_level == 16 then
        if boss1_x == xtemp then
            xtemp, boss1_y = math.random(700,950), math.random(10,400)
        end
        
        if boss1_x < xtemp then boss1_x = boss1_x + boss1_xspd*dt end -- Bug!!! arreglar dt
        if boss1_x > xtemp then boss1_x = boss1_x - boss1_xspd*dt end
    end
end

function entities.math(dt)
    beamsize = beamsize + 0.1
    if beamsize > 20 then beamsize = 0 end
end

function UPDATE_ENTITIES(dt)
    entities.math(dt)
    entities.levelmath(dt)
end

function DRAW_ENTITIES()
    entities.draw()
end
