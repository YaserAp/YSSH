local KeyModule = {}
KeyModule.__index = KeyModule

local validKey = "jdja0klaiapKSmskao" -- contoh, nanti bisa ambil dari pastebin/remote

function KeyModule:Start(callback)
    -- Buat UI Key System sederhana
    local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
    local Frame = Instance.new("Frame", ScreenGui)
    Frame.Size = UDim2.new(0, 300, 0, 150)
    Frame.Position = UDim2.new(0.5, -150, 0.5, -75)

    local TextBox = Instance.new("TextBox", Frame)
    TextBox.Size = UDim2.new(1, -20, 0, 30)
    TextBox.Position = UDim2.new(0, 10, 0, 10)
    TextBox.PlaceholderText = "Enter Key"

    local CheckButton = Instance.new("TextButton", Frame)
    CheckButton.Size = UDim2.new(1, -20, 0, 30)
    CheckButton.Position = UDim2.new(0, 10, 0, 50)
    CheckButton.Text = "Check Key"

    local GetKeyButton = Instance.new("TextButton", Frame)
    GetKeyButton.Size = UDim2.new(0.5, -15, 0, 30)
    GetKeyButton.Position = UDim2.new(0, 10, 0, 90)
    GetKeyButton.Text = "Get Key"

    local DiscordButton = Instance.new("TextButton", Frame)
    DiscordButton.Size = UDim2.new(0.5, -15, 0, 30)
    DiscordButton.Position = UDim2.new(0.5, 5, 0, 90)
    DiscordButton.Text = "Discord"

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
            TextBox.PlaceholderText = "Key salah!"
        end
    end)
end

return KeyModule
