local ShakeDetector = {}
local lastX, lastY, lastZ, timer, lastTime = 0, 0, 0, 0, 0

function ShakeDetector:init(threshold, timeout) 
    self.threshold = threshold or 0.5
    self.timeout = timeout or 0.25
    self.count = 0
end

function ShakeDetector:update(dt, x, y, z)
    timer = timer + dt
    if lastX == 0 and lastY == 0 and lastZ == 0 then lastX, lastY, lastZ = x, y, z end
    local dx, dy, dz = math.abs(lastX - x), math.abs(lastY - y), math.abs(lastZ - z)
    
    if dx > self.threshold and dy > self.threshold or dx > self.threshold and dz > self.threshold or dy > self.threshold and dz > self.threshold then
        if timer - lastTime > self.timeout then
            lastTime = timer
            self.count = self.count + 1
        end
    end
    lastX, lastY, lastZ = x, y, z
end

return ShakeDetector
