-- main.lua
-- Entry Point

local baseURL = "https://raw.githubusercontent.com/YaserAp/YSSH/main/"

-- helper untuk load modul aman
local function SafeRequire(url)
    local success, result = pcall(function()
        return loadstring(game:HttpGet(url))()
    end)
    if success then
        return result
    else
        warn("[YSSH] Gagal load modul: " .. url)
        return {}
    end
end

-- Load modul
local KeySystem = SafeRequire(baseURL .. "key.lua")
local UI        = SafeRequire(baseURL .. "ui.lua")
local Features  = SafeRequire(baseURL .. "features.lua")

-- Mulai sistem
KeySystem:Start(function(isValid)
    if isValid then
        print("[YSSH] Key valid, membuka UI...")
        UI:Open({
            Features = Features,
            Theme = "Dark" -- bisa "Dark", "Neon", "Minimal"
        })
    else
        warn("[YSSH] Key tidak valid!")
    end
end)
