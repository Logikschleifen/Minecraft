-- mock_api/fs.lua
-- Stub of CC:Tweaked's fs API (spec: api-docs/cctweaked/rom/apis/fs.lua + knowledge).
-- Stateless stub: empty filesystem (exists -> false, list -> {}).
-- M._state / M.reset() are the seam for a stateful version later
-- (in-memory files, _state.files[path] = contents).

---@class FsReadHandle
---@field close fun()
---@field read fun(count: integer|nil): string|nil
---@field readAll fun(): string|nil
---@field readLine fun(withTrailing: boolean|nil): string|nil
---@field seek fun(whence: string|nil, offset: integer|nil): integer|nil

---@class FsWriteHandle
---@field close fun()
---@field flush fun()
---@field write fun(data: string)
---@field writeLine fun(data: string)
---@field seek fun(whence: string|nil, offset: integer|nil): integer|nil

---@class FsAttributes
---@field size integer
---@field isDir boolean
---@field isReadOnly boolean
---@field created integer
---@field modified integer

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

---@param path string
---@return string[] matches (stub: none).
function M.find(pattern)
    return {}
end

---@param path string
---@param ... string
---@return string combined path.
function M.combine(path, ...)
    local parts = { path, ... }
    return table.concat(parts, "/")
end

---@param path string
---@return string[] entries (stub: empty directory).
function M.list(path)
    return {}
end

---@param path string
---@return boolean (stub: false, empty filesystem).
function M.exists(path)
    return false
end

---@param path string
---@return boolean (stub: false).
function M.isDir(path)
    return false
end

---@param path string
---@return boolean (stub: false).
function M.isReadOnly(path)
    return false
end

---@param path string
---@return string file name component.
function M.getName(path)
    return tostring(path):match("([^/]+)$") or ""
end

---@param path string
---@return string directory component.
function M.getDir(path)
    return tostring(path):match("^(.*)/[^/]*$") or ""
end

---@param path string
---@return integer (stub: 0).
function M.getSize(path)
    return 0
end

---@param path string
---@return string|nil drive name (stub: hdd).
function M.getDrive(path)
    return "hdd"
end

---@param path string
---@return integer free bytes (stub: large).
function M.getFreeSpace(path)
    return 1000000
end

---@param path string
---@return integer|nil capacity in bytes (stub: same as free).
function M.getCapacity(path)
    return 1000000
end

---@param path string
---@return FsAttributes
function M.attributes(path)
    return { size = 0, isDir = false, isReadOnly = false, created = 0, modified = 0 }
end

---@param path string
---@return boolean (stub: false).
function M.isDriveRoot(path)
    return false
end

---Complete a partial path. Stub: no completions.
---@param path string
---@param location string|nil
---@param includeFiles boolean|nil
---@param includeDirs boolean|nil
---@return string[]
function M.complete(path, location, includeFiles, includeDirs)
    return {}
end

---Open a file. Stub returns an in-memory handle (writes discarded).
---@param path string
---@param mode string "r", "w" or "a" (plus "b" variants).
---@return FsReadHandle|FsWriteHandle|nil handle, string|nil error
function M.open(path, mode)
    local m = tostring(mode or "r")
    local forWrite = m:sub(1, 1) == "w" or m:sub(1, 1) == "a"
    if forWrite then
        ---@type FsWriteHandle
        local h = {}
        function h.close() end
        function h.flush() end
        function h.write(data) end
        function h.writeLine(data) end
        function h.seek(whence, offset) return 0 end
        return h
    end
    ---@type FsReadHandle
    local h = {}
    function h.close() end
    function h.read(count) return nil end
    function h.readAll() return "" end
    function h.readLine(withTrailing) return nil end
    function h.seek(whence, offset) return 0 end
    return h
end

---@param path string
---@param dest string
function M.move(path, dest)
end

---@param path string
---@param dest string
function M.copy(path, dest)
end

---@param path string
function M.delete(path)
end

---@param path string
function M.makeDir(path)
end

return M
