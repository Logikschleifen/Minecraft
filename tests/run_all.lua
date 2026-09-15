-- tests/run_all.lua
-- Central test runner. Run from the repo root:
--   lua tests/run_all.lua
-- (On CC:Tweaked, upload the repo and run the same path from the root.)
-- Zero dependencies. Test files are grouped by what they cover:
--   tests/mock_api/*    — tests for the mock_api/ stubs (one file per API)
--   tests/computers/*   — tests for real game code in src/<computer>/
-- Each file runs its suite on load and returns (passed, failed); this
-- script aggregates and exits non-zero on failure via error().

package.path = package.path
    .. ";./?.lua"
    .. ";./?/init.lua"

---@type string[] test files in run order, relative to repo root.
local FILES = {
    -- mock_api stubs: assert library self-test first, everything else trusts it.
    "tests/mock_api/test_assert.lua",
    -- CC:Tweaked base APIs
    "tests/mock_api/test_globals.lua",
    "tests/mock_api/test_os.lua",
    "tests/mock_api/test_term.lua",
    "tests/mock_api/test_fs.lua",
    "tests/mock_api/test_io.lua",
    "tests/mock_api/test_http.lua",
    "tests/mock_api/test_rednet.lua",
    "tests/mock_api/test_gps.lua",
    "tests/mock_api/test_peripheral.lua",
    "tests/mock_api/test_turtle.lua",
    "tests/mock_api/test_disk.lua",
    "tests/mock_api/test_keys.lua",
    "tests/mock_api/test_colors.lua",
    "tests/mock_api/test_textutils.lua",
    "tests/mock_api/test_vector.lua",
    "tests/mock_api/test_window.lua",
    "tests/mock_api/test_paintutils.lua",
    "tests/mock_api/test_parallel.lua",
    "tests/mock_api/test_settings.lua",
    "tests/mock_api/test_help.lua",
    "tests/mock_api/test_commands.lua",
    "tests/mock_api/test_redstone.lua",
    "tests/mock_api/test_bit32.lua",
    "tests/mock_api/test_pocket.lua",
    "tests/mock_api/test_cc.lua",
    "tests/mock_api/test_vanilla.lua",
    -- peripheral mods
    "tests/mock_api/test_create.lua",
    "tests/mock_api/test_createavionics.lua",
    "tests/mock_api/test_advancedperipherals.lua",
    -- game code, per computer
    "tests/computers/mining_turtle/run.lua",
}

local total_passed, total_failed = 0, 0
local failed_files = {}

for _, file in ipairs(FILES) do
    print("=== " .. file .. " ===")
    local ok, passed, failed = pcall(dofile, file)
    if not ok then
        total_failed = total_failed + 1
        failed_files[#failed_files + 1] = file .. " (LOAD ERROR: " .. tostring(passed) .. ")"
    else
        total_passed = total_passed + (passed or 0)
        total_failed = total_failed + (failed or 0)
        if (failed or 0) > 0 then
            failed_files[#failed_files + 1] = file
        end
    end
end

print(string.format("\nTOTAL: %d passed, %d failed", total_passed, total_failed))
if #failed_files > 0 then
    print("Files with failures:")
    for _, f in ipairs(failed_files) do print("  - " .. f) end
    error(total_failed .. " test(s) failed", 0)
end
