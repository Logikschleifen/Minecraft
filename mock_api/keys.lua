-- mock_api/keys.lua
-- Stub of CC:Tweaked's keys API (spec: api-docs/cctweaked/rom/apis/keys.lua).
-- Stateless stub. Key codes are data, so they are real values, not stubs.

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

-- Key codes (real values, copied from the spec).
M.zero = 11
M.one = 2
M.a = 30
M.b = 48
M.c = 46
M.d = 32
M.e = 18
M.f = 33
M.g = 34
M.h = 35
M.i = 23
M.j = 36
M.k = 37
M.l = 38
M.m = 50
M.n = 49
M.o = 24
M.p = 25
M.q = 16
M.r = 19
M.s = 31
M.t = 20
M.u = 22
M.v = 47
M.w = 17
M.x = 45
M.y = 21
M.z = 44
M.enter = 28
M.backspace = 14
M.tab = 15
M.space = 57
M.leftShift = 42
M.rightShift = 54
M.leftCtrl = 29
M.rightCtrl = 157
M.leftAlt = 56
M.rightAlt = 184
M.up = 200
M.down = 208
M.left = 203
M.right = 205
M.f1 = 59
M.f2 = 60
M.f3 = 61
M.f4 = 62
M.f5 = 63
M.f6 = 64
M.f7 = 65
M.f8 = 66
M.f9 = 67
M.f10 = 68
M.f11 = 87
M.f12 = 88

---Get the name of a key code. Stub: "unknown" unless it matches a known code.
---@param key integer key code.
---@return string
function M.getName(key)
    for name, code in pairs(M) do
        if type(code) == "number" and code == key and name ~= "_state" then
            return name
        end
    end
    return "unknown"
end

return M
