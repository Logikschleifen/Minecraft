-- mock_api/vector.lua
-- Stub of CC:Tweaked's vector API (spec: api-docs/.../vector.lua + knowledge).
-- Vectors are data, so this is a real implementation, not a stub.

---@class Vector
---@field x number
---@field y number
---@field z number
local Vector = {}
Vector.__index = Vector

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

function Vector:add(o) return M.new(self.x + o.x, self.y + o.y, self.z + o.z) end
function Vector:sub(o) return M.new(self.x - o.x, self.y - o.y, self.z - o.z) end
function Vector:mul(m) return M.new(self.x * m, self.y * m, self.z * m) end
function Vector:div(m) return M.new(self.x / m, self.y / m, self.z / m) end
function Vector:unm() return M.new(-self.x, -self.y, -self.z) end
function Vector:dot(o) return self.x * o.x + self.y * o.y + self.z * o.z end
function Vector:cross(o)
    return M.new(
        self.y * o.z - self.z * o.y,
        self.z * o.x - self.x * o.z,
        self.x * o.y - self.y * o.x)
end
function Vector:length() return math.sqrt(self.x ^ 2 + self.y ^ 2 + self.z ^ 2) end
function Vector:normalize()
    local l = self:length()
    if l == 0 then return M.new(0, 0, 0) end
    return self:div(l)
end
function Vector:round(tolerance)
    tolerance = tolerance or 1
    local function r(v) return math.floor(v / tolerance + 0.5) * tolerance end
    return M.new(r(self.x), r(self.y), r(self.z))
end
function Vector:equals(other)
    return self.x == other.x and self.y == other.y and self.z == other.z
end
function Vector:tostring()
    return self.x .. "," .. self.y .. "," .. self.z
end

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

---Create a new vector. Real implementation.
---@param x number
---@param y number
---@param z number
---@return Vector
function M.new(x, y, z)
    return setmetatable({ x = x, y = y, z = z }, Vector)
end

return M
