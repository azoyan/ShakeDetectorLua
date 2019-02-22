# ShakeDetectorLua
The module is designed to compatible for any engine that have delta time  and accelerometer data.
Example of usage with Love2d (Free 2d Game Engine):
```Lua
function love.load()
    shakeDetector = require "shakeDetector"
    shakeDetector:init(0.5, 0.25)    
    local joysticks = love.joystick.getJoysticks()
    joystick = joysticks[#joysticks]    
end

function love.update(dt)    
    local x, y, z = joystick:getAxes()
    shakeDetector:update(dt, x, y, z)
end

function love.draw()
    love.graphics.print(shakeDetector.count)
end
```

