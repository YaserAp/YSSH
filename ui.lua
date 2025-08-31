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
        AutoFarm = Window:AddTab({ Title = "Auto Farm", Icon = "sword" }),
        Shop     = Window:AddTab({ Title = "Shop", Icon = "shopping-cart" }),
        User     = Window:AddTab({ Title = "User", Icon = "user" }),
        Settings = Window:AddTab({ Title = "Settings", Icon = "list" }) -- WAJIB ADA
    }

    -- ===== AUTO FARM =====
    Tabs.AutoFarm:AddButton({
        Title = "Start Fishing",
        Callback = function()
            Features.StartFishing()
        end
    })

    -- ===== SHOP =====
    Tabs.Shop:AddParagraph({
        Title = "Info",
        Content = "Belanja fitur test."
    })
    Tabs.Shop:AddButton({
        Title = "Buy Rod Upgrade",
        Callback = function()
            Features.BuyRod()
        end
    })

    -- ===== USER =====
    Tabs.User:AddButton({
        Title = "Print Player Name",
        Callback = function()
            print("LocalPlayer: ", LocalPlayer.Name)
        end
    })

    -- ===== SETTINGS (addon manager) =====
    SaveManager:SetLibrary(Fluent)
    InterfaceManager:SetLibrary(Fluent)

    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({})
    InterfaceManager:SetFolder("YS Hub")
    SaveManager:SetFolder("YS Hub/Configs")

    -- pakai defer biar kebaca setelah render
    task.defer(function()
        InterfaceManager:BuildInterfaceSection(Tabs.Settings)
        SaveManager:BuildConfigSection(Tabs.Settings)
        SaveManager:LoadAutoloadConfig()
    end)

    -- kasih notifikasi kalau berhasil load
    Fluent:Notify({
        Title = "YS Hub",
        Content = "UI berhasil dimuat dengan Fluent!",
        Duration = 5
    })
end

return UIModule
