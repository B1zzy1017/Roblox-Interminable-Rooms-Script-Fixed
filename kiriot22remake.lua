--// Settings
local ESP = {
    Enabled = false,
    Boxes = true,
    BoxShift = CFrame.new(0,-1.5,0),
    BoxSize = Vector3.new(4,6,0),
    Color = Color3.fromRGB(255,170,0),
    FaceCamera = false,
    Names = true,
    TeamColor = true,
    Thickness = 2,
    AttachShift = 1,
    TeamMates = true,
    Players = true,

    LifeSpan = 15, --// FIX: auto cleanup time (seconds)

    Objects = {},         -- [Instance] = box
    Instances = {},       -- [UniqueId] = box  --// FIX
    Overrides = {}
}

--// Declarations
local cam = workspace.CurrentCamera
local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer
local mouse = plr:GetMouse()
local RunService = game:GetService("RunService")

local V3new = Vector3.new
local WorldToViewportPoint = cam.WorldToViewportPoint

--// Utils
local function UID(obj)
    return tostring(obj:GetDebugId())
end

local function Draw(obj, props)
    local d = Drawing.new(obj)
    for i,v in pairs(props or {}) do
        d[i] = v
    end
    d.Visible = false
    return d
end

--// Team helpers (unchanged)
function ESP:GetTeam(p)
    return self.Overrides.GetTeam and self.Overrides.GetTeam(p) or p and p.Team
end

function ESP:IsTeamMate(p)
    return self.Overrides.IsTeamMate and self.Overrides.IsTeamMate(p)
        or self:GetTeam(p) == self:GetTeam(plr)
end

function ESP:GetPlrFromChar(char)
    return self.Overrides.GetPlrFromChar and self.Overrides.GetPlrFromChar(char)
        or plrs:GetPlayerFromCharacter(char)
end

function ESP:GetColor(obj)
    local ov = self.Overrides.GetColor
    if ov then return ov(obj) end
    local p = self:GetPlrFromChar(obj)
    return p and self.TeamColor and p.Team and p.Team.TeamColor.Color or self.Color
end

function ESP:Toggle(b)
    self.Enabled = b
    if not b then
        for _,v in pairs(self.Instances) do
            for _,c in pairs(v.Components) do
                c.Visible = false
            end
        end
    end
end

function ESP:GetBox(obj)
    return self.Objects[obj]
end

--// Box base
local boxBase = {}
boxBase.__index = boxBase

function boxBase:Remove()
    ESP.Objects[self.Object] = nil
    ESP.Instances[self.Id] = nil

    if self.Connection then
        self.Connection:Disconnect()
        self.Connection = nil
    end

    for i,v in pairs(self.Components) do
        v.Visible = false
        v:Remove()
        self.Components[i] = nil
    end
end

function boxBase:Update()
    self.LastUpdate = tick() --// FIX: refresh lifetime

    if not self.PrimaryPart then
        return self:Remove()
    end

    local color = self.Color or self.ColorDynamic and self:ColorDynamic() or ESP:GetColor(self.Object)

    local allow = true
    if self.Player and not ESP.TeamMates and ESP:IsTeamMate(self.Player) then allow = false end
    if self.Player and not ESP.Players then allow = false end
    if not workspace:IsAncestorOf(self.PrimaryPart) and not self.RenderInNil then allow = false end

    if not allow then
        for _,v in pairs(self.Components) do v.Visible = false end
        return
    end

    local cf = self.PrimaryPart.CFrame
    if ESP.FaceCamera then
        cf = CFrame.new(cf.p, cam.CFrame.p)
    end

    local size = self.Size
    local locs = {
        TL = cf * ESP.BoxShift * CFrame.new(size.X/2,size.Y/2,0),
        TR = cf * ESP.BoxShift * CFrame.new(-size.X/2,size.Y/2,0),
        BL = cf * ESP.BoxShift * CFrame.new(size.X/2,-size.Y/2,0),
        BR = cf * ESP.BoxShift * CFrame.new(-size.X/2,-size.Y/2,0),
        Tag = cf * ESP.BoxShift * CFrame.new(0,size.Y/2,0)
    }

    if ESP.Boxes then
        local a,v1 = WorldToViewportPoint(cam, locs.TL.p)
        local b,v2 = WorldToViewportPoint(cam, locs.TR.p)
        local c,v3 = WorldToViewportPoint(cam, locs.BL.p)
        local d,v4 = WorldToViewportPoint(cam, locs.BR.p)

        if v1 or v2 or v3 or v4 then
            local q = self.Components.Quad
            q.Visible = true
            q.PointA = Vector2.new(b.X,b.Y)
            q.PointB = Vector2.new(a.X,a.Y)
            q.PointC = Vector2.new(c.X,c.Y)
            q.PointD = Vector2.new(d.X,d.Y)
            q.Color = color
        else
            self.Components.Quad.Visible = false
        end
    end

    if ESP.Names then
        local p,v = WorldToViewportPoint(cam, locs.Tag.p)
        if v then
            self.Components.Name.Visible = true
            self.Components.Name.Text = self.Name
            self.Components.Name.Position = Vector2.new(p.X,p.Y)
            self.Components.Name.Color = color
        else
            self.Components.Name.Visible = false
        end
    end
end

--// Add ESP
function ESP:Add(obj, options)
    if not obj then return end

    local box = setmetatable({
        Id = UID(obj),           --// FIX: unique ID
        Object = obj,
        Name = options.Name or obj.Name,
        Color = options.Color,
        Size = options.Size or self.BoxSize,
        Player = options.Player or plrs:GetPlayerFromCharacter(obj),
        PrimaryPart = options.PrimaryPart,
        Components = {},
        LastUpdate = tick(),
        RenderInNil = options.RenderInNil
    }, boxBase)

    box.Components.Quad = Draw("Quad", {
        Thickness = self.Thickness,
        Filled = false
    })

    box.Components.Name = Draw("Text", {
        Center = true,
        Outline = true,
        Size = 19
    })

    box.Connection = RunService.RenderStepped:Connect(function()
        box:Update()
    end)

    self.Objects[obj] = box
    self.Instances[box.Id] = box

    return box
end

--// Global cleanup (FIXES LAG)
RunService.RenderStepped:Connect(function()
    cam = workspace.CurrentCamera
    local now = tick()

    for _,box in pairs(ESP.Instances) do
        if now - box.LastUpdate > ESP.LifeSpan then
            box:Remove()
        end
    end
end)

return ESP
