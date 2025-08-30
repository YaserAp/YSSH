-- key.lua
-- Sistem key sederhana
local keySystem = {}

-- ganti dengan key asli (atau ambil dari pastebin)
local validKey = "jdja0klaiapKSmskao"

function keySystem:Check()
    local inputKey = "jdja0klaiapKSmskao" 
    return inputKey == validKey
end

return keySystem
