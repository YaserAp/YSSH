local UIModule = {}
UIModule.__index = UIModule

function UIModule:Open(config)
    local Features = config.Features

    local Luna = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/master/source.lua"))()

    local Window = Luna:CreateWindow({
        Name = "YS Hub",
        Icon = "rbxassetid://6022668898",
        HidePremium = false,

        LoadingEnabled = false, 
        LoadingTitle = "",
        LoadingSubtitle = "",
    })

    local TabMain = Window:CreateTab({
        Name = "Main Features",
        Icon = "rbxassetid://6034509993"
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

    local TabMisc = Window:CreateTab({
        Name = "Misc",
        Icon = "rbxassetid://6034509992"
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
