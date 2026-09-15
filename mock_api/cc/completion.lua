-- mock_api/cc/completion.lua
-- Stub of CC:Tweaked's cc.completion module (require "cc.completion").
-- Completion helpers: stubs returning no candidates.

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

---Complete from a fixed choice list. Real implementation.
---@param text string partial text.
---@param choices string[] candidates.
---@param addSpace boolean|nil append a space to full matches.
---@return string[] matches.
function M.choice(text, choices, addSpace)
    local out = {}
    for _, c in ipairs(choices) do
        if c:sub(1, #text) == text then
            if c == text and addSpace then out[#out + 1] = c .. " "
            else out[#out + 1] = c:sub(#text + 1) end
        end
    end
    return out
end

---Complete a peripheral name. Stub: none.
---@param text string
---@param addSpace boolean|nil
---@return string[]
function M.peripheral(text, addSpace)
    return {}
end

---Complete a side name. Real implementation over the six sides.
---@param text string
---@param addSpace boolean|nil
---@return string[]
function M.side(text, addSpace)
    return M.choice(text,
        { "top", "bottom", "left", "right", "front", "back" }, addSpace)
end

---Complete a setting name. Stub: none.
---@param text string
---@param addSpace boolean|nil
---@return string[]
function M.setting(text, addSpace)
    return {}
end

---Complete a command name. Stub: none.
---@param text string
---@param addSpace boolean|nil
---@return string[]
function M.command(text, addSpace)
    return {}
end

return M
