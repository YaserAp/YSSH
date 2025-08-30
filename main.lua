
local baseURL = "https://raw.githubusercontent.com/YaserAp/YSSH/main/"

local KeySystem = loadstring(game:HttpGet(baseURL .. "key.lua?v=" .. tick()))()
local UI        = loadstring(game:HttpGet(baseURL .. "ui.lua?v=" .. tick()))()
local Features  = loadstring(game:HttpGet(baseURL .. "features.lua?v=" .. tick()))()

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
