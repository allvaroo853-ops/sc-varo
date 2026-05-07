local Players = game:GetService("Players")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

-- hapus gui lama
pcall(function()
    game.CoreGui["private a copyright 2026©"]:Destroy()
end)

-- screen gui
local gui = Instance.new("ScreenGui")
gui.Name = "private a copyright 2026©"
gui.Parent = game.CoreGui

-- main frame
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0, 300, 0, 260)
frame.Position = UDim2.new(0.5, -150, 0.5, -130)
frame.BackgroundColor3 = Color3.fromRGB(10,10,10)
frame.BorderSizePixel = 0

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0,18)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(255,255,255)
stroke.Thickness = 1

-- title
local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1,0,0,45)
title.BackgroundTransparency = 1
title.Text = "private a copyright 2026©"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true

-- close button
local close = Instance.new("TextButton")
close.Parent = frame
close.Size = UDim2.new(0,35,0,35)
close.Position = UDim2.new(1,-40,0,5)
close.Text = "X"
close.Font = Enum.Font.GothamBold
close.TextScaled = true
close.BackgroundColor3 = Color3.fromRGB(20,20,20)
close.TextColor3 = Color3.new(1,1,1)
close.BorderSizePixel = 0

local closeCorner = Instance.new("UICorner", close)
closeCorner.CornerRadius = UDim.new(1,0)

-- open button
local openBtn = Instance.new("TextButton")
openBtn.Parent = gui
openBtn.Size = UDim2.new(0,55,0,55)
openBtn.Position = UDim2.new(0,15,0.5,-25)
openBtn.Text = "A"
openBtn.Font = Enum.Font.GothamBlack
openBtn.TextScaled = true
openBtn.BackgroundColor3 = Color3.fromRGB(15,15,15)
openBtn.TextColor3 = Color3.new(1,1,1)
openBtn.Visible = false
openBtn.BorderSizePixel = 0

local openCorner = Instance.new("UICorner", openBtn)
openCorner.CornerRadius = UDim.new(1,0)

local openStroke = Instance.new("UIStroke", openBtn)
openStroke.Color = Color3.fromRGB(255,255,255)

-- layout
local layout = Instance.new("UIListLayout")
layout.Parent = frame
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.Padding = UDim.new(0,12)
layout.SortOrder = Enum.SortOrder.LayoutOrder

title.LayoutOrder = 0

-- drag gui
local UIS = game:GetService("UserInputService")
local dragging
local dragInput
local dragStart
local startPos

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- tombol function
local function createButton(text, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = frame
    btn.Size = UDim2.new(0,260,0,42)
    btn.BackgroundColor3 = Color3.fromRGB(20,20,20)
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextScaled = true
    btn.TextColor3 = Color3.new(1,1,1)
    btn.BorderSizePixel = 0

    local c = Instance.new("UICorner", btn)
    c.CornerRadius = UDim.new(0,14)

    local s = Instance.new("UIStroke", btn)
    s.Color = Color3.fromRGB(255,255,255)

    btn.MouseButton1Click:Connect(callback)
end

-- headless visual
createButton("headless", function()
    local head = char:FindFirstChild("Head")

    if head then
        head.Transparency = 1

        for _,v in pairs(head:GetChildren()) do
            if v:IsA("Decal") then
                v.Transparency = 1
            end
        end
    end
end)

-- korblox kanan kiri
createButton("korblox right + left", function()
    local legs = {
        "Right Leg",
        "Left Leg",
        "RightLowerLeg",
        "LeftLowerLeg"
    }

    for _,name in pairs(legs) do
        local leg = char:FindFirstChild(name)

        if leg then
            leg.Transparency = 1
        end
    end
end)

-- emote visual
createButton("evade emote", function()
    local humanoid = char:FindFirstChildOfClass("Humanoid")

    if humanoid then
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://507771019"

        local track = humanoid:LoadAnimation(anim)
        track:Play()
    end
end)

-- close/open
close.MouseButton1Click:Connect(function()
    frame.Visible = false
    openBtn.Visible = true
end)

openBtn.MouseButton1Click:Connect(function()
    frame.Visible = true
    openBtn.Visible = false
end)
