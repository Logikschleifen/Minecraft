-- mock_api/rednet.lua
-- Stub of CC:Tweaked's rednet API (spec: api-docs/cctweaked/rom/apis/rednet.lua).
-- Stateless stub: no modems open, sends succeed silently, receive times out.
-- M._state / M.reset() are the seam for a stateful version later
-- (open modems in _state.modems, message queue in _state.queue).

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

---Open a modem. Stub: no-op.
---@param modem string|nil side or peripheral name.
function M.open(modem)
end

---Close a modem. Stub: no-op.
---@param modem string|nil
function M.close(modem)
end

---@param modem string|nil
---@return boolean (stub: false).
function M.isOpen(modem)
    return false
end

---@param recipient integer|nil computer id (nil = repeat handled internally).
---@param message any
---@param protocol string|nil
---@return boolean sent (stub: true).
function M.send(recipient, message, protocol)
    return true
end

---@param message any
---@param protocol string|nil
function M.broadcast(message, protocol)
end

---Wait for a message. Stub: always times out (nil + TIMEOUT reason).
---@param protocolFilter string|nil
---@param timeout number|nil
---@return integer|nil sender, any message, string|nil protocol
function M.receive(protocolFilter, timeout)
    return nil, nil, nil
end

---@param protocol string
---@param hostname string
function M.host(protocol, hostname)
end

---@param protocol string
function M.unhost(protocol)
end

---Look up hosts. Stub: none found.
---@param protocol string
---@param hostname string|nil
---@param timeout number|nil
---@return integer[] ids (stub: {}).
function M.lookup(protocol, hostname, timeout)
    return {}
end

---Run the rednet repeater/message pump. Stub returns a fake id.
---@return integer
function M.run()
    return 0
end

return M
