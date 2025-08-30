local baseURL = "https://raw.githubusercontent.com/YaserAp/YSSH/main/"

local KeySystem = loadstring(game:HttpGet(baseURL .. "key.lua"))()
local UI        = loadstring(game:HttpGet(baseURL .. "ui.lua"))()
local Features  = loadstring(game:HttpGet(baseURL .. "features.lua"))()

KeySystem:Start(function(isValid)
    if isValid then
        UI:Open({
            Features = Features
        })
    else
        warn("Key tidak valid!")
    end
end)
