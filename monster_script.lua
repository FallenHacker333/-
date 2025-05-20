local monsterModel = Instance.new("Model")
monsterModel.Name = "Demon"

local head = Instance.new("Part")
head.Name = "Head"
head.Size = Vector3.new(2, 1, 2)
head.Position = Vector3.new(0, 5, 0)
head.BrickColor = BrickColor.new("Really red")
head.Parent = monsterModel

local body = Instance.new("Part")
body.Name = "Body"
body.Size = Vector3.new(2, 3, 1)
body.Position = Vector3.new(0, 3, 0)
body.BrickColor = BrickColor.new("Black")
body.Parent = monsterModel

local humanoid = Instance.new("Humanoid")
humanoid.Parent = monsterModel

local function spawnMonster(position)
    local newMonster = monsterModel:Clone()
    newMonster:SetPrimaryPartCFrame(CFrame.new(position))
    newMonster.Parent = workspace
    
    spawn(function()
        while newMonster.Parent do
            wait(0.5)
            local nearestPlayer = nil
            local shortestDistance = math.huge
            for _, player in pairs(game.Players:GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local dist = (player.Character.HumanoidRootPart.Position - newMonster.PrimaryPart.Position).magnitude
                    if dist < shortestDistance then
                        shortestDistance = dist
                        nearestPlayer = player
                    end
                end
            end
            
            if nearestPlayer and nearestPlayer.Character and nearestPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local targetPos = nearestPlayer.Character.HumanoidRootPart.Position
                newMonster.PrimaryPart.CFrame = newMonster.PrimaryPart.CFrame:Lerp(CFrame.new(targetPos) * CFrame.new(0,0,2), 0.3)
            end
        end
    end)
end

spawnMonster(Vector3.new(10, 5, 10))
spawnMonster(Vector3.new(-15, 5, 20))
spawnMonster(Vector3.new(0, 5, -10))
