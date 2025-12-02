-- LocalScript in StarterPlayerScripts

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

local entities = workspace:WaitForChild("Entities")

-- Finds a BasePart to attach the ESP to
local function findAdornee(obj)
    if obj:IsA("BasePart") then
        return obj
    end
    if obj:IsA("Model") then
        if obj.PrimaryPart then
            return obj.PrimaryPart
        end
        for _, d in ipairs(obj:GetDescendants()) do
            if d:IsA("BasePart") then
                return d
            end
        end
    end
    return nil
end

-- Creates ESP inside the entity
local function createESP(obj)
    if obj:FindFirstChild("ESP") then
        return
    end

    local adornee = findAdornee(obj)
    if not adornee then
        return
    end

    local espFolder = Instance.new("Folder")
    espFolder.Name = "ESP"
    espFolder.Parent = obj

    ------------------------------
    -- Highlight
    ------------------------------
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    highlight.Adornee = adornee
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.7
    highlight.OutlineTransparency = 0
    highlight.Parent = espFolder

    ------------------------------
    -- Name + Distance Billboard
    ------------------------------
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "NameTag"
    billboard.Adornee = adornee
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.AlwaysOnTop = true
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.Parent = espFolder

    local text = Instance.new("TextLabel")
    text.BackgroundTransparency = 1
    text.Size = UDim2.new(1, 0, 1, 0)
    text.Font = Enum.Font.GothamBold
    text.TextColor3 = Color3.new(1, 1, 1)
    text.TextScaled = true
    text.TextStrokeTransparency = 0
    text.Name = "Text"
    text.Parent = billboard

    -- Initial text
    text.Text = obj.Name .. " (0)"
end

-- Removes ESP
local function removeESP(obj)
    local esp = obj:FindFirstChild("ESP")
    if esp then esp:Destroy() end
end

-- Apply ESP to existing
for _, entity in ipairs(entities:GetChildren()) do
    createESP(entity)
end

-- Apply ESP to new entities
entities.ChildAdded:Connect(createESP)
entities.ChildRemoved:Connect(removeESP)

-- CONSTANT UPDATE LOOP
RunService.Heartbeat:Connect(function()
    for _, entity in ipairs(entities:GetChildren()) do
        if not entity:IsA("Folder") then
            local esp = entity:FindFirstChild("ESP")
            if not esp then
                createESP(entity)
            else
                local adornee = findAdornee(entity)
                if adornee then
                    -- update Highlight + NameTag adornee
                    if esp:FindFirstChild("Highlight") then
                        esp.Highlight.Adornee = adornee
                    end
                    if esp:FindFirstChild("NameTag") then
                        esp.NameTag.Adornee = adornee
                    end

                    -- update distance text
                    local textLabel = esp:FindFirstChild("NameTag") and esp.NameTag:FindFirstChild("Text")
                    if textLabel then
                        local dist = (adornee.Position - root.Position).Magnitude
                        textLabel.Text = string.format("%s (%d)", entity.Name, dist)
                    end
                end
            end
        end
    end
end)
