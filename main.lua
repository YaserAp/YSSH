-- main.lua
-- Entry Point

-- ganti "YaserAp" sama username kamu, repo "YSSH"
local baseURL = "https://raw.githubusercontent.com/YaserAp/YSSH/main/"

-- Load modul dari GitHub
local KeySystem = loadstring(game:HttpGet(baseURL .. "key.lua"))()
local UI        = loadstring(game:HttpGet(baseURL .. "ui.lua"))()
local Features  = loadstring(game:HttpGet(baseURL .. "features.lua"))()

-- Mulai sistem
KeySystem:Start(function(isValid)
    if isValid then
        UI:Open({
            Features = Features
        })
    else
        warn("Key tidak valid!")
    end
end)
