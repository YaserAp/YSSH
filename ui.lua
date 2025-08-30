local UIModule = {}
UIModule.__index = UIModule

function UIModule:Open(config)
    local Features = config.Features

    -- load Fluent
    local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/main/Fluent.lua"))()

    local Window = Fluent:CreateWindow({
        Title = "YS Hub",
        SubTitle = "BumiAksaraTeknologi",
        TabWidth = 160,
        Size = UDim2.fromOffset(500, 350),
        Acrylic = false, -- transparansi Windows 11 style
        Theme = "Dark",  -- bisa "Dark" / "Light"
        MinimizeKey = Enum.KeyCode.LeftControl
    })

    -- TAB 1
    local TabMain = Window:AddTab({ Title = "Main Features", Icon = "settings" })

    local SectionTools = TabMain:AddSection("Tools")

    SectionTools:AddButton({
        Title = "Do Something",
        Callback = function()
            Features.DoSomething()
        end
    })

    SectionTools:AddButton({
        Title = "Another Feature",
        Callback = function()
            Features.AnotherFeature()
        end
    })

    -- TAB 2
    local TabMisc = Window:AddTab({ Title = "Misc", Icon = "package" })

    local SectionMisc = TabMisc:AddSection("Extra")

    SectionMisc:AddButton({
        Title = "Print Hello",
        Callback = function()
            print("Hello from Misc tab!")
        end
    })

    SectionMisc:AddParagraph({
        Title = "Info",
        Content = "Misc Tab Loaded Successfully."
    })

    Window:SelectTab(1) -- default ke tab pertama
end

return UIModule
