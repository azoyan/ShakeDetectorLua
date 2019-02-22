# Shake Detector Lua
It is port of [shake.js](https://github.com/alexgibson/shake.js/blob/master/shake.js) library to Lua
The module is designed to compatible for any engine that have delta time  and accelerometer data.

Example of usage with Love2d (Free 2d Game Engine):

**main.lua**
```Lua
function love.load()
    shakeDetector = require "shakeDetector"
    shakeDetector:init(0.5, 0.25) --threshold, timeout
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

