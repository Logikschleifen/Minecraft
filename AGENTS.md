# AGENTS.md — repo rules for humans and coding agents

Read this before adding or changing any `.lua` file in this repo.

## Layout

- `mock_api/` — PC-side stubs of CC:Tweaked + mod APIs. Never uploaded to a computer.
  `init.lua` installs them as globals; `shim.lua` decides whether to install.
- `src/<computer>/` — real game code. One folder per computer type
  (e.g. `src/mining_turtle/`). Each folder is self-contained and deployed alone.
- `tests/` — zero-dependency tests. `tests/run_all.lua` is the single entry point.
  `tests/mock_api/` holds tests for the mocks (one file per API);
  per-computer game tests live in `tests/computers/<computer>/` with their
  own `run.lua`.
- `api-docs/` — reference only. Never modify, never require from code.
- `githubdownload.lua` — deploy script. Do not change without explicit approval.

## Game code (`src/`) rules

1. **Must run in-game unchanged.** No hard dependency on anything absent on a
   computer. The string `mock_api` may appear ONLY inside the bootstrap guard
   (rule 2) — never in a plain `require`.
2. **Bootstrap guard** — every `src/<computer>/main.lua` starts with:
   ```lua
   local ok, shim = pcall(require, "mock_api.shim")
   if ok and shim then shim.useMocks() end -- PC: fakes on; game: silent no-op
   ```
   `pcall` catches the "module not found" error in-game, where the real
   `turtle`/`fs`/`peripheral` APIs are already global.
3. **Own folder on path (in-game only).** After the guard, `main.lua` adds its
   own directory to `package.path` so sibling modules resolve:
   ```lua
   if type(shell) == "table" and shell.getRunningProgram and type(fs) == "table" then
       local dir = fs.getDir(shell.getRunningProgram())
       package.path = package.path .. ";" .. dir .. "/?.lua;" .. dir .. "/?/init.lua"
   end
   ```
   On PC this block is skipped (`shell` is nil); tests set `package.path` instead.
4. **Local imports by filename.** Inside a computer folder, require siblings as
   `require("fuel")`, never with a folder prefix. Folders stay relocatable.
5. **Lua 5.1-compatible subset.** PC Lua is 5.1, CC is 5.2-like: no `goto`,
   no `//`, no `&`/`|`/`~` (use `bit32`), no `table.pack`/`table.unpack`
   (use `{...}` + `select`), no integer division assumptions.
6. **Only CC globals + siblings.** Game code may touch CC APIs (`turtle`,
   `fs`, `gps`, `peripheral`, `rednet`, `os`, `term`, ...) and its own folder's
   modules. Nothing else.
7. **Typed everywhere.** All functions get EmmyLua/LuaCATS annotations
   (`---@param`, `---@return`, `---@class`, `---@field`).

## Mock (`mock_api/`) rules

1. Stubs return sane defaults (numbers `0`, strings `""`, tables `{}`, `false`
   for booleans) and never error on dummy input. Pure helpers (`colors`,
   `vector`, `bit32`, `textutils` serialise, `cc.*`) are real implementations.
2. Every module has `M._state = {}` + `M.reset()` — the seam for a future
   stateful version. `settings` and `peripheral` attachments are already
   minimally stateful; keep that pattern when extending.
3. Peripheral files expose `M.types[typeName] = methods`. New types register
   through `peripheral.registerType()` in `init.lua`. Collision rule:
   **createavionics wins** over `create/` (see `mock_api/COLLISIONS.md`).
4. Generated files (`create.lua`, `createavionics.lua`, `advancedperipherals.lua`)
   are built from `api-docs` by script — do not hand-edit; fix the generator
   (kept in the temp workspace, ask if missing) or document overrides inline.

## Test rules

1. Zero dependencies: plain `lua`, no rocks. Must pass on Lua 5.1 AND be
   loadable on CC (no PC-only stdlib like `io.popen`, `os.execute`).
2. Use `tests/helpers/assert.lua` (`suite`, `assertEquals`, `assertType`,
   `assertHasFunction(s)`, `assertCalls`, `assertError`, `assertContains`).
3. One test file per API in `tests/mock_api/`; per-computer game tests under
   `tests/computers/<computer>/` with a `run.lua` aggregator.
   Every test file runs on load and `return`s `(passed, failed)`.
   Wire new files into `tests/run_all.lua` (API tests) or the computer's
   `run.lua` (game tests).
4. Test pattern per mock: exists → exposes documented functions → callable
   with dummy args → return types match. For game modules: test real behavior
   against the mocks (attach fake peripherals via `peripheral.attach`).
5. Run from repo root: `lua tests/run_all.lua`. Suite must be fully green
   before finishing any change.

## Deploy rules

- A computer receives ONLY its own `src/<computer>/` contents. Never upload
  `mock_api/`, `tests/`, other computer folders, or `api-docs/`.
- Verify on hardware: the in-game `require("fuel")`-by-filename bootstrap is
  the one step that cannot be proven from PC — keep first deploys minimal.
