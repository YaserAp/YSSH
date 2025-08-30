local KeyModule = {}
KeyModule.__index = KeyModule

local validKey = "jdja0klaiapKSmskao" -- contoh key

function KeyModule:Start(callback)
    -- Buat UI Key System modern
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "KeySystemUI"
    ScreenGui.Parent = game.CoreGui

    local Frame = Instance.new("Frame", ScreenGui)
    Frame.Size = UDim2.new(0, 350, 0, 200)
    Frame.Position = UDim2.new(0.5, -175, 0.5, -100)
    Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    Frame.BorderSizePixel = 0

    -- Rounded corner
    local UICorner = Instance.new("UICorner", Frame)
    UICorner.CornerRadius = UDim.new(0, 12)

    -- Stroke (outline halus)
    local UIStroke = Instance.new("UIStroke", Frame)
    UIStroke.Color = Color3.fromRGB(80, 80, 120)
    UIStroke.Thickness = 2

    -- Title
    local Title = Instance.new("TextLabel", Frame)
    Title.Size = UDim2.new(1, -20, 0, 40)
    Title.Position = UDim2.new(0, 10, 0, 5)
    Title.BackgroundTransparency = 1
    Title.Text = "🔑 Key System"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 20
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Center

    -- TextBox
    local TextBox = Instance.new("TextBox", Frame)
    TextBox.Size = UDim2.new(1, -40, 0, 35)
    TextBox.Position = UDim2.new(0, 20, 0, 55)
    TextBox.PlaceholderText = "Enter your key..."
    TextBox.Text = ""
    TextBox.TextSize = 16
    TextBox.Font = Enum.Font.Gotham
    TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.ClearTextOnFocus = false
    Instance.new("UICorner", TextBox).CornerRadius = UDim.new(0, 8)

    -- Button: Check Key
    local CheckButton = Instance.new("TextButton", Frame)
    CheckButton.Size = UDim2.new(1, -40, 0, 35)
    CheckButton.Position = UDim2.new(0, 20, 0, 100)
    CheckButton.Text = "✅ Check Key"
    CheckButton.TextSize = 16
    CheckButton.Font = Enum.Font.GothamBold
    CheckButton.BackgroundColor3 = Color3.fromRGB(60, 170, 90)
    CheckButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", CheckButton).CornerRadius = UDim.new(0, 8)

    -- Button: Get Key
    local GetKeyButton = Instance.new("TextButton", Frame)
    GetKeyButton.Size = UDim2.new(0.5, -25, 0, 35)
    GetKeyButton.Position = UDim2.new(0, 20, 0, 145)
    GetKeyButton.Text = "📋 Get Key"
    GetKeyButton.TextSize = 15
    GetKeyButton.Font = Enum.Font.Gotham
    GetKeyButton.BackgroundColor3 = Color3.fromRGB(70, 120, 200)
    GetKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", GetKeyButton).CornerRadius = UDim.new(0, 8)

    -- Button: Discord
    local DiscordButton = Instance.new("TextButton", Frame)
    DiscordButton.Size = UDim2.new(0.5, -25, 0, 35)
    DiscordButton.Position = UDim2.new(0.5, 5, 0, 145)
    DiscordButton.Text = "💬 Discord"
    DiscordButton.TextSize = 15
    DiscordButton.Font = Enum.Font.Gotham
    DiscordButton.BackgroundColor3 = Color3.fromRGB(120, 90, 180)
    DiscordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", DiscordButton).CornerRadius = UDim.new(0, 8)

    -- Event: tombol Get Key
    GetKeyButton.MouseButton1Click:Connect(function()
        setclipboard("https://pastebin.com/raw/6G3QUYJk")
    end)

    -- Event: tombol Discord
    DiscordButton.MouseButton1Click:Connect(function()
        setclipboard("https://discord.gg/yourserver")
    end)

    -- Event: tombol Check Key
    CheckButton.MouseButton1Click:Connect(function()
        if TextBox.Text == validKey then
            ScreenGui:Destroy()
            callback(true) -- sukses
        else
            TextBox.Text = ""
            TextBox.PlaceholderText = "❌ Key salah!"
        end
    end)
end

return KeyModule
