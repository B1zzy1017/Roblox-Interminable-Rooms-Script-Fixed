-- LocalScript for ESP in workspace.OtherStuff

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

local folder = workspace:WaitForChild("OtherStuff") -- <<--- CHANGED


-- Find a BasePart to use as the adornee for ESP
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


-- Create ESP inside the object
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

    -------------------------
    -- Highlight ESP
    -------------------------
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    highlight.Adornee = adornee
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.7
    highlight.OutlineTransparency = 0
    highlight.Parent = espFolder

    -------------------------
    -- Billboard with Name & Distance
    -------------------------
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
    text.TextColor3 = Color3.new(1, 1, 1)
    text.TextScaled = true
    text.TextStrokeTransparency = 0
    text.Parent = billboard
end


-- Remove ESP folder
local function removeESP(obj)
    local esp = obj:FindFirstChild("ESP")
    if esp then esp:Destroy() end
end


-- Create ESP for existing objects
for _, item in ipairs(folder:GetChildren()) do
    createESP(item)
end

-- Create ESP for new objects
folder.ChildAdded:Connect(createESP)
folder.ChildRemoved:Connect(removeESP)


-- CONSTANT UPDATE LOOP
RunService.Heartbeat:Connect(function()
    for _, item in ipairs(folder:GetChildren()) do
        if not item:IsA("Folder") then
            local esp = item:FindFirstChild("ESP")

            -- create ESP if it appears later
            if not esp then
                createESP(item)
            else
                local adornee = findAdornee(item)
                if adornee then
                    -- Refresh Adornee in case the model loads parts later
                    if esp:FindFirstChild("Highlight") then
                        esp.Highlight.Adornee = adornee
                    end
                    if esp:FindFirstChild("NameTag") then
                        esp.NameTag.Adornee = adornee
                    end

                    -- Update distance
                    local label = esp.NameTag:FindFirstChild("Text")
                    if label then
                        local dist = (adornee.Position - root.Position).Magnitude
                        label.Text = string.format("%s (%d)", item.Name, dist)
                    end
                end
            end
        end
    end
end)
