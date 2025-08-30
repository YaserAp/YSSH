local KeyModule = {}
KeyModule.__index = KeyModule

local validKey = "jdja0klaiapKSmskao"

function KeyModule:Start(callback)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "KeySystemUI"
    ScreenGui.Parent = game.CoreGui

    -- Main Frame
    local Frame = Instance.new("Frame", ScreenGui)
    Frame.Size = UDim2.new(0, 380, 0, 240)
    Frame.Position = UDim2.new(0.5, -190, 0.5, -120)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    Frame.BorderSizePixel = 0
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 12)

    local stroke = Instance.new("UIStroke", Frame)
    stroke.Color = Color3.fromRGB(90, 90, 140)
    stroke.Thickness = 2
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    -- Gradient background
    local gradient = Instance.new("UIGradient", Frame)
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 35, 55)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 30))
    }
    gradient.Rotation = 90

    -- Layout
    local UIList = Instance.new("UIListLayout", Frame)
    UIList.Padding = UDim.new(0, 12)
    UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIList.VerticalAlignment = Enum.VerticalAlignment.Top
    UIList.SortOrder = Enum.SortOrder.LayoutOrder

    local UIPadding = Instance.new("UIPadding", Frame)
    UIPadding.PaddingTop = UDim.new(0, 15)
    UIPadding.PaddingLeft = UDim.new(0, 20)
    UIPadding.PaddingRight = UDim.new(0, 20)

    -- Title
    local Title = Instance.new("TextLabel", Frame)
    Title.Text = "🔑 Key System"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 22
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(1, -40, 0, 40)

    -- Input
    local TextBox = Instance.new("TextBox", Frame)
    TextBox.Size = UDim2.new(1, 0, 0, 40)
    TextBox.PlaceholderText = "Enter your key..."
    TextBox.Text = ""
    TextBox.TextSize = 16
    TextBox.Font = Enum.Font.Gotham
    TextBox.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.ClearTextOnFocus = false
    Instance.new("UICorner", TextBox).CornerRadius = UDim.new(0, 8)

    -- Check Key Button
    local CheckButton = Instance.new("TextButton", Frame)
    CheckButton.Size = UDim2.new(1, 0, 0, 40)
    CheckButton.Text = "✅ Check Key"
    CheckButton.Font = Enum.Font.GothamBold
    CheckButton.TextSize = 18
    CheckButton.BackgroundColor3 = Color3.fromRGB(60, 180, 110)
    CheckButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", CheckButton).CornerRadius = UDim.new(0, 8)

    -- Horizontal container (Get Key + Discord)
    local ButtonFrame = Instance.new("Frame", Frame)
    ButtonFrame.Size = UDim2.new(1, 0, 0, 40)
    ButtonFrame.BackgroundTransparency = 1
    local HLayout = Instance.new("UIListLayout", ButtonFrame)
    HLayout.FillDirection = Enum.FillDirection.Horizontal
    HLayout.Padding = UDim.new(0, 12)

    local GetKeyButton = Instance.new("TextButton", ButtonFrame)
    GetKeyButton.Size = UDim2.new(0.5, -6, 1, 0)
    GetKeyButton.Text = "📋 Get Key"
    GetKeyButton.Font = Enum.Font.Gotham
    GetKeyButton.TextSize = 16
    GetKeyButton.BackgroundColor3 = Color3.fromRGB(70, 130, 200)
    GetKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", GetKeyButton).CornerRadius = UDim.new(0, 8)

    local DiscordButton = Instance.new("TextButton", ButtonFrame)
    DiscordButton.Size = UDim2.new(0.5, -6, 1, 0)
    DiscordButton.Text = "💬 Discord"
    DiscordButton.Font = Enum.Font.Gotham
    DiscordButton.TextSize = 16
    DiscordButton.BackgroundColor3 = Color3.fromRGB(120, 90, 200)
    DiscordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", DiscordButton).CornerRadius = UDim.new(0, 8)

    -- Events
    GetKeyButton.MouseButton1Click:Connect(function()
        setclipboard("https://pastebin.com/raw/6G3QUYJk")
    end)

    DiscordButton.MouseButton1Click:Connect(function()
        setclipboard("https://discord.gg/yourserver")
    end)

    CheckButton.MouseButton1Click:Connect(function()
        if TextBox.Text == validKey then
            ScreenGui:Destroy()
            callback(true)
        else
            TextBox.Text = ""
            TextBox.PlaceholderText = "❌ Key salah!"
        end
    end)
end

return KeyModule
