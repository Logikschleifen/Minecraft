-- mock_api/cc/base64.lua
-- Stub of CC:Tweaked's cc.base64 module (require "cc.base64").
-- Real implementation (RFC 4648, no line breaks).

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

local ALPHA = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

---Encode a string. Real implementation.
---@param str string
---@param altChars string|nil unused in the mock.
---@return string
function M.encode(str, altChars)
    local bytes = { string.byte(str, 1, #str) }
    local out = {}
    for i = 1, #bytes, 3 do
        local a, b, c = bytes[i], bytes[i + 1], bytes[i + 2]
        local n = a * 65536 + (b or 0) * 256 + (c or 0)
        local c1 = math.floor(n / 262144) % 64
        local c2 = math.floor(n / 4096) % 64
        local c3 = math.floor(n / 64) % 64
        local c4 = n % 64
        out[#out + 1] = ALPHA:sub(c1 + 1, c1 + 1) .. ALPHA:sub(c2 + 1, c2 + 1)
        if b == nil then out[#out + 1] = "=="
        elseif c == nil then out[#out + 1] = ALPHA:sub(c3 + 1, c3 + 1) .. "="
        else out[#out + 1] = ALPHA:sub(c3 + 1, c3 + 1) .. ALPHA:sub(c4 + 1, c4 + 1) end
    end
    return table.concat(out)
end

---Decode a string. Real implementation (nil on invalid input).
---@param str string
---@param altChars string|nil unused in the mock.
---@return string|nil
function M.decode(str, altChars)
    local clean = tostring(str):gsub("%s+", "")
    if #clean % 4 ~= 0 then return nil end
    local rev = {}
    for i = 1, #ALPHA do rev[ALPHA:sub(i, i)] = i - 1 end
    local out = {}
    for i = 1, #clean, 4 do
        local vals = {}
        local pad = 0
        for j = 0, 3 do
            local ch = clean:sub(i + j, i + j)
            if ch == "=" then pad = pad + 1 vals[j + 1] = 0
            else
                local v = rev[ch]
                if v == nil then return nil end
                vals[j + 1] = v
            end
        end
        local n = vals[1] * 262144 + vals[2] * 4096 + vals[3] * 64 + vals[4]
        out[#out + 1] = string.char(math.floor(n / 65536) % 256)
        if pad < 2 then out[#out + 1] = string.char(math.floor(n / 256) % 256) end
        if pad < 1 then out[#out + 1] = string.char(n % 256) end
    end
    return table.concat(out)
end

return M
