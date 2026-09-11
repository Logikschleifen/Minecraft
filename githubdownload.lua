local TOKEN = "github_pat_YOUR_TOKEN_HERE"

local OWNER = "Logikschleifen"
local REPO = "Minecraft"
local BRANCH = "main"

local function githubGet(url)
    local response, err = http.get(url, {
        ["Authorization"] = "Bearer " .. ,
        ["Accept"] = "application/vnd.github+json",
        ["X-GitHub-Api-Version"] = "2022-11-28",
        ["User-Agent"] = "CC-Tweaked"
    })

    if not response then
        error("Request failed: " .. tostring(err))
    end

    local code = response.getResponseCode()
    local body = response.readAll()
    response.close()

    if code < 200 or code >= 300 then
        error("GitHub returned HTTP " .. code .. "\n" .. body)
    end

    return body
end

local function downloadFile(repoPath, localPath)
    local url =
        "https://api.github.com/repos/" ..
        OWNER .. "/" ..
        REPO ..
        "/contents/" ..
        repoPath ..
        "?ref=" .. BRANCH

    local body = githubGet(url)
    local fileInfo = textutils.unserialiseJSON(body)

    if not fileInfo or not fileInfo.download_url then
        error("Could not find download URL for " .. repoPath)
    end

    local data = githubGet(fileInfo.download_url)

    local file = fs.open(localPath, "w")

    if not file then
        error("Could not open " .. localPath)
    end

    file.write(data)
    file.close()

    print("Downloaded " .. repoPath)
end

downloadFile("main.lua", "/app/main.lua")