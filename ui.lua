local UIModule = {}
UIModule.__index = UIModule

function UIModule:Open(config)
    local Features = config.Features

    -- Services
    local Players = game:GetService("Players")
    local UserInput = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local LocalPlayer = Players.LocalPlayer

    -- Load Fluent (dawid) + Addons
    local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
    local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
    local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

    -- Window utama
    local Window = Fluent:CreateWindow({
        Title = "YS Hub",
        SubTitle = "BumiAksaraTeknologi",
        TabWidth = 160,
        Size = UDim2.fromOffset(500, 350),
        Acrylic = false,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.LeftControl
    })

    -- Tabs
    local Tabs = {
        Main     = Window:AddTab({ Title = "Main Features", Icon = "settings" }),
        Misc     = Window:AddTab({ Title = "Misc", Icon = "grid" }),
        Settings = Window:AddTab({ Title = "Settings", Icon = "list" })
    }

    -- ===== MAIN FEATURES =====
    Tabs.Main:AddButton({
        Title = "Do Something",
        Callback = function()
            Features.DoSomething()
        end
    })

    Tabs.Main:AddButton({
        Title = "Another Feature",
        Callback = function()
            Features.AnotherFeature()
        end
    })

    -- ===== MISC =====
    Tabs.Misc:AddParagraph({
        Title = "Info",
        Content = "Tab Misc berhasil dimuat!"
    })

    Tabs.Misc:AddButton({
        Title = "Print Hello",
        Callback = function()
            print("Hello from Misc tab!")
        end
    })

    -- ===== SETTINGS (addon manager) =====
    SaveManager:SetLibrary(Fluent)
    InterfaceManager:SetLibrary(Fluent)

    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({})
    InterfaceManager:SetFolder("YS Hub")
    SaveManager:SetFolder("YS Hub/Configs")

    InterfaceManager:BuildInterfaceSection(Tabs.Settings)
    SaveManager:BuildConfigSection(Tabs.Settings)
    SaveManager:LoadAutoloadConfig()

    -- kasih notifikasi kalau berhasil load
    Fluent:Notify({
        Title = "YS Hub",
        Content = "UI berhasil dimuat dengan Fluent!",
        Duration = 5
    })
end

return UIModule
