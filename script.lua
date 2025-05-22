local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FlyGui"
screenGui.Parent = playerGui

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 200, 0, 30)
textBox.Position = UDim2.new(0.5, -100, 0.4, 0)
textBox.PlaceholderText = "اكتب اسم اللاعب هنا"
textBox.Parent = screenGui

local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0, 100, 0, 30)
flyButton.Position = UDim2.new(0.5, -50, 0.5, 0)
flyButton.Text = "تأكيد الطيران"
flyButton.Parent = screenGui

flyButton.MouseButton1Click:Connect(function()
    local targetName = textBox.Text
    local target = game.Players:FindFirstChild(targetName)
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        -- رفع اللاعب 50 وحدة فوق الأرض
        local hrp = target.Character.HumanoidRootPart
        hrp.CFrame = hrp.CFrame + Vector3.new(0, 50, 0)
    else
        warn("اللاعب مش موجود أو الشخصية غير كاملة")
    end
end)
