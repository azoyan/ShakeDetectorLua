# Shake Detector Lua
It is porting of [shake.js](https://github.com/alexgibson/shake.js/blob/master/shake.js) library to Lua.

The module is designed to compatible for any engine that have delta time  and accelerometer data.

Example of usage with [Love2d](https://love2d.org) (free 2d Game Engine):

**main.lua**
```Lua
function love.load()
    shakeDetector = require "shakeDetector"
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

Changing threshold and timeout:
```Lua
shakeDetector:reset()         -- reset to defaults (threshold = 0.5, timeout = 0.25)
shakeDetector:reset(0.6, 0.3) -- set threshold to 0.6 and timeout to 0.3
shakeDetector:reset(nil, 0.4) -- set threshold to default (0.5) and timeout to 0.4
shakeDetector:reset(0.2, nil) -- set threshold to 0.2 and timeout to default (0.25)
```
