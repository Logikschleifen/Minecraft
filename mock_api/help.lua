-- mock_api/help.lua
-- Stub of CC:Tweaked's help API (spec: api-docs/cctweaked/rom/apis/help.lua).
-- Stateless: fixed topic list. M._state / M.reset() are the seam for a
-- stateful version later (custom path + topics).

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

---@return string help path (stub: default).
function M.path()
    return "/rom/help"
end

---@param path string
function M.setPath(path)
end

---Look up a topic. Stub returns canned text for any topic.
---@param topic string
---@return string|nil help text (stub: always non-nil).
function M.lookup(topic)
    return "Mock help for " .. tostring(topic) .. "."
end

---@return string[] topic names (stub: small fixed list).
function M.topics()
    return { "intro", "apis", "programs", "lua" }
end

---Complete a topic prefix. Stub: no completions.
---@param prefix string
---@return string[]
function M.completeTopic(prefix)
    return {}
end

return M
