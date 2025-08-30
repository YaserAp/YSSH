local UIModule = {}
UIModule.__index = UIModule

function UIModule:Open(config)
    local Features = config.Features

    -- Load Luna UI
    local Luna = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/master/source.lua"))()

    -- Buat window utama (langsung tanpa splash screen)
    local Window = Luna:CreateWindow({
        Name = "YS Hub",
        Icon = "rbxassetid://6022668898", -- opsional
        HidePremium = false,

        -- Tambahan biar nggak ada splash
        LoadingEnabled = false, 
        LoadingTitle = "",
        LoadingSubtitle = "",
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
