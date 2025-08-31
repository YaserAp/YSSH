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
        Size = UDim2.fromOffset(480, 315),
        Acrylic = false,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.LeftControl
    })

    -- Tabs
    local Tabs = {
        Info        = Window:AddTab({ Title = "Info", Icon = "info" }),
        AutoFishing = Window:AddTab({ Title = "Auto Fishing", Icon = "fish" }),
        Teleport    = Window:AddTab({ Title = "Teleport", Icon = "map" }),
        SpawnBoat   = Window:AddTab({ Title = "Spawn Boat", Icon = "anchor" }),
        Shop        = Window:AddTab({ Title = "Shop", Icon = "shopping-cart" }),
        User        = Window:AddTab({ Title = "User", Icon = "user" }),
        Settings    = Window:AddTab({ Title = "Settings", Icon = "settings" }),
    }

    -- ===== contoh konten sementara tiap tab =====
    Tabs.Info:AddParagraph({
        Title = "YS Hub Info",
        Content = "Welcome to YS Hub!\nFitur masih dalam pengembangan."
    })

    Tabs.AutoFishing:AddLabel("Fitur Auto Fishing bakal ada di sini...")
    Tabs.Teleport:AddLabel("Fitur Teleport bakal ada di sini...")
    Tabs.SpawnBoat:AddLabel("Fitur Spawn Boat bakal ada di sini...")
    Tabs.Shop:AddLabel("Fitur Shop bakal ada di sini...")
    Tabs.User:AddLabel("Fitur User bakal ada di sini...")

    -- ===== SETTINGS (addon manager) =====
    SaveManager:SetLibrary(Fluent)
    InterfaceManager:SetLibrary(Fluent)

    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({})
    InterfaceManager:SetFolder("YS Hub")
    SaveManager:SetFolder("YS Hub/Configs")

    -- inject setting bawaan Fluent
    InterfaceManager:BuildInterfaceSection(Tabs.Settings)
    SaveManager:BuildConfigSection(Tabs.Settings)

    -- custom tambahan di tab Settings
    Tabs.Settings:AddLabel("Custom Pengaturan Tambahan:")
    Tabs.Settings:AddButton({
        Title = "Reset Config",
        Callback = function()
            SaveManager:LoadAutoloadConfig()
            Fluent:Notify({
                Title = "YS Hub",
                Content = "Config berhasil di-reset!",
                Duration = 5
            })
        end
    })

    SaveManager:LoadAutoloadConfig()

    -- kasih notifikasi kalau berhasil load
    Fluent:Notify({
        Title = "YS Hub",
        Content = "UI berhasil dimuat dengan Fluent!",
        Duration = 5
    })
end

return UIModule
