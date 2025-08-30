-- ui.lua
-- Modul UI utama dengan Luna Interface Suite
local UIModule = {}
UIModule.__index = UIModule

-- Preset themes
local Themes = {
    Dark = {
        BackgroundColor = Color3.fromRGB(25, 25, 30),
        AccentColor = Color3.fromRGB(0, 170, 255),
        TitleColor = Color3.fromRGB(220, 220, 220),
    },
    Neon = {
        BackgroundColor = Color3.fromRGB(15, 15, 20),
        AccentColor = Color3.fromRGB(255, 0, 150), -- pink neon
        TitleColor = Color3.fromRGB(255, 255, 255),
    },
    Minimal = {
        BackgroundColor = Color3.fromRGB(240, 240, 240),
        AccentColor = Color3.fromRGB(60, 120, 200), -- biru clean
        TitleColor = Color3.fromRGB(30, 30, 30),
    }
}

function UIModule:Open(config)
    local Features = config.Features
    local ThemeChoice = config.Theme or "Dark" -- default Dark

    local Theme = Themes[ThemeChoice] or Themes.Dark

    -- Load Luna UI
    local Luna = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/master/source.lua"))()

    -- Buat window utama (langsung tanpa splash screen)
    local Window = Luna:CreateWindow({
        Name = "YS Hub",
        Icon = "rbxassetid://6022668898",
        HidePremium = false,

        -- Hilangin splash
        LoadingEnabled = false, 

        -- Apply theme
        Theme = ThemeChoice,
        BackgroundColor = Theme.BackgroundColor,
        AccentColor = Theme.AccentColor,
        TitleColor = Theme.TitleColor,
    })

    -- Tab utama
    local TabMain = Window:CreateTab({
        Name = "Main Features"
    })

    local SectionTools = TabMain:CreateSection({
        Name = "Tools"
    })

    SectionTools:CreateButton({
        Name = "Do Something",
        Callback = function()
            Features.DoSomething()
        end
    })

    SectionTools:CreateButton({
        Name = "Another Feature",
        Callback = function()
            Features.AnotherFeature()
        end
    })

    -- Tab kedua (Misc)
    local TabMisc = Window:CreateTab({
        Name = "Misc"
    })

    local SectionMisc = TabMisc:CreateSection({
        Name = "Extra"
    })

    SectionMisc:CreateButton({
        Name = "Print Hello",
        Callback = function()
            print("Hello from Misc tab!")
        end
    })
end

return UIModule
