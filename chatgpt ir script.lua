local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local root

-- Rebind root on respawn
local function onCharacterAdded(character)
    root = character:WaitForChild("HumanoidRootPart")
end

if player.Character then
    onCharacterAdded(player.Character)
end
player.CharacterAdded:Connect(onCharacterAdded)

local entities = workspace:WaitForChild("Entities")

-- Distance thresholds (studs)
local NEAR_DISTANCE = 150
local FAR_DISTANCE = 300

-- Convert distance → color (Green → Yellow → Red)
local function getDistanceColor(distance)
    if distance <= NEAR_DISTANCE then
        -- Green → Yellow
        local t = distance / NEAR_DISTANCE
        return Color3.new(t, 1, 0)
    else
        -- Yellow → Red
        local t = math.clamp((distance - NEAR_DISTANCE) / (FAR_DISTANCE - NEAR_DISTANCE), 0, 1)
        return Color3.new(1, 1 - t, 0)
    end
end

-- Find adornee
local function findAdornee(obj)
    if obj:IsA("BasePart") then
        return obj
    end
    if obj:IsA("Model") then
        if obj.PrimaryPart then return obj.PrimaryPart end
        for _, d in ipairs(obj:GetDescendants()) do
            if d:IsA("BasePart") then return d end
        end
    end
    return nil
end

-- Create ESP
local function createESP(obj)
    if obj:FindFirstChild("ESP") then return end

    local adornee = findAdornee(obj)
    if not adornee then return end

    local espFolder = Instance.new("Folder")
    espFolder.Name = "ESP"
    espFolder.Parent = obj

    -- Highlight
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    highlight.Adornee = adornee
    highlight.FillTransparency = 0.6
    highlight.OutlineTransparency = 0
    highlight.Parent = espFolder

    -- Billboard
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "NameTag"
    billboard.Adornee = adornee
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.AlwaysOnTop = true
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.Parent = espFolder

    local text = Instance.new("TextLabel")
    text.Name = "Text"
    text.BackgroundTransparency = 1
    text.Size = UDim2.new(1, 0, 1, 0)
    text.Font = Enum.Font.GothamBold
    text.TextScaled = true
    text.TextStrokeTransparency = 0
    text.Parent = billboard
end

-- Remove ESP
local function removeESP(obj)
    local esp = obj:FindFirstChild("ESP")
    if esp then esp:Destroy() end
end

-- Existing entities
for _, entity in ipairs(entities:GetChildren()) do
    createESP(entity)
end

entities.ChildAdded:Connect(createESP)
entities.ChildRemoved:Connect(removeESP)

-- Update loop
RunService.Heartbeat:Connect(function()
    if not root then return end

    for _, entity in ipairs(entities:GetChildren()) do
        local esp = entity:FindFirstChild("ESP")
        if not esp then
            createESP(entity)
        else
            local adornee = findAdornee(entity)
            if adornee then
                -- Distance
                local distance = (adornee.Position - root.Position).Magnitude
                local color = getDistanceColor(distance)

                -- Update highlight
                local highlight = esp:FindFirstChild("Highlight")
                if highlight then
                    highlight.Adornee = adornee
                    highlight.FillColor = color
                    highlight.OutlineColor = color
                end

                -- Update name + distance
                local nameTag = esp:FindFirstChild("NameTag")
                if nameTag then
                    nameTag.Adornee = adornee
                    local label = nameTag:FindFirstChild("Text")
                    if label then
                        label.TextColor3 = color
                        label.Text = string.format("%s (%d)", entity.Name, distance)
                    end
                end
            end
        end
    end
end)
