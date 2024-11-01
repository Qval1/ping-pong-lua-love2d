_G.love = require("love")

function love.load()    
    love.graphics.setBackgroundColor(244 / 255, 162 / 255, 97 / 255)

    _G.player = {}
    player.x = 20
    player.y = 115
    player.xaccel = 0
    player.yaccel = 0
    player.score = 0

    _G.bot = {}
    bot.x = 760
    bot.y = 115
    bot.xaccel = 0
    bot.yaccel = 0
    bot.score = 0

    _G.ball = {}
    ball.x = 390
    ball.y = 165
    ball.xaccel = -133
    ball.yaccel = 0    
    
end

function love.update(dt)
    player.xaccel = 0
    player.yaccel = 0
      if love.keyboard.isDown("s") then
        player.yaccel = 100
        player.y = player.y + (player.yaccel * dt)

      elseif love.keyboard.isDown("w") then
        player.yaccel = -100
        player.y = player.y + (player.yaccel * dt)
      end

      if player.y > 290 then
        player.y = 290

      elseif player.y < 0 then
        player.y = 0
      end

      if bot.y > 290 then
        bot.y = 290

      elseif bot.y < 0 then
        bot.y = 0
      end

      ball.x = ball.x + (ball.xaccel * dt)
      ball.y = ball.y + (ball.yaccel * dt)

      if ball.x < 40 and ball.y < player.y + 60 and ball.y > player.y - 10 then
        ball.xaccel = 133
        ball.yaccel = player.yaccel
      elseif ball.x < 20 then
        player.y = 115
        bot.y = 115
        ball.x =  390
        ball.y = 195
        ball.xaccel = -133
        bot.score = bot.score + 1

      elseif ball.x > 750 and ball.y < bot.y + 60 and ball.y > bot.y - 10 then
        ball.xaccel = -133
        ball.yaccel = bot.yaccel
      elseif ball.x > 770 then
        player.y = 115
        bot.y = 115
        ball.x =  390
        ball.y = 195
        ball.xaccel = -133
        player.score = player.score + 1
      end

      if ball.y < 0 then
        ball.yaccel = -ball.yaccel

      elseif ball.y > 340 then
        ball.yaccel = -ball.yaccel
      end

      if ball.y > bot.y + 30 then
        bot.yaccel = 66
        bot.y = bot.y + (bot.yaccel * dt)

      elseif ball.y < bot.y + 30 then
        bot.yaccel = -66
        bot.y = bot.y + (bot.yaccel * dt)
      end
end

function love.draw()   
    love.graphics.setColor(192 / 255, 253 / 255, 251 / 255) 
    _G.rect0 = love.graphics.rectangle("fill", player.x, player.y, 20, 60)
    _G.rect1 = love.graphics.rectangle("fill", bot.x, bot.y, 20, 60)    
    _G.circle = love.graphics.rectangle("fill", ball.x, ball.y, 10, 10)
    love.graphics.setColor(1, 0.1, 0.1)
    love.graphics.print(player.score, 380, 25)
    love.graphics.print(bot.score, 420, 25)
end