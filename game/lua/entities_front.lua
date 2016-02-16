entities_front = {}

function entities_front.load()
    eyelaser_x = 0
    alphalaser, alphalaser_ = 0, 0
end

function entities_front.draw()
    if actual_level == 11 then -- Background
        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(robot, 0+196 , roof)
        if bg11bshow == true then love.graphics.draw(bg11b, 0+196 , roof) end
    end
    
    if actual_level == 13 and showthing == true then
        love.graphics.setColor(241,196,14,thing_alpha)
        love.graphics.rectangle("fill", 645, 340+roof, thing_w, thing_h)
    end

    if actual_level == 16 and boss1_eyelaser == true then -- Entities
        -- Boss1
        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(boss1, boss1_x , boss1_y+roof)
        love.graphics.draw(hat, boss1_x-10, boss1_y-260+roof)
        love.graphics.draw(boss1body, boss1_x+120, boss1_y+265+roof)

        -- Boss1 eye laser
        love.graphics.setColor(231,76,60,alphalaser)
        love.graphics.setLine(5, "smooth")
        love.graphics.line(x1, y1, x2, y2)
        love.graphics.setColor(231,76,60,alphalaser_)
        love.graphics.line(x1_, y1_, x2_, y2_)
    end

    -- Level A
    if level_a == true then
        if actual_level == 21 then
            -- Land
            love.graphics.setColor(236,240,241,65)
            love.graphics.rectangle("fill", 0, 720-61+roof, 1280/2-(60*3)/2, 61)
            love.graphics.rectangle("fill", (1280/2-(60*3)/2)+60*3+1, 720-61+roof, 1280/2-(60*3)/2, 61)
            
            love.graphics.setColor(241,196,60,100)
            --love.graphics.rectangle("fill", la21_x, 720-61+roof, 30, 61)
            
            love.graphics.setColor(255,255,255,255)
            love.graphics.draw(player_img, 551, 659+roof)
            love.graphics.draw(player_img, 611, 659+roof)
            love.graphics.draw(player_img, 671, 659+roof)
        end
    end
end

function entities_front.levelmath(dt)
    if actual_level == 16 then
        x1, y1 = player.x+(player.w/2), player.y+(player.h/2)
        x1_, y1_ = player.x+(player.w/2), player.y+(player.h/2)

        x2, y2 = (boss1_x+321/2)+30, (boss1_y+285/2)-75+roof
        x2_, y2_ = ((boss1_x+321/2)+30)-90, (boss1_y+285/2)-75+roof

        slope = ((y2-y1) / (x2-x1))
        slope_ = ((y2_-y1_) / ((x2_)-x1_))

        y1b = (slope*(x2-660)-y2)*-1
        y1b_ = (slope_*(x2_-660)-y2_)*-1
        
        if y1b < 200+roof or y1b > 720+roof-200 then -- Revisar alphalaser
            x1, y1 = 660, y1b
            alphalaser = 0
        else y1, alphalaser = player.y+(player.h/2), 180 end
        
        if y1b_ < 200+roof or y1b_ > 720+roof-200 then
            x1_, y1_ = 660, y1b_
            alphalaser_ = 0
        else y1_, alphalaser_ = player.y+(player.h/2), 180 end

        -- Damage
        if alphalaser > 0 or alphalaser_ > 0 then
            player.damage = true
        else player.damage = false end
    end
end

function entities_front.math(dt)

end

function UPDATE_ENTITIES_FRONT(dt)
    entities_front.math(dt)
    entities_front.levelmath(dt)
end

function DRAW_ENTITIES_FRONT()
    entities_front.draw()
end
