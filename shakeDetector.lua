local ShakeDetector = { count = 0 }
local lastX, lastY, lastZ, timer, lastTime, threshold, timeout = 0, 0, 0, 0, 0, 0.5, 0.25

function ShakeDetector:reset(th, to)
    threshold, timeout = th or 0.5, to or 0.25
end

function ShakeDetector:update(dt, x, y, z)
    timer = timer + dt
    if lastX == 0 and lastY == 0 and lastZ == 0 then lastX, lastY, lastZ = x, y, z end
    local dx, dy, dz = math.abs(lastX - x), math.abs(lastY - y), math.abs(lastZ - z)

    if dx > threshold and dy > threshold or dx > threshold and dz > threshold or dy > threshold and dz > threshold then
        if timer - lastTime > timeout then
            lastTime = timer
            self.count = self.count + 1
        end
    end
    lastX, lastY, lastZ = x, y, z
end

return ShakeDetector
