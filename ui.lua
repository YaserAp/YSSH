local UIModule = {}
UIModule.__index = UIModule

function UIModule:Open(config)
    local Features = config.Features

    -- Services
    local Players = game:GetService("Players")
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
        AutoFishing = Window:AddTab({ Title = "Auto Fishing", Icon = "settings" }),
        Teleport    = Window:AddTab({ Title = "Teleport", Icon = "map" }),
        SpawnBoat   = Window:AddTab({ Title = "Spawn Boat", Icon = "anchor" }),
        Shop        = Window:AddTab({ Title = "Shop", Icon = "shopping-cart" }),
        User        = Window:AddTab({ Title = "User", Icon = "user" }),
        Settings    = Window:AddTab({ Title = "Settings", Icon = "list" }),
    }

    -- ===== Contoh isi tiap tab =====
    Tabs.Info:AddParagraph({
        Title = "Welcome",
        Content = "YS Hub berhasil dimuat!"
    })

    Tabs.AutoFishing:AddButton({
        Title = "Start Auto Fishing",
        Callback = function()
            Features.AutoFishing()
        end
    })

    Tabs.Teleport:AddButton({
        Title = "Teleport ke Spawn",
        Callback = function()
            Features.TeleportToSpawn()
        end
    })

    Tabs.SpawnBoat:AddButton({
        Title = "Spawn Perahu",
        Callback = function()
            Features.SpawnBoat()
        end
    })

    Tabs.Shop:AddButton({
        Title = "Buka Shop",
        Callback = function()
            Features.OpenShop()
        end
    })

    Tabs.User:AddButton({
        Title = "Profile",
        Callback = function()
            Features.UserProfile()
        end
    })

    -- ===== SETTINGS (addon bawaan) =====
    SaveManager:SetLibrary(Fluent)
    InterfaceManager:SetLibrary(Fluent)

    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({})
    InterfaceManager:SetFolder("YS Hub")
    SaveManager:SetFolder("YS Hub/Configs")

    -- biar pasti kebaca
    task.defer(function()
        InterfaceManager:BuildInterfaceSection(Tabs.Settings)
        SaveManager:BuildConfigSection(Tabs.Settings)
        SaveManager:LoadAutoloadConfig()
    end)

    -- Notif
    Fluent:Notify({
        Title = "YS Hub",
        Content = "UI berhasil dimuat dengan Fluent!",
        Duration = 5
    })
end

return UIModule
