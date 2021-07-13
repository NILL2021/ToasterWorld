require("ball")
require("ai")
require("bg")
require("player") --Lets our game know that we have created a new file named "player.lua"

function love.load() --Base Löve function, all the code inside is called 1 time when the game starts.
    Player:load() -- Calls the "Player:load"-function that loads all  the players variables.
    Ball:load()
    AI:load()
    Background:load()

    Score = {player = 0, ai = 0}
    font = love.graphics.newFont(30)
end


function love.update(dt) -- Base Löve function, all the code inside is called every frame. DT stands for Delta time and is the time it took to produce the frame.
   Ball:update(dt)
    AI:update(dt)
    Background:update(dt)
   Player:update(dt) --Calls the "Player:update"-function that loads all  the players variables.
end


function love.draw() -- Base Löve function, all the code inside is called every frame. Used to draw graphics to the screen.
    Background:draw()
    Player:draw() -- Calls the "Player:draw"-function that draws the players paddle.
   Ball:draw()
   AI:draw()
   drawScore()
end

function drawScore()
    love.graphics.setFont(font)
    love.graphics.print("Player: "..Score.player, 50, 50)
    love.graphics.print("CPU: "..Score.ai, 1000, 50)
end

function checkCollision(a, b)
    if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and b.y + b.height then
        return true
    else
        return false
    end
end




