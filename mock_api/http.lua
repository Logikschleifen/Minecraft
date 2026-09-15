-- mock_api/http.lua
-- Stub of CC:Tweaked's http API (spec: api-docs/cctweaked/rom/apis/http/http.lua).
-- Stateless stub: canned 200 responses, no network.
-- M._state / M.reset() are the seam for a stateful version later
-- (scripted URLs, request log in _state.requests).

---@class HttpResponse
---@field close fun()
---@field getResponseCode fun(): integer
---@field getResponseHeaders fun(): table<string, string>
---@field read fun(count: integer|nil): string|nil
---@field readAll fun(): string|nil
---@field readLine fun(withTrailing: boolean|nil): string|nil
---@field seek fun(whence: string|nil, offset: integer|nil): integer|nil

---@class HttpWebsocket
---@field close fun()
---@field receive fun(timeout: number|nil): string|nil, boolean|nil
---@field send fun(data: string, binary: boolean|nil)

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

---@param body string response body for the canned response.
---@return HttpResponse
local function cannedResponse(body)
    ---@type HttpResponse
    local r = {}
    function r.close() end
    function r.getResponseCode() return 200 end
    function r.getResponseHeaders() return {} end
    function r.read(count) return nil end
    function r.readAll() return body end
    function r.readLine(withTrailing) return nil end
    function r.seek(whence, offset) return 0 end
    return r
end

---@param url string
---@param headers table<string, string>|nil
---@param binary boolean|nil
---@return HttpResponse|nil, string|nil error, HttpResponse|nil failedHandle
function M.get(url, headers, binary)
    return cannedResponse("")
end

---@param url string
---@param body string
---@param headers table<string, string>|nil
---@param binary boolean|nil
---@return HttpResponse|nil, string|nil error, HttpResponse|nil failedHandle
function M.post(url, body, headers, binary)
    return cannedResponse("")
end

---@param url string|table
---@param body string|nil
---@param headers table<string, string>|nil
---@param binary boolean|nil
function M.request(url, body, headers, binary)
end

---@param url string
---@param headers table<string, string>|nil
---@return boolean always true in the mock.
function M.checkURL(url, headers)
    return true
end

---@param url string
---@param headers table<string, string>|nil
---@return HttpWebsocket|nil, string|nil error
function M.websocket(url, headers)
    ---@type HttpWebsocket
    local ws = {}
    function ws.close() end
    function ws.receive(timeout) return nil, false end
    function ws.send(data, binary) end
    return ws
end

---@param url string
---@param headers table<string, string>|nil
function M.websocketAsync(url, headers)
end

return M
