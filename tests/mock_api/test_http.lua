-- tests/mock_api/test_http.lua
-- Tests for mock_api/http.lua.

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local http = require("mock_api.http")

local suite = assert.suite("http")

suite:test("exposes the http surface", function()
    assert.assertHasFunctions(http, {
        "get", "post", "request", "checkURL", "websocket", "websocketAsync",
    })
end)

suite:test("get/post return canned 200 responses", function()
    local res = assert.assertCalls(http.get, "https://example.com")
    assert.assertType(res, "table")
    assert.assertEquals(res.getResponseCode(), 200)
    assert.assertType(res.getResponseHeaders(), "table")
    assert.assertType(res.readAll(), "string")
    assert.assertCalls(res.close)
    local res2 = assert.assertCalls(http.post, "https://example.com", "body")
    assert.assertEquals(res2.getResponseCode(), 200)
    assert.assertCalls(res2.close)
end)

suite:test("request/checkURL/websockets do not error", function()
    assert.assertCalls(http.request, "https://example.com")
    assert.assertEquals(http.checkURL("https://example.com"), true)
    local ws = assert.assertCalls(http.websocket, "wss://example.com")
    assert.assertType(ws, "table")
    assert.assertCalls(ws.send, "hi")
    assert.assertCalls(ws.close)
    assert.assertCalls(http.websocketAsync, "wss://example.com")
end)

local passed, failed = suite:summary()
return passed, failed
