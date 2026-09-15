-- mock_api/peripheral.lua
-- Stub of CC:Tweaked's peripheral API
-- (spec: api-docs/cctweaked/rom/apis/peripheral.lua).
-- Stateless stub: no peripherals attached. The mod mocks (create.lua,
-- createavionics.lua, advancedperipherals.lua, vanilla.lua) register their
-- type tables here via peripheral.registerType(); peripheral.find/wrap then
-- resolve them, which is the seam a stateful version builds on
-- (attachment names in _state.attached).

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
---@field attached table<string, table>|nil name -> peripheral table
---@field types table<string, table>|nil type -> method table
M._state = { attached = {}, types = {} }

---Clear registered peripherals and attachments.
function M.reset()
    M._state = { attached = {}, types = {} }
end

---Register a peripheral method table under a type name (mock-only helper,
-- used by mock_api/init.lua to expose the mod mocks through find/wrap).
---@param typeName string peripheral type, e.g. "player_detector".
---@param methods table method table for that type.
function M.registerType(typeName, methods)
    M._state.types[typeName] = methods
end

---Attach a named peripheral (mock-only helper for the stateful version).
---@param name string attachment name, e.g. "top".
---@param typeName string registered type.
function M.attach(name, typeName)
    local methods = M._state.types[typeName]
    M._state.attached[name] = methods or {}
    return M._state.attached[name]
end

---@return string[] (stub: {} unless attach() was used).
function M.getNames()
    local names = {}
    for name, _ in pairs(M._state.attached) do
        names[#names + 1] = name
    end
    return names
end

---@param name string
---@return boolean
function M.isPresent(name)
    return M._state.attached[name] ~= nil
end

---@param name string
---@return string|nil type, or nil when absent.
function M.getType(name)
    local found = M._state.attached[name]
    if found == nil then return nil end
    for typeName, methods in pairs(M._state.types) do
        if methods == found then return typeName end
    end
    return "mock"
end

---@param peripheral string name or object.
---@param peripheralType string
---@return boolean
function M.hasType(peripheral, peripheralType)
    if type(peripheral) == "string" then
        return M.getType(peripheral) == peripheralType
    end
    return false
end

---@param name string
---@return string[]|nil method names, or nil when absent.
function M.getMethods(name)
    local found = M._state.attached[name]
    if found == nil then return nil end
    local out = {}
    for k, v in pairs(found) do
        if type(v) == "function" and k ~= "_state" and k ~= "reset" then
            out[#out + 1] = k
        end
    end
    return out
end

---@param peripheral table|string wrapped peripheral or name.
---@return string|nil attachment name, or nil.
function M.getName(peripheral)
    if type(peripheral) == "string" then
        if M._state.attached[peripheral] ~= nil then return peripheral end
        return nil
    end
    for name, methods in pairs(M._state.attached) do
        if methods == peripheral then return name end
    end
    return nil
end

---@param name string
---@param method string
---@param ... any
---@return any result of the method, or nil when absent.
function M.call(name, method, ...)
    local found = M._state.attached[name]
    if found == nil then return nil end
    local fn = found[method]
    if type(fn) ~= "function" then return nil end
    return fn(...)
end

---@param name string
---@return table|nil peripheral table, or nil when absent.
function M.wrap(name)
    return M._state.attached[name]
end

---@param typeName string peripheral type to search for.
---@param filter fun(name: string, wrapped: table): boolean|nil|nil
---@return table|nil, string|nil first match and its name.
function M.find(typeName, filter)
    local methods = M._state.types[typeName]
    if methods == nil then return nil, nil end
    for name, attached in pairs(M._state.attached) do
        if attached == methods then
            if filter == nil or filter(name, attached) then
                return attached, name
            end
        end
    end
    return nil, nil
end

return M
