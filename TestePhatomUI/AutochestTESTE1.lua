local AutoChestSystem = {}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

local Running = false
local Thread = nil

local ChestBlacklist = {}
local Speed = 350

-- FUNÇÃO PEGAR CHEST
local function getClosestChest()
    local ChestModels = workspace:FindFirstChild("ChestModels")
    if not ChestModels then return nil end
    
    local closest, dist = nil, math.huge
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return nil end

    for _, chest in ipairs(ChestModels:GetChildren()) do
        if chest:IsA("Model") and chest.PrimaryPart and not ChestBlacklist[chest] then
            local d = (char.HumanoidRootPart.Position - chest.PrimaryPart.Position).Magnitude
            if d < dist then
                closest = chest
                dist = d
            end
        end
    end

    return closest
end

-- TELEPORT SIMPLES (leve)
local function goTo(pos)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = CFrame.new(pos)
    end
end

-- LOOP PRINCIPAL
local function loop()
    while Running do
        task.wait(0.3)

        pcall(function()
            local chest = getClosestChest()
            if chest and chest.PrimaryPart then
                goTo(chest.PrimaryPart.Position)
                ChestBlacklist[chest] = true
            end
        end)
    end
end

-- API START/STOP
function AutoChestSystem:Toggle(state)
    Running = state

    if state then
        if Thread then return end
        Thread = task.spawn(loop)
    else
        Thread = nil
    end
end

return AutoChestSystem
