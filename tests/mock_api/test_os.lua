-- tests/mock_api/test_os.lua
-- Tests for mock_api/os.lua.

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local os_mock = require("mock_api.os")

local suite = assert.suite("os")

suite:test("exposes the os surface", function()
    assert.assertHasFunctions(os_mock, {
        "version", "getComputerID", "computerID", "getComputerLabel",
        "setComputerLabel", "clock", "startTimer", "cancelTimer",
        "setAlarm", "cancelAlarm", "time", "day", "epoch", "date",
        "queueEvent", "pullEvent", "pullEventRaw", "cancelTermination",
    })
end)

suite:test("identity functions return sane types", function()
    assert.assertType(os_mock.version(), "string")
    assert.assertType(os_mock.getComputerID(), "number")
    assert.assertEquals(os_mock.computerID(), os_mock.getComputerID())
    assert.assertEquals(os_mock.getComputerLabel(), nil)
    assert.assertCalls(os_mock.setComputerLabel, "testbox")
    assert.assertCalls(os_mock.setComputerLabel, nil)
end)

suite:test("clock/time/day/epoch/date return sane types", function()
    assert.assertType(os_mock.clock(), "number")
    assert.assertType(os_mock.time(), "number")
    assert.assertType(os_mock.day(), "number")
    assert.assertType(os_mock.epoch(), "number")
    assert.assertType(os_mock.date(), "string")
end)

suite:test("timers and alarms hand out ids", function()
    assert.assertType(os_mock.startTimer(1), "number")
    assert.assertType(os_mock.setAlarm(6), "number")
    assert.assertCalls(os_mock.cancelTimer, 1)
    assert.assertCalls(os_mock.cancelAlarm, 1)
end)

suite:test("events can be queued and pulled", function()
    assert.assertCalls(os_mock.queueEvent, "timer", 1)
    local name = assert.assertCalls(os_mock.pullEvent)
    assert.assertType(name, "string")
    local raw = assert.assertCalls(os_mock.pullEventRaw)
    assert.assertType(raw, "string")
    assert.assertCalls(os_mock.cancelTermination)
end)

local passed, failed = suite:summary()
return passed, failed
