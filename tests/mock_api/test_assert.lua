-- tests/mock_api/test_assert.lua
-- Self-test for tests/helpers/assert.lua. Must stay green: every other
-- test file trusts this library.

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")

local suite = assert.suite("assert")

suite:test("assertEquals passes on equal values", function()
    assert.assertEquals(1, 1)
    assert.assertEquals("a", "a")
end)

suite:test("assertEquals raises on mismatch", function()
    local err = assert.assertError(assert.assertEquals, 1, 2)
    assert.assertContains(err, "expected")
end)

suite:test("assertNotEquals", function()
    assert.assertNotEquals(1, 2)
    assert.assertError(assert.assertNotEquals, 1, 1)
end)

suite:test("assertTrue / assertFalse", function()
    assert.assertTrue(true)
    assert.assertFalse(false)
    assert.assertError(assert.assertTrue, false)
    assert.assertError(assert.assertFalse, true)
end)

suite:test("assertNil / assertNotNil", function()
    assert.assertNil(nil)
    assert.assertNotNil(0)
    assert.assertError(assert.assertNil, 0)
    assert.assertError(assert.assertNotNil, nil)
end)

suite:test("assertType with single and multiple names", function()
    assert.assertType("x", "string")
    assert.assertType(1, { "string", "number" })
    assert.assertError(assert.assertType, 1, "string")
end)

suite:test("assertHasFunction(s)", function()
    local t = { f = function() end, x = 1 }
    assert.assertHasFunction(t, "f")
    assert.assertHasFunctions(t, { "f" })
    assert.assertError(assert.assertHasFunction, t, "x")
    assert.assertError(assert.assertHasFunction, t, "missing")
end)

suite:test("assertCalls returns values, assertError captures", function()
    local a, b = assert.assertCalls(function() return 1, 2 end)
    assert.assertEquals(a, 1)
    assert.assertEquals(b, 2)
    assert.assertError(assert.assertCalls, function() error("boom") end)
    local msg = assert.assertError(function() error("boom") end)
    assert.assertContains(msg, "boom")
end)

suite:test("assertContains works on tables and strings", function()
    assert.assertContains({ 1, 2, 3 }, 2)
    assert.assertContains("hello world", "world")
    assert.assertError(assert.assertContains, { 1 }, 2)
end)

suite:test("suite counts passes and failures", function()
    local s = assert.suite("inner")
    s:test("ok", function() end)
    s:test("bad", function() error("x") end)
    assert.assertEquals(s.passed, 1)
    assert.assertEquals(s.failed, 1)
end)

local passed, failed = suite:summary()
return passed, failed
