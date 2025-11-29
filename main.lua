local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/refs/heads/main/source.lua'))()

--Window
local Window = Rayfield:CreateWindow({
   Name = "Interminable Rooms | V5 Beta)",
   LoadingTitle = "An Interminable Rooms Script",
   LoadingSubtitle = "by Nenarus#3186 (Remade by B1zzy1017)",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD.
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Sirius Hub",
      Subtitle = "Key System",
      Note = "Join the discord (discord.gg/sirius)",
      FileName = "SiriusKey",
      SaveKey = true,
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = "Hello"
   }
})

--Welcome Notification
Rayfield:Notify({
   Title = "Interminable Rooms Script",
   Content = "Successfully loaded! This script is incomplete, so expect bugs.",
   Duration = 5,
   Image = 4483362458,
})



--Tabs 
local Tab = Window:CreateTab("Main", 4483362458)
local Tab4 = Window:CreateTab("5Green's Mods", 4483362458)
local Tab2 = Window:CreateTab("Entity Tips (after af23)", 4483362458)
local Tab5 = Window:CreateTab("Entity Tips (more in depth)", 4483362458)
local Tab3 = Window:CreateTab("Credits", 4483362458)
local Tab6 = Window:CreateTab("Change Logs", 4483362458)


--Interminable Rooms Game Files
local EntitiesFolder = Workspace:WaitForChild("Entities")
local sd


local Section = Tab:CreateSection("Entity Notifiers")


local connection

local Toggle = Tab:CreateToggle({
    Name = "Notify Entities",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        if Value then
            connection = EntitiesFolder.ChildAdded:Connect(function(entity)
                Rayfield:Notify({
                   Title = entity.Name,
                   Content = "Has spawned.",
                   Duration = 5,
                   Image = 4483362458,
                })
            end)
        else
            connection:Disconnect()
        end
    end,
})

local Toggle = Tab:CreateToggle({
    Name = "Notify Entities Being Deleted",
    CurrentValue = false,
    Flag = "Toggle2",
    Callback = function(Value)
        if Value then
            connection = EntitiesFolder.ChildRemoved:Connect(function(entity)
                Rayfield:Notify({
                   Title = entity.Name,
                   Content = "Has despawned.",
                   Duration = 5,
                   Image = 4483362458,
                })
            end)
        else
            connection:Disconnect()
        end
    end,
})


local Section = Tab4:CreateSection("Instant Interact")

local connection3
local Toggle = Tab4:CreateToggle({
    Name = "Instant Interact",
    CurrentValue = false,
    Flag = "Toggle6",
    Callback = function(Value9)
        if Value9 then
            connection3 = game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
                fireproximityprompt(prompt)
            end)
        else
            if connection3 then
                connection3:Disconnect()
                connection3 = nil
            end
        end
    end,
})




local Section = Tab4:CreateSection("Full Heal")

local connection2
local Button = Tab4:CreateButton({
    Name = "Instantly Heal Back to 100 HP (Client health only)",
    Callback = function()
            game.Players.LocalPlayer.Character.Humanoid.Health = 100
  		end,
	 })





local Section = Tab4:CreateSection("Ignore Entities")

local connection4
local Toggle = Tab4:CreateToggle({
    Name = "Godmode (NOT WORKING)",
    CurrentValue = false,
    Flag = "Toggle8",
    Callback = function(Value11)
        if Value11 then
            workspace.Values.A10.Value = true
        else
            if connection4 then
                connection4:Disconnect()
                connection4 = nil
            end
        end
    end,
})




local Section = Tab4:CreateSection("Ignore Jumpscares")



local connection7












local connection27




























local Section = Tab:CreateSection("ESP")


local Button = Tab:CreateButton({
   Name = "Entity ESP",
   Callback = function()
    EntitiesFolder.ChildAdded:Connect(function(entity) 
	pcall(function()
   -- loadstring
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()

-- config
ESP.Players = false
ESP.Boxes = true
ESP.Names = true
ESP:Toggle(true)

-- object
for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-10" then
ESP:AddObjectListener(Workspace.Entities["A-10"], { 
    Name = "Torso", 
    CustomName = 'A-15', 
    Color = Color3.fromRGB(0, 21, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "X-10" then
ESP:AddObjectListener(Workspace.Entities["X-10"], { 
    Name = "Torso", 
    CustomName = 'X-15', 
    Color = Color3.fromRGB(19, 254, 254), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-35" then
ESP:AddObjectListener(Workspace.Entities["A-35"], { 
    Name = "Torso", 
    CustomName = 'A-35', 
    Color = Color3.fromRGB(0, 255, 89), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "X-35" then
ESP:AddObjectListener(Workspace.Entities["X-35"], { 
    Name = "Torso", 
    CustomName = 'X-35', 
    Color = Color3.fromRGB(255, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-60" then
ESP:AddObjectListener(Workspace.Entities["A-60"], { 
    Name = "Torso", 
    CustomName = 'A-60', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "X-60" then
ESP:AddObjectListener(Workspace.Entities["X-60"], { 
    Name = "Torso", 
    CustomName = 'X-60', 
    Color = Color3.fromRGB(255, 255, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-80" then
ESP:AddObjectListener(Workspace.Entities["A-80"], { 
    Name = "Torso", 
    CustomName = 'A-80', 
    Color = Color3.fromRGB(0, 199, 27), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "also A-80" then
ESP:AddObjectListener(Workspace.Entities["also A-80"], { 
    Name = "Torso", 
    CustomName = 'Old A-80', 
    Color = Color3.fromRGB(0, 199, 27), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-100" then
ESP:AddObjectListener(Workspace.Entities["A-100"], { 
    Name = "Torso", 
    CustomName = 'A-100', 
    Color = Color3.fromRGB(243, 5, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-120" then
ESP:AddObjectListener(Workspace.Entities["A-120"], { 
    Name = "Torso", 
    CustomName = 'A-120', 
    Color = Color3.fromRGB(251, 255, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-120 Minion" then
ESP:AddObjectListener(Workspace.Entities["A-120 Minion"], { 
    Name = "Torso", 
    CustomName = 'M-120-A', 
    Color = Color3.fromRGB(251, 255, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-150" then
ESP:AddObjectListener(Workspace.Entities["A-150"], { 
    Name = "Torso", 
    CustomName = 'A-150', 
    Color = Color3.fromRGB(0, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-183" then
ESP:AddObjectListener(Workspace.Entities["A-183"], { 
    Name = "Torso", 
    CustomName = 'A-183', 
    Color = Color3.fromRGB(247, 154, 5), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-200" then
ESP:AddObjectListener(Workspace.Entities["A-200"], { 
    Name = "Torso", 
    CustomName = 'A-200', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "X-200" then
ESP:AddObjectListener(Workspace.Entities["X-200"], { 
    Name = "Torso", 
    CustomName = 'X-200', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-245" then
ESP:AddObjectListener(Workspace.Entities["A-245"], { 
    Name = "Torso", 
    CustomName = 'A-245', 
    Color = Color3.fromRGB(79, 255, 155), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-258" then
ESP:AddObjectListener(Workspace.Entities["A-258"], { 
    Name = "Torso", 
    CustomName = 'A-258', 
    Color = Color3.fromRGB(255, 174, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-278" then
ESP:AddObjectListener(Workspace.Entities["A-278"], { 
    Name = "Torso", 
    CustomName = 'A-278', 
    Color = Color3.fromRGB(183, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "ULB-278" then
ESP:AddObjectListener(Workspace.Entities["ULB-278"], { 
    Name = "Torso", 
    CustomName = 'ULB-278', 
    Color = Color3.fromRGB(0, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "TLAB-278" then
ESP:AddObjectListener(Workspace.Entities["TLAB-278"], { 
    Name = "Torso", 
    CustomName = 'TLAB-278', 
    Color = Color3.fromRGB(212, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-300" then
ESP:AddObjectListener(Workspace.Entities["A-300"], { 
    Name = "Torso", 
    CustomName = 'A-300', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-332" then
ESP:AddObjectListener(Workspace.Entities["A-332"], { 
    Name = "Torso", 
    CustomName = 'A-332', 
    Color = Color3.fromRGB(5, 250, 197), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-350" then
ESP:AddObjectListener(Workspace.Entities["A-350"], { 
    Name = "Torso", 
    CustomName = 'A-350', 
    Color = Color3.fromRGB(100, 100, 100), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "E-1" then
ESP:AddObjectListener(Workspace.Entities["E-1"], { 
    Name = "Torso", 
    CustomName = 'E-1', 
    Color = Color3.fromRGB(250, 246, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XE-1" then
ESP:AddObjectListener(Workspace.Entities["XE-1"], { 
    Name = "Torso", 
    CustomName = 'XE-1', 
    Color = Color3.fromRGB(104, 252, 206), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "DG-1" then
ESP:AddObjectListener(Workspace.Entities["DG-1"], { 
    Name = "Torso", 
    CustomName = 'DG-1', 
    Color = Color3.fromRGB(238, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "CHA-1" then
ESP:AddObjectListener(Workspace.Entities["CHA-1"], { 
    Name = "Torso", 
    CustomName = 'CHA-1', 
    Color = Color3.fromRGB(104, 252, 206), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "BM-1" then
ESP:AddObjectListener(Workspace.Entities["BM-1"], { 
    Name = "Torso", 
    CustomName = 'BM-1', 
    Color = Color3.fromRGB(99, 1, 1), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "E-22" then
ESP:AddObjectListener(Workspace.Entities["E-22"], { 
    Name = "Torso", 
    CustomName = 'E-22', 
    Color = Color3.fromRGB(252, 128, 57), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XE-22" then
ESP:AddObjectListener(Workspace.Entities["XE-22"], { 
    Name = "Torso", 
    CustomName = 'XE-22', 
    Color = Color3.fromRGB(0, 255, 247), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "E-42LEFT" then
ESP:AddObjectListener(Workspace.Entities["E-42LEFT"], { 
    Name = "Torso", 
    CustomName = 'E-42', 
    Color = Color3.fromRGB(255, 201, 219), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "E-42RIGHT" then
ESP:AddObjectListener(Workspace.Entities["E-42RIGHT"], { 
    Name = "Torso", 
    CustomName = 'E-42', 
    Color = Color3.fromRGB(255, 201, 219), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "E-42" then
ESP:AddObjectListener(Workspace.Entities["E-42"], { 
    Name = "Torso", 
    CustomName = 'E-42', 
    Color = Color3.fromRGB(255, 201, 219), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "E-60" then
ESP:AddObjectListener(Workspace.Entities["E-60"], { 
    Name = "Torso", 
    CustomName = 'E-60', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "E-142" then
ESP:AddObjectListener(Workspace.Entities["E-142"], { 
    Name = "Torso", 
    CustomName = 'E-142', 
    Color = Color3.fromRGB(252, 0, 194), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "E-144" then
ESP:AddObjectListener(Workspace.Entities["E-144"], { 
    Name = "Torso", 
    CustomName = 'E-144', 
    Color = Color3.fromRGB(0, 255, 131), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "E-200" then
ESP:AddObjectListener(Workspace.Entities["E-200"], { 
    Name = "Torso", 
    CustomName = 'E-200', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "V-5" then
ESP:AddObjectListener(Workspace.Entities["V-5"], { 
    Name = "Torso", 
    CustomName = 'V-5', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XV-5" then
ESP:AddObjectListener(Workspace.Entities["XV-5"], { 
    Name = "Torso", 
    CustomName = 'XV-5', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "V-27" then
ESP:AddObjectListener(Workspace.Entities["V-27"], { 
    Name = "Torso", 
    CustomName = 'V-27', 
    Color = Color3.fromRGB(200, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "V-35" then
ESP:AddObjectListener(Workspace.Entities["V-35"], { 
    Name = "Torso", 
    CustomName = 'V-35', 
    Color = Color3.fromRGB(197, 2, 204), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "V-50" then
ESP:AddObjectListener(Workspace.Entities["V-50"], { 
    Name = "Torso", 
    CustomName = 'V-50', 
    Color = Color3.fromRGB(187, 84, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-221" then
ESP:AddObjectListener(Workspace.Entities["A-221"], { 
    Name = "Torso", 
    CustomName = 'A-221 (RIP)', 
    Color = Color3.fromRGB(0, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-246" then
ESP:AddObjectListener(Workspace.Entities["A-246"], { 
    Name = "Torso", 
    CustomName = 'A-246 (RIP)', 
    Color = Color3.fromRGB(182, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XX-10" then
ESP:AddObjectListener(Workspace.Entities["XX-10"], { 
    Name = "Torso", 
    CustomName = 'XX-15', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XX-35" then
ESP:AddObjectListener(Workspace.Entities["XX-35"], { 
    Name = "Torso", 
    CustomName = 'XX-35', 
    Color = Color3.fromRGB(0, 75, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-50" then
ESP:AddObjectListener(Workspace.Entities["A-50"], { 
    Name = "Torso", 
    CustomName = 'FAKER', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XX-60" then
ESP:AddObjectListener(Workspace.Entities["XX-60"], { 
    Name = "Torso", 
    CustomName = 'XX-60', 
    Color = Color3.fromRGB(0, 255, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-220" then
ESP:AddObjectListener(Workspace.Entities["A-220"], { 
    Name = "Torso", 
    CustomName = 'the car', 
    Color = Color3.fromRGB(0, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-247" then
ESP:AddObjectListener(Workspace.Entities["A-247"], { 
    Name = "Torso", 
    CustomName = 'the one who rebounds', 
    Color = Color3.fromRGB(182, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "X-220" then
ESP:AddObjectListener(Workspace.Entities["X-220"], { 
    Name = "Torso", 
    CustomName = 'lamborgini', 
    Color = Color3.fromRGB(182, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "X-247" then
ESP:AddObjectListener(Workspace.Entities["X-247"], { 
    Name = "Torso", 
    CustomName = 'ambush?', 
    Color = Color3.fromRGB(0, 140, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "billy" then
ESP:AddObjectListener(Workspace.Entities["billy"], { 
    Name = "Torso", 
    CustomName = 'Billy', 
    Color = Color3.fromRGB(183, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "purplebilly" then
ESP:AddObjectListener(Workspace.Entities["purplebilly"], { 
    Name = "Torso", 
    CustomName = 'Purple Billy', 
    Color = Color3.fromRGB(0, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "sadbilly" then
ESP:AddObjectListener(Workspace.Entities["sadbilly"], { 
    Name = "Torso", 
    CustomName = 'Sad Billy', 
    Color = Color3.fromRGB(212, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "bullybilly" then
ESP:AddObjectListener(Workspace.Entities["bullybilly"], { 
    Name = "Torso", 
    CustomName = 'Bully Billy', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "rainbowA200" then
ESP:AddObjectListener(Workspace.Entities["rainbowA200"], { 
    Name = "Torso", 
    CustomName = 'RainbowA-200', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "cursedA300" then
ESP:AddObjectListener(Workspace.Entities["cursedA300"], { 
    Name = "Torso", 
    CustomName = 'CursedA-300', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XXE-1" then
ESP:AddObjectListener(Workspace.Entities["XXE-1"], { 
    Name = "Torso", 
    CustomName = 'XXE-1', 
    Color = Color3.fromRGB(182, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-404 Anger" then
ESP:AddObjectListener(Workspace.Entities["A-404 Anger"], { 
    Name = "Torso", 
    CustomName = 'A-404 Anger', 
    Color = Color3.fromRGB(0, 75, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-404" then
ESP:AddObjectListener(Workspace.Entities["A-404"], { 
    Name = "Torso", 
    CustomName = 'A-404 Docile', 
    Color = Color3.fromRGB(0, 75, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "UNEVIL EROR" then
ESP:AddObjectListener(Workspace.Entities["UNEVIL EROR"], { 
    Name = "Torso", 
    CustomName = 'UNEVIL EROR', 
    Color = Color3.fromRGB(0, 75, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-1" then
ESP:AddObjectListener(Workspace.Entities["A-1"], { 
    Name = "Torso", 
    CustomName = 'A-1', 
    Color = Color3.fromRGBrgb(39, 4, 8), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "ay eight ee" then
ESP:AddObjectListener(Workspace.Entities["ay eight ee"], { 
    Name = "Torso", 
    CustomName = 'A-80?', 
    Color = Color3.fromRGB(0, 199, 27), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "ay two hundred and fifty eight" then
ESP:AddObjectListener(Workspace.Entities["ay two hundred and fifty eight"], { 
    Name = "Torso", 
    CustomName = 'A-258?', 
    Color = Color3.fromRGB(255, 174, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "X-100" then
ESP:AddObjectListener(Workspace.Entities["X-100"], { 
    Name = "Torso", 
    CustomName = 'X-100', 
    Color = Color3.fromRGB(0, 255, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XX-100" then
ESP:AddObjectListener(Workspace.Entities["XX-100"], { 
    Name = "Torso", 
    CustomName = 'XX-100', 
    Color = Color3.fromRGB(255, 255, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XX-200" then
ESP:AddObjectListener(Workspace.Entities["XX-200"], { 
    Name = "Torso", 
    CustomName = 'XX-200', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XXE-22" then
ESP:AddObjectListener(Workspace.Entities["XXE-22"], { 
    Name = "Torso", 
    CustomName = 'XXE-22', 
    Color = Color3.fromRGB(229, 249, 55), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XXV-5" then
ESP:AddObjectListener(Workspace.Entities["XXV-5"], { 
    Name = "Torso", 
    CustomName = 'XXV-5', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-260" then
ESP:AddObjectListener(Workspace.Entities["A-260"], { 
    Name = "Torso", 
    CustomName = 'A-260', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-400" then
ESP:AddObjectListener(Workspace.Entities["A-400"], { 
    Name = "Torso", 
    CustomName = 'A-400', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "awesome60" then
ESP:AddObjectListener(Workspace.Entities["awesome60"], { 
    Name = "Torso", 
    CustomName = 'Awesome-60', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "awesome200" then
ESP:AddObjectListener(Workspace.Entities["awesome200"], { 
    Name = "Torso", 
    CustomName = 'Awesome-200', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "BilleBobb" then
ESP:AddObjectListener(Workspace.Entities["BilleBobb"], { 
    Name = "Torso", 
    CustomName = 'Bille Bobb', 
    Color = Color3.fromRGB(183, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "BluehBobb" then
ESP:AddObjectListener(Workspace.Entities["BluehBobb"], { 
    Name = "Torso", 
    CustomName = 'Blueh Bobb', 
    Color = Color3.fromRGB(0, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "TabbleBobb" then
ESP:AddObjectListener(Workspace.Entities["TabbleBobb"], { 
    Name = "Torso", 
    CustomName = 'Tabble Bobb', 
    Color = Color3.fromRGB(212, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "scary-10" then
ESP:AddObjectListener(Workspace.Entities["scary-10"], { 
    Name = "Torso", 
    CustomName = 'Scary-15', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "scary-35" then
ESP:AddObjectListener(Workspace.Entities["scary-35"], { 
    Name = "Torso", 
    CustomName = 'Scary-35', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "scary-60" then
ESP:AddObjectListener(Workspace.Entities["scary-60"], { 
    Name = "Torso", 
    CustomName = 'Scary-60', 
    Color = Color3.fromRGB(100, 100, 100), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "scary-100" then
ESP:AddObjectListener(Workspace.Entities["scary-100"], { 
    Name = "Torso", 
    CustomName = 'Scary-100', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "scary-120" then
ESP:AddObjectListener(Workspace.Entities["scary-120"], { 
    Name = "Torso", 
    CustomName = 'Scary-120', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "scamy-120" then
ESP:AddObjectListener(Workspace.Entities["scamy-120"], { 
    Name = "Torso", 
    CustomName = 'ScaMy-120', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "scary-150" then
ESP:AddObjectListener(Workspace.Entities["scary-150"], { 
    Name = "Torso", 
    CustomName = 'Scary-150', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "scary-183" then
ESP:AddObjectListener(Workspace.Entities["scary-183"], { 
    Name = "Torso", 
    CustomName = 'Scary-183', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "scary-200" then
ESP:AddObjectListener(Workspace.Entities["scary-200"], { 
    Name = "Torso", 
    CustomName = 'Scary-200', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "scary-245" then
ESP:AddObjectListener(Workspace.Entities["scary-245"], { 
    Name = "Torso", 
    CustomName = 'Scary-245', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "scary-300" then
ESP:AddObjectListener(Workspace.Entities["scary-300"], { 
    Name = "Torso", 
    CustomName = 'Scary-300', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "scary-332" then
ESP:AddObjectListener(Workspace.Entities["scary-332"], { 
    Name = "Torso", 
    CustomName = 'Scary-332', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "scary-350" then
ESP:AddObjectListener(Workspace.Entities["scary-350"], { 
    Name = "Torso", 
    CustomName = 'Scary-350', 
    Color = Color3.fromRGB(100, 100, 100), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "scare-22" then
ESP:AddObjectListener(Workspace.Entities["scare-22"], { 
    Name = "Torso", 
    CustomName = 'ScarE-22', 
    Color = Color3.fromRGB(24, 134, 218), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "scare-42LEFT" then
ESP:AddObjectListener(Workspace.Entities["scare-42LEFT"], { 
    Name = "Torso", 
    CustomName = 'ScarE-42', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "scare-42RIGHT" then
ESP:AddObjectListener(Workspace.Entities["scare-42RIGHT"], { 
    Name = "Torso", 
    CustomName = 'ScarE-42', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "scare-42" then
ESP:AddObjectListener(Workspace.Entities["scare-42"], { 
    Name = "Torso", 
    CustomName = 'ScarE-42', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "scare-60" then
ESP:AddObjectListener(Workspace.Entities["scare-60"], { 
    Name = "Torso", 
    CustomName = 'ScarE-60', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "scare-142" then
ESP:AddObjectListener(Workspace.Entities["scare-142"], { 
    Name = "Torso", 
    CustomName = 'ScarE-142', 
    Color = Color3.fromRGB(252, 0, 194), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "scare-144" then
ESP:AddObjectListener(Workspace.Entities["scare-144"], { 
    Name = "Torso", 
    CustomName = 'ScarE-144', 
    Color = Color3.fromRGB(0, 255, 131), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "scare-200" then
ESP:AddObjectListener(Workspace.Entities["scare-200"], { 
    Name = "Torso", 
    CustomName = 'ScarE-200', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "scarv-5" then
ESP:AddObjectListener(Workspace.Entities["scarv-5"], { 
    Name = "Torso", 
    CustomName = 'ScarV-5', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "scarv-27" then
ESP:AddObjectListener(Workspace.Entities["scarv-27"], { 
    Name = "Torso", 
    CustomName = 'ScarV-27', 
    Color = Color3.fromRGB(100, 100, 100), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "scarv-35" then
ESP:AddObjectListener(Workspace.Entities["scarv-35"], { 
    Name = "Torso", 
    CustomName = 'ScarV-35', 
    Color = Color3.fromRGB(100, 100, 100), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "scarv-50" then
ESP:AddObjectListener(Workspace.Entities["scarv-50"], { 
    Name = "Torso", 
    CustomName = 'ScarV-50', 
    Color = Color3.fromRGB(187, 84, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end


for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "Noah" then
ESP:AddObjectListener(Workspace.Entities.["Noah"], { 
    Name = "Torso", 
    CustomName = 'Noah', 
    Color = Color3.fromRGB(255, 0, 64), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "John" then
ESP:AddObjectListener(Workspace.Entities.["John"], { 
    Name = "Torso", 
    CustomName = 'John', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "TROLLFACE" then
ESP:AddObjectListener(Workspace.Entities["TROLLFACE"], { 
    Name = "Torso", 
    CustomName = 'Trollface', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "G-GLITCH" then
ESP:AddObjectListener(Workspace.Entities["G-GLITCH"], { 
    Name = "Torso", 
    CustomName = 'G-GLITCH', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end
end)
end)
   end,
})


 local Section = Tab:CreateSection("Speed")
 
 
 local Keybind = Tab:CreateKeybind({
   Name = "Sprint",
   CurrentKeybind = "Q",
   HoldToInteract = false,
   Flag = "Keybind1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Keybind)
   game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 24
   end,
})




local Section = Tab:CreateSection("Miscellaneous")


 local Button = Tab:CreateButton({
    Name = "Silence Footsteps",
    Callback = function()
        game.Players.LocalPlayer.Character.Footsteps:Destroy()
    end,
 })
 

