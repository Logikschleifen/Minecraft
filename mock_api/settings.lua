-- mock_api/settings.lua
-- Stub of CC:Tweaked's settings API
-- (spec: api-docs/cctweaked/rom/apis/settings.lua).
-- Semi-stateful by necessity: definitions and values live in M._state so
-- set/get round-trip inside one process; reset() clears them.

---@class SettingDetails
---@field description string|nil
---@field default any
---@field type string|nil
---@field value any|nil

---@class SettingDefinition
---@field description string|nil
---@field default any
---@field type string|nil

local M = {}

---@class SettingsState
---@field defined table<string, SettingDefinition>
---@field values table<string, any>
---@type SettingsState
M._state = { defined = {}, values = {} }

---Clear definitions and values.
function M.reset()
    M._state = { defined = {}, values = {} }
end

---@param name string
---@param options SettingDefinition|nil
function M.define(name, options)
    M._state.defined[name] = options or {}
    if M._state.values[name] == nil and options ~= nil then
        M._state.values[name] = options.default
    end
end

---@param name string
function M.undefine(name)
    M._state.defined[name] = nil
    M._state.values[name] = nil
end

---@param name string
---@param value any
function M.set(name, value)
    M._state.values[name] = value
end

---@param name string
---@param default any|nil
---@return any value or default.
function M.get(name, default)
    local v = M._state.values[name]
    if v == nil then return default end
    return v
end

---@param name string
---@return SettingDetails details (empty stub shape when undefined).
function M.getDetails(name)
    local def = M._state.defined[name] or {}
    return {
        description = def.description,
        default = def.default,
        type = def.type,
        value = M._state.values[name],
    }
end

---@param name string
function M.unset(name)
    M._state.values[name] = nil
end

---Clear all values (definitions survive, like the real API).
function M.clear()
    M._state.values = {}
end

---@return string[] names with values set.
function M.getNames()
    local out = {}
    for k, _ in pairs(M._state.values) do out[#out + 1] = k end
    return out
end

---Load settings from a file. Stub: no-op (empty filesystem).
---@param path string|nil
---@return boolean always true in the mock.
function M.load(path)
    return true
end

---Save settings to a file. Stub: no-op.
---@param path string|nil
---@return boolean always true in the mock.
function M.save(path)
    return true
end

return M
