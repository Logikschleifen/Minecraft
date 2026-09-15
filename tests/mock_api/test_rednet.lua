-- tests/mock_api/test_rednet.lua
-- Tests for mock_api/rednet.lua.

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local rednet = require("mock_api.rednet")

local suite = assert.suite("rednet")

suite:test("exposes the rednet surface", function()
    assert.assertHasFunctions(rednet, {
        "open", "close", "isOpen", "send", "broadcast",
        "receive", "host", "unhost", "lookup", "run",
    })
end)

suite:test("modems start closed, open/close do not error", function()
    assert.assertEquals(rednet.isOpen(), false)
    assert.assertCalls(rednet.open)
    assert.assertCalls(rednet.open, "top")
    assert.assertCalls(rednet.close, "top")
    assert.assertCalls(rednet.close)
end)

suite:test("send succeeds, receive times out, lookup is empty", function()
    assert.assertEquals(rednet.send(1, "hi"), true)
    assert.assertCalls(rednet.broadcast, "hi", "proto")
    local sender, msg = rednet.receive(nil, 0)
    assert.assertEquals(sender, nil)
    assert.assertEquals(msg, nil)
    assert.assertEquals(#rednet.lookup("proto"), 0)
    assert.assertCalls(rednet.host, "proto", "host")
    assert.assertCalls(rednet.unhost, "proto")
    assert.assertType(rednet.run(), "number")
end)

local passed, failed = suite:summary()
return passed, failed
