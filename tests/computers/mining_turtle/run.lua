-- tests/computers/mining_turtle/run.lua
-- Aggregator for this computer's tests. Loaded by tests/run_all.lua;
-- can also run standalone: lua tests/computers/mining_turtle/run.lua

package.path = package.path .. ";./?.lua"

local total_passed, total_failed = 0, 0

---@type string[] test files for this computer, relative to repo root.
local FILES = {
    "tests/computers/mining_turtle/test_shim.lua",
    "tests/computers/mining_turtle/test_fuel.lua",
    "tests/computers/mining_turtle/test_main.lua",
}

for _, file in ipairs(FILES) do
    print("=== " .. file .. " ===")
    local ok, passed, failed = pcall(dofile, file)
    if not ok then
        total_failed = total_failed + 1
        print("LOAD ERROR: " .. tostring(passed))
    else
        total_passed = total_passed + (passed or 0)
        total_failed = total_failed + (failed or 0)
    end
end

print(string.format("[mining_turtle] %d passed, %d failed", total_passed, total_failed))
return total_passed, total_failed
