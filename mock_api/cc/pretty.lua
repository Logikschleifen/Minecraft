-- mock_api/cc/pretty.lua
-- Stub of CC:Tweaked's cc.pretty module (require "cc.pretty").
-- Document builders are stubs; pretty() renders a best-effort string.

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

---@param text string
---@param color integer|nil
---@return table opaque doc.
function M.text(text, color)
    return { _doc = "text", text = text }
end

---@param ... table docs to concatenate.
---@return table opaque doc.
function M.concat(...)
    return { _doc = "concat", parts = { ... } }
end

---@param depth integer
---@param doc table
---@return table opaque doc.
function M.nest(depth, doc)
    return { _doc = "nest", doc = doc }
end

---@param doc table
---@return table opaque doc.
function M.group(doc)
    return { _doc = "group", doc = doc }
end

---Render a value prettily. Best-effort: tostring for scalars.
---@param obj any
---@param options table|nil
---@return string
function M.pretty(obj, options)
    if type(obj) == "string" then return string.format("%q", obj) end
    return tostring(obj)
end

---Pretty-print a value. Stub: no-op.
---@param obj any
---@param options table|nil
---@param ribbonFrac number|nil
function M.prettyPrint(obj, options, ribbonFrac)
end

---Render a doc to a string. Stub: tostring of the payload.
---@param doc table
---@param width integer|nil
---@param ribbonFrac number|nil
---@return string
function M.render(doc, width, ribbonFrac)
    if type(doc) == "table" and doc.text ~= nil then return tostring(doc.text) end
    return tostring(doc)
end

---Write a doc. Stub: no-op.
---@param doc table
---@param ribbonFrac number|nil
function M.write(doc, ribbonFrac)
end

---Print a doc. Stub: no-op.
---@param doc table
---@param ribbonFrac number|nil
function M.print(doc, ribbonFrac)
end

return M
