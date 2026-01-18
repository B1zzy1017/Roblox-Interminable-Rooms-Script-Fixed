local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/refs/heads/main/source.lua'))()

--Window
local Window = Rayfield:CreateWindow({
   Name = "Interminable Rooms",
   LoadingTitle = "An Interminable Rooms Script",
   LoadingSubtitle = "Remade by B1zzy1017",
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
   Content = "Successfully loaded! This script is uncomplete, so expect bugs.",
   Duration = 5,
   Image = 4483362458,
})



--Tabs 
local Tab = Window:CreateTab("Main", 4483362458)
local Tab4 = Window:CreateTab("5Green's Mods :)", 4483362458)
local Tab2 = Window:CreateTab("Entity Tips", 4483362458)
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
                   Content = "Has deleted.",
                   Duration = 5,
                   Image = 4483362458,
                })
            end)
        else
            connection:Disconnect()
        end
    end,
})


local Section = Tab4:CreateSection("Entity Notifier (Global Chat)")




--Toggles
local connection0 = nil  -- add a variable to keep track of the connection

local Toggle = Tab4:CreateToggle({
    Name = "Glolbally Announce Entity Spawning in Chat",
    CurrentValue = false,
    Flag = "Toggle3",
    Callback = function(Value)
        if Value and not connection0 then  -- if toggle is turned on and there is no connection
            connection0 = EntitiesFolder.ChildAdded:Connect(function(entity)
                if entity.Name ~= "TLUB-120" and entity.Name ~= "A-120 Minion" and entity.Name ~= "John" and entity.Name ~= "Noah" and entity.Name ~= "TLAB-278" and entity.Name ~= "ULB-278" and entity.Name ~= "A-245" and entity.Name ~= "A-258" and entity.Name ~= "JohnLocker" and entity.Name ~= "A-278" and entity.Name ~= "A-150" then
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(entity.Name .. " has spawned -_-", "All")
                end
            end)
        elseif not Value and connection0 then  -- if toggle is turned off and there is a connection
            connection0:Disconnect()  -- disconnect the connection
            connection0 = nil  -- set the connection to nil
        end
    end,
})


local connection1 = nil

local Toggle = Tab4:CreateToggle({
    Name = "Glolbally Announce Entity Despawning in Chat",
    CurrentValue = false,
    Flag = "Toggle4",
    Callback = function(Value)
        if Value and not connection1 then  -- if toggle is turned on and there is no connection
            connection1 = EntitiesFolder.ChildRemoved:Connect(function(entity)
                if entity.Name ~= "TLUB-120" and entity.Name ~= "A-120 Minion" and entity.Name ~= "John" and entity.Name ~= "Noah" and entity.Name ~= "TLAB-278" and entity.Name ~= "ULB-278" and entity.Name ~= "A-245" and entity.Name ~= "A-258" and entity.Name ~= "JohnLocker" and entity.Name ~= "A-278" and entity.Name ~= "A-150" then
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(entity.Name .. " has despawned :)", "All")
                end
            end)
        elseif not Value and connection1 then  -- if toggle is turned off and there is a connection
            connection1:Disconnect()  -- disconnect the connection
            connection1 = nil  -- set the connection to nil
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
    Name = "Instantly Heal Back to 100 HP",
    Callback = function()
            game.Players.LocalPlayer.Character.Humanoid.Health = 100
  		end,
	 })





local Section = Tab4:CreateSection("Ignore Entities")

local connection4
local Toggle = Tab4:CreateToggle({
    Name = "Godmode (NOT FINISHED)",
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
local Toggle = Tab4:CreateToggle({
    Name = "Disable Jumpscares",
    CurrentValue = false,
    Flag = "Toggle389",
    Callback = function(Value783)
        if Value783 then
            local Players = game:GetService("Players")
            local Player = Players.LocalPlayer
            local PlayerGui = Player.PlayerGui
            local Jumpscares = PlayerGui:FindFirstChild("Jumpscares")

            -- Disable each jumpscare individually by disabling the descendants
            if Jumpscares and Jumpscares:IsA("Folder") then
                for _, jumpscare in ipairs(Jumpscares:GetDescendants()) do
                    if jumpscare:IsA("ScreenGui") or jumpscare:IsA("Sound") then
                        jumpscare.Enabled = false
                    end
                end
            end

            -- Create a connection to re-enable the jumpscare elements if they're changed
            connection7 = PlayerGui.DescendantAdded:Connect(function(descendant)
                if descendant:IsA("ScreenGui") or descendant:IsA("Sound") then
                    descendant.Enabled = false
                end
            end)
        else
            if connection7 then
                connection7:Disconnect()
                connection7 = nil
            end
        end
    end,
})




local Paragraph = Tab4:CreateParagraph({Title = "Warning", Content = "\nFor some reason when you turn the button above on, it works, then when you turn it off, the code this toggles remains active, then from then on the on/off is reversed and idk why. Also I'm too lazt to fix it."})












local connection27
local Toggle = Tab4:CreateToggle({
    Name = "Disable Jumpscare Sounds",
    CurrentValue = false,
    Flag = "Toggle347",
    Callback = function(Value892)
        if Value892 then
            getgenv().disabled = true;
            getgenv().debug = true;
            
            local function DisableJumpscareSounds()
                local Player = game:GetService('Players').LocalPlayer;
                local JumpScare_Gui = Player.PlayerGui:FindFirstChild('Jumpscares');
                local Sounds = {};
            
                for i, v in next, JumpScare_Gui:GetDescendants() do
                    if v.Name == 'Jumpscare' then
                        table.insert(Sounds, v);
                    end
                end
            
                while getgenv().disabled do
                    for i, v in next, Sounds do
                        if getgenv().debug then
                            print('[Debug]: Fixing Sound');
                        end
            
                        v.MaxDistance = 0;
                        v.Playing = false;
                        v.Volume = 0;
                    end
            
                    task.wait(2.5);
                end
            end
            
            spawn(function()
                while getgenv().disabled do
                    DisableJumpscareSounds();
                end
            end)
        else
            getgenv().disabled = false;
        end
    end,
})




















local Section = Tab4:CreateSection("Walkspeed changer (higher values)")

local Slider = Tab4:CreateSlider({
   Name = "Walkspeed",
   Range = {1, 500},
   Increment = 0.1,
   Suffix = "Walkspeed",
   CurrentValue = 16,
   Flag = "Slider2",
   Callback = function(value12)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value12
   end,
})



local Slider = Tab4:CreateSlider({
   Name = "Jump Height",
   Range = {1, 500},
   Increment = 0.1,
   Suffix = "Jump height",
   CurrentValue = 7.2,
   Flag = "Slider3",
   Callback = function(Value13)
       game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').JumpHeight = Value13
   end,
})



local resetWalkspeedButton = Tab4:CreateButton({
    Name = "Reset Walkspeed",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end,
})


local resetJumpHeightButton = Tab4:CreateButton({
    Name = "Reset Jump Power",
    Callback = function()
        game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').JumpHeight = 7.2
    end,
})



local Paragraph = Tab4:CreateParagraph({Title = "Warning", Content = "\nSetting your jump height to over 500 sometimes makes you jump through the cieling."})





local Section = Tab4:CreateSection("Other Helpful Scipts")

local Button = Tab4:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end,
 })

local Button = Tab4:CreateButton({
	Name = "Other Interminable Rooms Script",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/ANDREY4IGSCRIPTS/ScriptsForRooms/main/INTERMINABLEROOMSSCRIPTV.0.1'))()
	end,
 })

local Button = Tab4:CreateButton({
	Name = "Dark Dex",
	Callback = function()
		loadstring(game:HttpGet('https://gist.githubusercontent.com/DinosaurXxX/b757fe011e7e600c0873f967fe427dc2/raw/ee5324771f017073fc30e640323ac2a9b3bfc550/dark%2520dex%2520v4'))()
	end,
})






local Section = Tab:CreateSection("ESP")


local Button = Tab:CreateButton({
   Name = "Entity ESP",
   Callback = function()
    EntitiesFolder.ChildAdded:Connect(function(entity) 
	pcall(function()
   -- loadstring
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/B1zzy1017/Roblox-Interminable-Rooms-Script-Fixed/refs/heads/main/kiriot22remake.lua"))()

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
 if v.Name == "3-60" then
ESP:AddObjectListener(Workspace.Entities["3-60"], { 
    Name = "Torso", 
    CustomName = '3-60', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
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
 if v.Name == "X-80" then
ESP:AddObjectListener(Workspace.Entities["X-80"], { 
    Name = "Torso", 
    CustomName = 'X-80', 
    Color = Color3.fromRGB(182, 0, 255), -- Color
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
 if v.Name == "X-120" then
ESP:AddObjectListener(Workspace.Entities["X-120"], { 
    Name = "Torso", 
    CustomName = 'X-120', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-120 Minion" then
ESP:AddObjectListener(Workspace.Entities["A-120 Minion"], { 
    Name = "Torso", 
    CustomName = 'M-120', 
    Color = Color3.fromRGB(251, 255, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "X-120 Minion" then
ESP:AddObjectListener(Workspace.Entities["X-120 Minion"], { 
    Name = "Torso", 
    CustomName = 'XM-120', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
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
 if v.Name == "X-150" then
ESP:AddObjectListener(Workspace.Entities["X-150"], { 
    Name = "Torso", 
    CustomName = 'X-150', 
    Color = Color3.fromRGB(0, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XX-150" then
ESP:AddObjectListener(Workspace.Entities["XX-150"], { 
    Name = "Torso", 
    CustomName = 'XX-150', 
    Color = Color3.fromRGB(255, 1, 255), -- Color
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
 if v.Name == "X-183" then
ESP:AddObjectListener(Workspace.Entities["X-183"], { 
    Name = "Torso", 
    CustomName = 'X-183', 
    Color = Color3.fromRGB(126, 125, 228), -- Color
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
 if v.Name == "X-258" then
ESP:AddObjectListener(Workspace.Entities["X-258"], { 
    Name = "Torso", 
    CustomName = 'X-258', 
    Color = Color3.fromRGB(255, 255, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XX-258" then
ESP:AddObjectListener(Workspace.Entities["XX-258"], { 
    Name = "Torso", 
    CustomName = 'XX-258', 
    Color = Color3.fromRGB(0, 255, 0), -- Color
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
 if v.Name == "X-278" then
ESP:AddObjectListener(Workspace.Entities["X-278"], { 
    Name = "Torso", 
    CustomName = 'X-278', 
    Color = Color3.fromRGB(183, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "bubugugup" then
ESP:AddObjectListener(Workspace.Entities["bubugugup"], { 
    Name = "Torso", 
    CustomName = 'bubugugup', 
    Color = Color3.fromRGB(0, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XTLAB-278" then
ESP:AddObjectListener(Workspace.Entities["XTLAB-278"], { 
    Name = "Torso", 
    CustomName = 'XTLAB-278', 
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
 if v.Name == "X-300" then
ESP:AddObjectListener(Workspace.Entities["X-300"], { 
    Name = "Torso", 
    CustomName = 'X-300', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XX-300" then
ESP:AddObjectListener(Workspace.Entities["XX-300"], { 
    Name = "Torso", 
    CustomName = 'XX-300', 
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
 if v.Name == "X-332" then
ESP:AddObjectListener(Workspace.Entities["X-332"], { 
    Name = "Torso", 
    CustomName = 'X-332', 
    Color = Color3.fromRGB(72, 79, 221), -- Color
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
 if v.Name == "X-350" then
ESP:AddObjectListener(Workspace.Entities["X-350"], { 
    Name = "Torso", 
    CustomName = 'X-350', 
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
 if v.Name == "PH-1" then
ESP:AddObjectListener(Workspace.Entities["PH-1"], { 
    Name = "Torso", 
    CustomName = 'PH-1', 
    Color = Color3.fromRGB(250, 246, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "DNC-1" then
ESP:AddObjectListener(Workspace.Entities["DNC-1"], { 
    Name = "Torso", 
    CustomName = 'DNC-1', 
    Color = Color3.fromRGB(254, 254, 254), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "JOLLY-1" then
ESP:AddObjectListener(Workspace.Entities["JOLLY-1"], { 
    Name = "Torso", 
    CustomName = 'JOLLY-1', 
    Color = Color3.fromRGB(204, 224, 20), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "E-15" then
ESP:AddObjectListener(Workspace.Entities["E-15"], { 
    Name = "Torso", 
    CustomName = 'E-15', 
    Color = Color3.fromRGB(251, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XE-15" then
ESP:AddObjectListener(Workspace.Entities["XE-15"], { 
    Name = "Torso", 
    CustomName = 'XE-15', 
    Color = Color3.fromRGB(255, 242, 0), -- Color
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
 if v.Name == "E-35" then
ESP:AddObjectListener(Workspace.Entities["E-35"], { 
    Name = "Torso", 
    CustomName = 'E-35', 
    Color = Color3.fromRGB(243, 243, 54), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XE-35" then
ESP:AddObjectListener(Workspace.Entities["XE-35"], { 
    Name = "Torso", 
    CustomName = 'XE-35', 
    Color = Color3.fromRGB(243, 6, 4), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XXE-35" then
ESP:AddObjectListener(Workspace.Entities["XXE-35"], { 
    Name = "Torso", 
    CustomName = 'XXE-35', 
    Color = Color3.fromRGB(2, 247, 247), -- Color
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
 if v.Name == "XE-42" then
ESP:AddObjectListener(Workspace.Entities["XE-42"], { 
    Name = "Torso", 
    CustomName = 'XE-42', 
    Color = Color3.fromRGB(255, 201, 219), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "rEtro-42" then
ESP:AddObjectListener(Workspace.Entities["rEtro-42"], { 
    Name = "Torso", 
    CustomName = 'rEtro-42', 
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
 if v.Name == "XE-60" then
ESP:AddObjectListener(Workspace.Entities["XE-60"], { 
    Name = "Torso", 
    CustomName = 'XE-60', 
    Color = Color3.fromRGB(255, 255, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "rEtro-60" then
ESP:AddObjectListener(Workspace.Entities["rEtro-60"], { 
    Name = "Torso", 
    CustomName = 'rEtro-60', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "E-69" then
ESP:AddObjectListener(Workspace.Entities["E-69"], { 
    Name = "Torso", 
    CustomName = 'E-69', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XE-69" then
ESP:AddObjectListener(Workspace.Entities["XE-69"], { 
    Name = "Torso", 
    CustomName = 'XE-69', 
    Color = Color3.fromRGB(255, 255, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "E-80" then
ESP:AddObjectListener(Workspace.Entities["E-80"], { 
    Name = "Torso", 
    CustomName = 'E-80', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XE-80" then
ESP:AddObjectListener(Workspace.Entities["XE-80"], { 
    Name = "Torso", 
    CustomName = 'XE-80', 
    Color = Color3.fromRGB(255, 255, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "E-95" then
ESP:AddObjectListener(Workspace.Entities["E-95"], { 
    Name = "Torso", 
    CustomName = 'E-95', 
    Color = Color3.fromRGB(19, 254, 254), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XE-95" then
ESP:AddObjectListener(Workspace.Entities["XE-95"], { 
    Name = "Torso", 
    CustomName = 'XE-95', 
    Color = Color3.fromRGB(255, 176, 42), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "E-100" then
ESP:AddObjectListener(Workspace.Entities["E-100"], { 
    Name = "Torso", 
    CustomName = 'E-100', 
    Color = Color3.fromRGB(243, 5, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XE-100" then
ESP:AddObjectListener(Workspace.Entities["XE-100"], { 
    Name = "Torso", 
    CustomName = 'XE-100', 
    Color = Color3.fromRGB(0, 255, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "E-120" then
ESP:AddObjectListener(Workspace.Entities["E-120"], { 
    Name = "Torso", 
    CustomName = 'E-120', 
    Color = Color3.fromRGB(255, 113, 155), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "ERM-120" then
ESP:AddObjectListener(Workspace.Entities["ERM-120"], { 
    Name = "Torso", 
    CustomName = 'ERM-120', 
    Color = Color3.fromRGB(255, 113, 155), -- Color
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
 if v.Name == "XE-142" then
ESP:AddObjectListener(Workspace.Entities["XE-142"], { 
    Name = "Torso", 
    CustomName = 'XE-142', 
    Color = Color3.fromRGB(0, 255, 131), -- Color
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
 if v.Name == "XE-144" then
ESP:AddObjectListener(Workspace.Entities["XE-144"], { 
    Name = "Torso", 
    CustomName = 'XE-144', 
    Color = Color3.fromRGB(252, 0, 194), -- Color
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
 if v.Name == "XE-200" then
ESP:AddObjectListener(Workspace.Entities["XE-200"], { 
    Name = "Torso", 
    CustomName = 'XE-200', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "E-230" then
ESP:AddObjectListener(Workspace.Entities["E-230"], { 
    Name = "Torso", 
    CustomName = 'E-230', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XE-230" then
ESP:AddObjectListener(Workspace.Entities["XE-230"], { 
    Name = "Torso", 
    CustomName = 'XE-230', 
    Color = Color3.fromRGB(255, 255, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XXE-230" then
ESP:AddObjectListener(Workspace.Entities["XXE-230"], { 
    Name = "Torso", 
    CustomName = 'XXE-230', 
    Color = Color3.fromRGB(0, 255, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "E-300" then
ESP:AddObjectListener(Workspace.Entities["E-300"], { 
    Name = "Torso", 
    CustomName = 'E-300', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XE-300" then
ESP:AddObjectListener(Workspace.Entities["XE-300"], { 
    Name = "Torso", 
    CustomName = 'XE-300', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XXE-300" then
ESP:AddObjectListener(Workspace.Entities["XXE-300"], { 
    Name = "Torso", 
    CustomName = 'XXE-300', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "E-333" then
ESP:AddObjectListener(Workspace.Entities["E-333"], { 
    Name = "Torso", 
    CustomName = 'E-333', 
    Color = Color3.fromRGB(36, 223, 253), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XE-333" then
ESP:AddObjectListener(Workspace.Entities["XE-333"], { 
    Name = "Torso", 
    CustomName = 'XE-333', 
    Color = Color3.fromRGB(213, 179, 145), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XXE-333" then
ESP:AddObjectListener(Workspace.Entities["XXE-333"], { 
    Name = "Torso", 
    CustomName = 'XXE-333', 
    Color = Color3.fromRGB(242, 249, 249), -- Color
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
 if v.Name == "V-15" then
ESP:AddObjectListener(Workspace.Entities["V-15"], { 
    Name = "Torso", 
    CustomName = 'V-15', 
    Color = Color3.fromRGB(204, 102, 204), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XV-15" then
ESP:AddObjectListener(Workspace.Entities["XV-15"], { 
    Name = "Torso", 
    CustomName = 'XV-15', 
    Color = Color3.fromRGB(255, 255, 0), -- Color
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
 if v.Name == "XV-27" then
ESP:AddObjectListener(Workspace.Entities["XV-27"], { 
    Name = "Torso", 
    CustomName = 'XV-27', 
    Color = Color3.fromRGB(99, 19, 18), -- Color
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
 if v.Name == "XV-35" then
ESP:AddObjectListener(Workspace.Entities["XV-35"], { 
    Name = "Torso", 
    CustomName = 'XV-35', 
    Color = Color3.fromRGB(11, 255, 158), -- Color
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
 if v.Name == "XV-50" then
ESP:AddObjectListener(Workspace.Entities["XV-50"], { 
    Name = "Torso", 
    CustomName = 'XV-50', 
    Color = Color3.fromRGB(187, 84, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "V-60" then
ESP:AddObjectListener(Workspace.Entities["V-60"], { 
    Name = "Torso", 
    CustomName = 'V-60', 
    Color = Color3.fromRGB(0, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XV-60" then
ESP:AddObjectListener(Workspace.Entities["XV-60"], { 
    Name = "Torso", 
    CustomName = 'XV-60', 
    Color = Color3.fromRGB(155, 252, 1), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "V-79" then
ESP:AddObjectListener(Workspace.Entities["V-79"], { 
    Name = "Torso", 
    CustomName = 'V-79', 
    Color = Color3.fromRGB(72, 10, 157), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XV-79" then
ESP:AddObjectListener(Workspace.Entities["XV-79"], { 
    Name = "Torso", 
    CustomName = 'XV-79', 
    Color = Color3.fromRGB(67, 214, 17), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "V-86" then
ESP:AddObjectListener(Workspace.Entities["V-86"], { 
    Name = "Torso", 
    CustomName = 'V-86', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-300-86" then
ESP:AddObjectListener(Workspace.Entities["A-300-86"], { 
    Name = "Torso", 
    CustomName = 'A-300-86', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XV-86" then
ESP:AddObjectListener(Workspace.Entities["XV-86"], { 
    Name = "Torso", 
    CustomName = 'XV-86', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "V-100" then
ESP:AddObjectListener(Workspace.Entities["V-100"], { 
    Name = "Torso", 
    CustomName = 'V-100', 
    Color = Color3.fromRGB(255, 0, 139), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "V-120" then
ESP:AddObjectListener(Workspace.Entities["V-120"], { 
    Name = "Torso", 
    CustomName = 'V-120', 
    Color = Color3.fromRGB(159, 19, 197), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "V-160" then
ESP:AddObjectListener(Workspace.Entities["V-160"], { 
    Name = "Torso", 
    CustomName = 'V-160', 
    Color = Color3.fromRGB(0, 255, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "V-183" then
ESP:AddObjectListener(Workspace.Entities["V-183"], { 
    Name = "Torso", 
    CustomName = 'V-183', 
    Color = Color3.fromRGB(0, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "V-200" then
ESP:AddObjectListener(Workspace.Entities["V-200"], { 
    Name = "Torso", 
    CustomName = 'V-200', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XV-200" then
ESP:AddObjectListener(Workspace.Entities["XV-200"], { 
    Name = "Torso", 
    CustomName = 'XV-200', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "V-256" then
ESP:AddObjectListener(Workspace.Entities["V-256"], { 
    Name = "Torso", 
    CustomName = 'V-256', 
    Color = Color3.fromRGB(244, 181, 250), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "V-256-A" then
ESP:AddObjectListener(Workspace.Entities["V-256-A"], { 
    Name = "Torso", 
    CustomName = 'V-256-A', 
    Color = Color3.fromRGB(244, 181, 250), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "V-319" then
ESP:AddObjectListener(Workspace.Entities["V-319"], { 
    Name = "Torso", 
    CustomName = 'V-319', 
    Color = Color3.fromRGB(91, 254, 254), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "V-345" then
ESP:AddObjectListener(Workspace.Entities["V-345"], { 
    Name = "Torso", 
    CustomName = 'V-345', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "VWM-345" then
ESP:AddObjectListener(Workspace.Entities["VWM-345"], { 
    Name = "Torso", 
    CustomName = 'VWM-345', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-221" then
ESP:AddObjectListener(Workspace.Entities["A-221"], { 
    Name = "Torso", 
    CustomName = 'A-221', 
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
    CustomName = 'A-246', 
    Color = Color3.fromRGB(182, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "X-221" then
ESP:AddObjectListener(Workspace.Entities["X-221"], { 
    Name = "Torso", 
    CustomName = 'X-221', 
    Color = Color3.fromRGB(182, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "X-246" then
ESP:AddObjectListener(Workspace.Entities["X-246"], { 
    Name = "Torso", 
    CustomName = 'X-246', 
    Color = Color3.fromRGB(0, 140, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-219" then
ESP:AddObjectListener(Workspace.Entities["A-219"], { 
    Name = "Torso", 
    CustomName = 'A-219', 
    Color = Color3.fromRGB(0, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-248" then
ESP:AddObjectListener(Workspace.Entities["A-248"], { 
    Name = "Torso", 
    CustomName = 'A-248', 
    Color = Color3.fromRGB(182, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "X-219" then
ESP:AddObjectListener(Workspace.Entities["X-219"], { 
    Name = "Torso", 
    CustomName = 'X-219', 
    Color = Color3.fromRGB(182, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "X-248" then
ESP:AddObjectListener(Workspace.Entities["X-248"], { 
    Name = "Torso", 
    CustomName = 'X-248', 
    Color = Color3.fromRGB(0, 140, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-130" then
ESP:AddObjectListener(Workspace.Entities["A-130"], { 
    Name = "Torso", 
    CustomName = 'A-130', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "X-130" then
ESP:AddObjectListener(Workspace.Entities["X-130"], { 
    Name = "Torso", 
    CustomName = 'X-130', 
    Color = Color3.fromRGB(255, 255, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "tinytimbstony" then
ESP:AddObjectListener(Workspace.Entities["tinytimbstony"], { 
    Name = "Torso", 
    CustomName = 'Tiny Timbs Tony', 
    Color = Color3.fromRGB(250, 246, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "BIGBOOTSBOWEN" then
ESP:AddObjectListener(Workspace.Entities["BIGBOOTSBOWEN"], { 
    Name = "Torso", 
    CustomName = 'BIG BOOTS BOWEN', 
    Color = Color3.fromRGB(250, 246, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "radioactiverunnersremington" then
ESP:AddObjectListener(Workspace.Entities["radioactiverunnersremington"], { 
    Name = "Torso", 
    CustomName = 'Radioactive Runners Remington', 
    Color = Color3.fromRGB(104, 252, 206), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "diggindockersdean" then
ESP:AddObjectListener(Workspace.Entities["diggindockersdean"], { 
    Name = "Torso", 
    CustomName = 'Diggin Dockers Dean', 
    Color = Color3.fromRGB(238, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "chasincleatscharles" then
ESP:AddObjectListener(Workspace.Entities["chasincleatscharles"], { 
    Name = "Torso", 
    CustomName = 'Chasin Cleats Charles', 
    Color = Color3.fromRGB(104, 252, 206), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "bombasticbootsbrooke" then
ESP:AddObjectListener(Workspace.Entities["bombasticbootsbrooke"], { 
    Name = "Torso", 
    CustomName = 'Bombastic Boots Brooke', 
    Color = Color3.fromRGB(99, 1, 1), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "BLUEBOOTSBOWEN" then
ESP:AddObjectListener(Workspace.Entities["BLUEBOOTSBOWEN"], { 
    Name = "Torso", 
    CustomName = 'BLUE BOOTS BOWEN', 
    Color = Color3.fromRGB(0, 0, 254), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "drillinderbiesdaniel" then
ESP:AddObjectListener(Workspace.Entities["drillinderbiesdaniel"], { 
    Name = "Torso", 
    CustomName = 'Drillin Derbies Daniel', 
    Color = Color3.fromRGB(180, 255, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "pickinpumaspaul" then
ESP:AddObjectListener(Workspace.Entities["pickinpumaspaul"], { 
    Name = "Torso", 
    CustomName = 'Pickin Pumas Paul', 
    Color = Color3.fromRGB(0, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "nuclearnikesnathan" then
ESP:AddObjectListener(Workspace.Entities["nuclearnikesnathan"], { 
    Name = "Torso", 
    CustomName = 'Nuclear Nikes Nathan', 
    Color = Color3.fromRGB(183, 254, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "retrorocketsrobert" then
ESP:AddObjectListener(Workspace.Entities["retrorocketsrobert"], { 
    Name = "Torso", 
    CustomName = 'Retro Rockets Robert', 
    Color = Color3.fromRGB(250, 246, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "A-244" then
ESP:AddObjectListener(Workspace.Entities["A-244"], { 
    Name = "Torso", 
    CustomName = 'A-244', 
    Color = Color3.fromRGB(79, 255, 155), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "X-244" then
ESP:AddObjectListener(Workspace.Entities["X-244"], { 
    Name = "Torso", 
    CustomName = 'X-244', 
    Color = Color3.fromRGB(79, 255, 155), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XX-244" then
ESP:AddObjectListener(Workspace.Entities["XX-244"], { 
    Name = "Torso", 
    CustomName = 'XX-244', 
    Color = Color3.fromRGB(79, 255, 155), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "BLUE-244" then
ESP:AddObjectListener(Workspace.Entities["BLUE-244"], { 
    Name = "Torso", 
    CustomName = 'BLUE-244', 
    Color = Color3.fromRGB(79, 255, 155), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XBLUE-244" then
ESP:AddObjectListener(Workspace.Entities["XBLUE-244"], { 
    Name = "Torso", 
    CustomName = 'XBLUE-244', 
    Color = Color3.fromRGB(79, 255, 155), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "TABLE-244" then
ESP:AddObjectListener(Workspace.Entities["TABLE-244"], { 
    Name = "Torso", 
    CustomName = 'TABLE-244', 
    Color = Color3.fromRGB(79, 255, 155), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "XTABLE-244" then
ESP:AddObjectListener(Workspace.Entities["XTABLE-244"], { 
    Name = "Torso", 
    CustomName = 'XTABLE-244', 
    Color = Color3.fromRGB(79, 255, 155), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "BKF-10" then
ESP:AddObjectListener(Workspace.Entities["BKF-10"], { 
    Name = "Torso", 
    CustomName = 'BKF-15', 
    Color = Color3.fromRGB(25, 226, 168), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "RVR-10" then
ESP:AddObjectListener(Workspace.Entities["RVR-10"], { 
    Name = "Torso", 
    CustomName = 'RVR-15', 
    Color = Color3.fromRGB(255, 200, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "EAT-10" then
ESP:AddObjectListener(Workspace.Entities["EAT-10"], { 
    Name = "Torso", 
    CustomName = 'EAT-15', 
    Color = Color3.fromRGB(253, 0, 146), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "ULB-10" then
ESP:AddObjectListener(Workspace.Entities["ULB-10"], { 
    Name = "Torso", 
    CustomName = 'ULB-15', 
    Color = Color3.fromRGB(0, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "TLAB-10" then
ESP:AddObjectListener(Workspace.Entities["TLAB-10"], { 
    Name = "Torso", 
    CustomName = 'TLAB-15', 
    Color = Color3.fromRGB(212, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "redscribble" then
ESP:AddObjectListener(Workspace.Entities["redscribble"], { 
    Name = "Torso", 
    CustomName = 'Red Scribble', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "horror15" then
ESP:AddObjectListener(Workspace.Entities["horror15"], { 
    Name = "Torso", 
    CustomName = 'Horror15', 
    Color = Color3.fromRGB(0, 21, 255), -- Color
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
    CustomName = 'A-50', 
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
    CustomName = 'A-220', 
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
    CustomName = 'A-247', 
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
    CustomName = 'X-220', 
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
    CustomName = 'X-247', 
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
 if v.Name == "Dog" then
ESP:AddObjectListener(Workspace.Entities["Dog"], { 
    Name = "Torso", 
    CustomName = 'Dog', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "MonsterE" then
ESP:AddObjectListener(Workspace.Entities["MonsterE"], { 
    Name = "Torso", 
    CustomName = 'MonsterE', 
    Color = Color3.fromRGB(100, 100, 100), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "scary retro" then
ESP:AddObjectListener(Workspace.Entities["scary retro"], { 
    Name = "Torso", 
    CustomName = 'Scary Retro', 
    Color = Color3.fromRGB(100, 100, 100), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "xcary retro" then
ESP:AddObjectListener(Workspace.Entities["xcary retro"], { 
    Name = "Torso", 
    CustomName = 'Xcary Retro', 
    Color = Color3.fromRGB(100, 100, 100), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "xxcary retro" then
ESP:AddObjectListener(Workspace.Entities["xxcary retro"], { 
    Name = "Torso", 
    CustomName = 'XXcary Retro', 
    Color = Color3.fromRGB(100, 100, 100), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "BLOODCONE-1" then
ESP:AddObjectListener(Workspace.Entities["BLOODCONE-1"], { 
    Name = "Torso", 
    CustomName = 'BLOODCONE-1', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "BLOODCONE-2" then
ESP:AddObjectListener(Workspace.Entities["BLOODCONE-2"], { 
    Name = "Torso", 
    CustomName = 'BLOODCONE-2', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "BLOODCONE-3" then
ESP:AddObjectListener(Workspace.Entities["BLOODCONE-3"], { 
    Name = "Torso", 
    CustomName = 'BLOODCONE-3', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "BLOODCONE-4" then
ESP:AddObjectListener(Workspace.Entities["BLOODCONE-4"], { 
    Name = "Torso", 
    CustomName = 'BLOODCONE-4', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "BLOODCONE-5" then
ESP:AddObjectListener(Workspace.Entities["BLOODCONE-5"], { 
    Name = "Torso", 
    CustomName = 'BLOODCONE-5', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "BLOODCONE-6" then
ESP:AddObjectListener(Workspace.Entities["BLOODCONE-6"], { 
    Name = "Torso", 
    CustomName = 'BLOODCONE-6', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "BLUECONE-1" then
ESP:AddObjectListener(Workspace.Entities["BLUECONE-1"], { 
    Name = "Torso", 
    CustomName = 'BLUECONE-1', 
    Color = Color3.fromRGB(0, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "BLUECONE-2" then
ESP:AddObjectListener(Workspace.Entities["BLUECONE-2"], { 
    Name = "Torso", 
    CustomName = 'BLUECONE-2', 
    Color = Color3.fromRGB(0, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "BLUECONE-3" then
ESP:AddObjectListener(Workspace.Entities["BLUECONE-3"], { 
    Name = "Torso", 
    CustomName = 'BLUECONE-3', 
    Color = Color3.fromRGB(0, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "BLUECONE-4" then
ESP:AddObjectListener(Workspace.Entities["BLUECONE-4"], { 
    Name = "Torso", 
    CustomName = 'BLUECONE-4', 
    Color = Color3.fromRGB(0, 0, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "BLOODCONE-120" then
ESP:AddObjectListener(Workspace.Entities["BLOODCONE-120"], { 
    Name = "Torso", 
    CustomName = 'BLOODCONE-120', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "TEETHCONE" then
ESP:AddObjectListener(Workspace.Entities["TEETHCONE"], { 
    Name = "Torso", 
    CustomName = 'TEETHCONE', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "TEETHMINI" then
ESP:AddObjectListener(Workspace.Entities["TEETHMINI"], { 
    Name = "Torso", 
    CustomName = 'TEETHMINI', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "EVIL-244" then
ESP:AddObjectListener(Workspace.Entities["EVIL-244"], { 
    Name = "Torso", 
    CustomName = 'EVIL-244', 
    Color = Color3.fromRGB(255, 0, 0), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "BLUEVIL-244" then
ESP:AddObjectListener(Workspace.Entities["BLUEVIL-244"], { 
    Name = "Torso", 
    CustomName = 'BLUEVIL-244', 
    Color = Color3.fromRGB(0, 0, 255), -- Color
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
    Color = Color3.fromRGB(252, 12, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "Bob" then
ESP:AddObjectListener(Workspace.Entities["Bob"], { 
    Name = "Torso", 
    CustomName = 'Bob', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "Xoah" then
ESP:AddObjectListener(Workspace.Entities["Xoah"], { 
    Name = "Torso", 
    CustomName = 'Xoah', 
    Color = Color3.fromRGB(106, 121, 35), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "John" then
ESP:AddObjectListener(Workspace.Entities["John"], { 
    Name = "Torso", 
    CustomName = 'John', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "JohnLocker" then
ESP:AddObjectListener(Workspace.Entities["JohnLocker"], { 
    Name = "Torso", 
    CustomName = 'John', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "Noah" then
ESP:AddObjectListener(Workspace.Entities.Noah, { 
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
ESP:AddObjectListener(Workspace.Entities.John, { 
    Name = "Torso", 
    CustomName = 'John', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "JohnLocker" then
ESP:AddObjectListener(Workspace.Entities.JohnLocker, { 
    Name = "Torso", 
    CustomName = 'Locker John', 
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


local Button = Tab:CreateButton({
   Name = "Entity ESP Fixer",
   Callback = function()
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
    CustomName = 'A-10', 
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
    CustomName = 'X-10', 
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
    CustomName = 'TLUB-120', 
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
    CustomName = 'ULB-258', 
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
 if v.Name == "E-60" then
ESP:AddObjectListener(Workspace.Entities["E-60"], { 
    Name = "Torso", 
    CustomName = 'E-60', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
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
 if v.Name == "Noah" then
ESP:AddObjectListener(Workspace.Entities.Noah, { 
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
ESP:AddObjectListener(Workspace.Entities.John, { 
    Name = "Torso", 
    CustomName = 'John', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end

for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
 if v.Name == "JohnLocker" then
ESP:AddObjectListener(Workspace.Entities.JohnLocker, { 
    Name = "Torso", 
    CustomName = 'Locker John', 
    Color = Color3.fromRGB(255, 255, 255), -- Color
    IsEnabled = "whatever" 
})
ESP.whatever = true
end
end
   end,
})


local Section = Tab:CreateSection("No-Drain Flashlights")


 local Button = Tab:CreateButton({
    Name = "Infinite Flashlight",
    Callback = function()
        game.Players.LocalPlayer.Character.FlashlightValues:Destroy()
        game.Players.LocalPlayer.Character.Battery.Value = math.huge
    end,
 })


 local Button = Tab:CreateButton({
    Name = "Infinite Gummy Flashlight (Requires Gamepass)",
    Callback = function()
        game.Players.LocalPlayer.Character.GummyFlashlightValue:Destroy()
        game.Players.LocalPlayer.Character.GummyBattery.Value = math.huge
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


local Slider = Tab:CreateSlider({
   Name = "Walkspeed",
   Range = {1, 100},
   Increment = 1,
   Suffix = "WalkSpeed",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   game.Players.LocalPlayer.character.Humanoid.WalkSpeed = Value
   end,
})


local Section = Tab:CreateSection("Miscellaneous")


 local Button = Tab:CreateButton({
    Name = "Silence Footsteps",
    Callback = function()
        game.Players.LocalPlayer.Character.Footsteps:Destroy()
    end,
 })
 
 
local Section = Tab2:CreateSection("A-Section")
local Section = Tab3:CreateSection("Credits")


--Paragraphs
local Paragraph = Tab2:CreateParagraph({Title = "A-10", Content = "It does not rebound. When you hear it, hide in anything."})
local Paragraph = Tab2:CreateParagraph({Title = "X-10", Content = "It is just like A-10 but faster."})
local Paragraph = Tab2:CreateParagraph({Title = "A-35", Content = "It rebounds 1.5 times. When you hear it, hide in anything."})
local Paragraph = Tab2:CreateParagraph({Title = "X-35", Content = "It rebounds 2 times. While it is faster than A-35, hide in anything."})
local Paragraph = Tab2:CreateParagraph({Title = "A-60", Content = "When it goes to your room, it stays for a moment then dissapears."})
local Paragraph = Tab2:CreateParagraph({Title = "X-60", Content = "A-60 but faster, same strategy."})
local Paragraph = Tab2:CreateParagraph({Title = "A-80", Content = "Don't get close to it or you will get damaged."})
local Paragraph = Tab2:CreateParagraph({Title = "A-100", Content = "It goes to the latest room and checks GRAY LOCKERS, then goes back."})
local Paragraph = Tab2:CreateParagraph({Title = "A-120", Content = "Simply hide. It rebounds a few times and spawns minions."})
local Paragraph = Tab2:CreateParagraph({Title = "A-150", Content = "It appears from a paper. It checks all lockers in latest room."})
local Paragraph = Tab2:CreateParagraph({Title = "A-183", Content = "Simply hide. It rebounds multiple times."})
local Paragraph = Tab2:CreateParagraph({Title = "A-200", Content = "It comes in front of you. Simply hide when you hear a loud whoosh."})
local Paragraph = Tab2:CreateParagraph({Title = "A-245", Content = "It breaks all the lockers in the current room."})
local Paragraph = Tab2:CreateParagraph({Title = "A-258", Content = "It appears in the current room and emits an earrape sound."})
local Paragraph = Tab2:CreateParagraph({Title = "A-278", Content = "It comes from a portal. Only hide in a gray locker or fridge."})
local Paragraph = Tab2:CreateParagraph({Title = "A-300", Content = "It spawns an entity. It's color changes to what entity it spawns."})
local Paragraph = Tab2:CreateParagraph({Title = "A-332", Content = "When you hear it or see the hide text, hide in anything until it's gone."})
local Paragraph = Tab2:CreateParagraph({Title = "A-350", Content = "Hide. It throws orbs at you."})
local Paragraph = Tab2:CreateParagraph({Title = "Noah", Content = "Do not hide when it appears."})
local Paragraph = Tab2:CreateParagraph({Title = "John", Content = "It is just a jumpscare."})
local Paragraph = Tab2:CreateParagraph({Title = "Mario", Content = "It is just John but rarer."})


local Section = Tab2:CreateSection("E-Section")


local Paragraph = Tab2:CreateParagraph({Title = "E-1", Content = "Don't open your flashlight. You can use a gummy flashlight."})
local Paragraph = Tab2:CreateParagraph({Title = "E-22", Content = "Hide when you think it is close to your location."})
local Paragraph = Tab2:CreateParagraph({Title = "E-42", Content = "Goes from the either sides of the room. DON'T get close to it."})
local Paragraph = Tab2:CreateParagraph({Title = "E-60", Content = "Hide when you think it is close to your location."})
local Paragraph = Tab2:CreateParagraph({Title = "E-142", Content = "It will go to your room. Hide immediately then wait for it."})
local Paragraph = Tab2:CreateParagraph({Title = "E-144", Content = "It appears in the current room. Hide immediately."})
local Paragraph = Tab2:CreateParagraph({Title = "E-200", Content = "It appears in the current room. It plays a beeping sound few times."})


local Section = Tab2:CreateSection("V-Section")


local Paragraph = Tab2:CreateParagraph({Title = "V-5", Content = "Just don't approach it. It deals very little damage."})
local Paragraph = Tab2:CreateParagraph({Title = "V-27", Content = "Hide when you think it is close to your location."})
local Paragraph = Tab2:CreateParagraph({Title = "V-35", Content = "Hide when you think it is close to your location."})
local Paragraph = Tab2:CreateParagraph({Title = "V-50", Content = "Hide when you think it is close to your location."})


local Section = Tab2:CreateSection("Others")


local Paragraph = Tab2:CreateParagraph({Title = "Locker John", Content = "It rarely appears in a locker. It renders that locker unusable."})
local Paragraph = Tab2:CreateParagraph({Title = "Trollface", Content = "It is so fast."})
local Paragraph = Tab2:CreateParagraph({Title = "G-GLITCH", Content = "Don't worry. Even though he is very fast, he is harmless."})




local Section = Tab5:CreateSection("A-Section")





local Paragraph = Tab5:CreateParagraph({Title = "A-10 (1)", Content = "\n• A-10 is a slow entity; you will have plenty of time to hide, even at room 10." ..
																  	  "\n• You can hide in any applicable space, such as tables, fridges, dark lockers, and blue lockers." ..
																  	  "\n• A-10 will spawn with a loud bang, and will shake your screen when it gets near."})
local Paragraph = Tab5:CreateParagraph({Title = "A-10 (2)", Content = "\n• You will know when it despawns because it's ambience will stop once it reachers the furthest unopened door."})

local Paragraph = Tab5:CreateParagraph({Title = "X-10", Content = "\n• Essentially the same as A-10." ..
																  "\n• X-10 has a chance to replace A-10" ..
																  "\n• X-10's ambience is just a higher pitched version of A-10's." ..
																  "\n• X-10 is slightly faster than A-10." ..
																  "\n• All other rules from A-10 apply to X-10 as well."})

local Paragraph = Tab5:CreateParagraph({Title = "A-35", Content = "\n• A-35 is slightly faster than X-10." ..
																  '\n• A-35 will spawn with a glitched "hissing" noise, and will shake your screen when it gets near.' ..
																  "\n• A-35 will go to the furthest unopened door, then rebound back to the first door, then despawn." ..
																  "\n• Just like with A-10, you can hide in any hiding space."})

local Paragraph = Tab5:CreateParagraph({Title = "X-35 (1)", Content = "\n• X-35 is roughly 2x faster than A-35." ..
																  	  "\n• X-35's ambience is reverbed and a higher pitched version of A-35's." ..
																  	  "\n• X-35's spawn sound is the same as A-35, so you won't know if it's X-35 until it gets close." ..
																  	  "\n• X-35 will go to the furthest unopened door, rebound back to the first door, THEN rebound back to the furthet unopened door again."})
local Paragraph = Tab5:CreateParagraph({Title = "X-35 (2)", Content = "\n• All other rules from A-35 apply to X-35 as well."})

local Paragraph = Tab5:CreateParagraph({Title = "A-60 (1)", Content = "\n• A-60 is a very fast entity that rushes to the furthest unopened door." ..
																	  "\n• A-60's spawn noise sounds like a short muffled staticky sound." ..
																	  "\n• A-60's ambience is quiet, so you will mainly have to rely on the screenshake to hide." ..
																	  "\n• Like the previous entities, you can hide in any hiding space to avoid it."})
local Paragraph = Tab5:CreateParagraph({Title = "A-60 (2)", Content = "\n• A-60 will spawn from door 1 and linger in the furthest room for roughly 3 seconds until it despawns."})

local Paragraph = Tab5:CreateParagraph({Title = "X-60 (1)", Content = "\n• X-60 is very similar to A-60." ..
																	  "\n• X-60's ambience track is the same as A-60's but the pitch is randomly raised and lowered ~3 times per second." ..
																	  "\n• X-60 has two faces that sort of gyrate back and fourth and have new decals."})
local Paragraph = Tab5:CreateParagraph({Title = "X-60 (2)", Content = "\n• X-60 still spawns from door 1 and lingers at the furthest room, but its despawning sequence includes it sinking into the floor." ..
																	  "\n• If you get out of your hiding space while it is still sinking into the floor, you will still die. Wait until its ambience stop playing to get out of your hiding spot."})

local Paragraph = Tab5:CreateParagraph({Title = "A-80", Content = "\n• A-80 recently got an update that I'm not so knowledgable about, but ig I'll try my best :P"})

local Paragraph = Tab5:CreateParagraph({Title = "A-80 (old) (1)", Content = '\n• A-80 will spawn roughly in the middle of the room and appear as black "bleeding" eyes.' ..
																			"\n• A-80 will spawn quite commonly after reaching door 80." ..
																			"\n• A-80 will not damage you until you get too close to it, where its eyes will open and it will jumpscare you, dealing roughly 1/3 of your max HP, and despawn."})
local Paragraph = Tab5:CreateParagraph({Title = "A-80 (old) (2)", Content = "\n• A-80's ambience kinda sounds like someone showering or smt." ..
																			"\n• A-80 will despawn with a crackling sound when you open the next door." ..
																			"\n• In certain conditions, A-80 isn't avoidable."})

local Paragraph = Tab5:CreateParagraph({Title = "A-80 (new) (1)", Content = "\n• As if A-80 wasn't already annoying and unavoidable enough, zvardinRB fuckin buffed his ass (╯‵□′)╯︵┻━┻" ..
																			"\n• Anyways, now A-80 has a different decal." ..
																			"\n• I believe its ambience is a bit different." ..
																			"\n• Also it will eventually move back to room 1, but it will despawn roughly 1,000m away from any players in the server."})
local Paragraph = Tab5:CreateParagraph({Title = "A-80 (new) (2)", Content = "\n• It will only damage you if you are hit in its trajectory back to room 1, dealing the same HP as the old version."})

local Paragraph = Tab5:CreateParagraph({Title = "A-100 (1)", Content = "\n• A-100 is an extremely fast entity who wont spawn from door 1, but rather 2000-3000m from the player." ..
																	   "\n• A-100 will rush into the furthest open room, check all dark lockers, then rush to door 1, then despawn."})
local Paragraph = Tab5:CreateParagraph({Title = "A-100 (2)", Content = "\n• A-100's spawn sound is a low pitched long beep, and its ambience is high-base, muffled earrape, with occasional low-pitched angelic moaning and humming." ..
																	   "\n• Because A-100 ony checks dark lockers, you can still hide in blue lockers and uinder tables. ***Fridges count as dark lockers (for some reason)!!!!"})

local Paragraph = Tab5:CreateParagraph({Title = "A-120 (1)", Content = "\n• A-120 is also a very fast entity who rushes from door 1 to roughly the doorframe of the furthest room (in the 'A' section)." ..
																 	   "\n• A-120 will violently shake your screen when it gets to you (assuming you're at the furthest room), it will linger there, and has a somewhat small chance to spawn minions, also known as M-120, or A-120 Minion."})
local Paragraph = Tab5:CreateParagraph({Title = "A-120 (2)", Content = "\n• You can hide in any space when needed, as A-120 doesnt check anything." ..
																	   "\n• If you're a new player, it's advised to just stay hidden until A-120 despawns, but you can load up new rooms and then hide as it comes back if you're more confident/skilled."})
local Paragraph = Tab5:CreateParagraph({Title = "A-120 (3)", Content = "\n• Sadly, A-120 doesn't have a spawn/despawn noise, so you have to rely on the screenshake and ambience." ..
																	   "\n• Speaking of which, A-120's ambience sounds like 'an electric amp sound akin to distorted morse code', according to the wiki." ..
																	   "\n• M-120s have the same ambience, but higher pitched, and they shoot exploding yellow balls that home to you, dealing a small bit of HP."})

local Paragraph = Tab5:CreateParagraph({Title = "A-150 (1)", Content = "\n• A-150 spawns roughly 2 seconds after its loading platform spawns somewhere in a new room." ..
																	   "\n• The 'spawning platform' is a small white 'piece of paper' with a smiley face on it." ..
																	   "\n• These spawn quite often, so be cautious once you reach door 150+."})
local Paragraph = Tab5:CreateParagraph({Title = "A-150 (2)", Content = "\n• A-150 checks all dark lockers in the room, so the best thing to do when you see the paper is to back out of the room you just loaded and wait for it to despawn."})
local Paragraph = Tab5:CreateParagraph({Title = "A-150 (3)", Content = "\n• A-150's spawning and despawning audio sounds like squidward taking a step, its ambience sounds like a slighly distorted, high-pitched, photocopier sound, and the paper's despawning sequence just includes it slowly fading away as it makes a low-pitched paper-crumpling sound."})

local Paragraph = Tab5:CreateParagraph({Title = "A-183 (1)", Content = "\n• A-183 will spawn with a loud bang, similar to A-10's." ..
																	   "\n• A-183 is one of the fastest entities and when spawning at door 1, it will rush at mock ∞ to the furthest door (in the 'A' section)." ..
																	   "\n• A-183 doesn't check any hiding spots; it rebounds back and fourth 6 times, lingering at room 1 each time, but not the furthest loaded room."})
local Paragraph = Tab5:CreateParagraph({Title = "A-183 (2)", Content = "\n• You can get out of your hiding place as A-183 rebounds back to room 1, but when it comes back and sees you out of your hiding place when it's roughly 500m or so away from you, it will scream and gain speed." ..
																	   "\n• After you make A-183 scream once, it won't do it again, rather it will keep rushing and kill you."})

local Paragraph = Tab5:CreateParagraph({Title = "A-200 (1)", Content = "\n• A-200 was stolen directly from 'Rooms', which is a large subsection from the original game, 'Rooms', by LSPLASH. (well not rly stolen, the owner of interminable rooms says he was inspired by rooms but whatever. Interminable Rooms' 'A-60' was as well so whetever.)" ..
																	   "\n• Anyways, A-200 will spawn roughly 5 rooms ahead of you (though the rooms arent loaded) and rush towards your location."})
local Paragraph = Tab5:CreateParagraph({Title = "A-200 (2)", Content = "\n• If you are hiding, A-200 will rush to door 1 at pretty fast speeds." ..
																	   "\n• If at any point you stop hiding before it despawns, it will change directions and charge to your location." ..
																	   "\n• If you hide again as it's rushing back to you, it will go back to rushing towards room 1 to despawn."})
local Paragraph = Tab5:CreateParagraph({Title = "A-200 (3)", Content = "\n• When A-200 spawns, it will make a weird bang sound, kinda like if you slammed a wood door shut." ..
																	   "\n• It's ambience sounds like cartoon wind, and its despawn sound just sounds like a loud whistling cartoon wind."})

local Paragraph = Tab5:CreateParagraph({Title = "A-245", Content = "\n• A-254 has no spawning sounds, but its ambience sounds like a really loud, low-pitched, buzzing light. Kind of like the backrooms level 0." ..
																   "\n• A-254 does no damage, so you don't need to hide, but it will break all dark lockers in the furthest loaded room. (including fridges)." ..
																   "\n• A-254 will despawn with 2 really bad guitar notes or smt."})

local Paragraph = Tab5:CreateParagraph({Title = "A-258", Content = "\n• A-258 spawns in the middle of a newly loaded room after room 258." ..
																   "\n• A-258 will just fuckin' be loud as shit so you can't hear other entities coming." ..
																   "\n• The best thing to do when it spawns is just hide until it despawns." ..
																   "\n• A-258's depsawning audio sounds like a loud structural moan, then metal clanking or smt."})

local Paragraph = Tab5:CreateParagraph({Title = "A-278", Content = "\n• A-278 is a pruple smiley face that will spawn from a portal and teleport around the furthest loaded room (in the 'A' section) and the room before that." ..
																   	   "\n• A-278 will summon two 'minions', ULB-278 & TLAB-278." ..
																	   "\n• ULB-278 checks blue lockers, and TLAB-278 checks tables." ..
																	   "\n• The only safe places to hide are fridges and dark lockers."})

local Paragraph = Tab5:CreateParagraph({Title = "A-300", Content = "\n• A-300 is a white frown with 3 eyes." ..
																   "\n• It spawns in the middle of the room and does no damage." ..
																   "\n• Eventually it will start screaming and can spawn A-10, A-35, A-60, A-80, A-100, A-200, A-245, A-258 or Noah" ..
																   "\n• After room 300, he spawns super often, and you just gotta deal with the random shit they despawn ig :/"})

local Paragraph = Tab5:CreateParagraph({Title = "A-332 (1)", Content = "\n• A-332's spawning sound is like a loud, high-pitched, vocal hissing sound. It's ambience sounds like a staticky hissing sound." ..
																  	   "\n• A-332's movement is closely related that of A-200's, as it will rebound back to you if you exit your hiding space." ..
																  	   "\n• A-332 spawns from door 1 and rushes far past the furthest loaded room."})
local Paragraph = Tab5:CreateParagraph({Title = "A-332 (2)", Content = "\n• once it is substantially far from any players, it will make an extremely loud hissing sound and despawn." ..
																	   "\n• A-332 emits particles that read 'HIDE', but they're not very useful because by the time you see them and you're not already hiding, you're basically dead."})

local Paragraph = Tab5:CreateParagraph({Title = "A-350", Content = "\n• A-350 has no spawning sound, but can be heard from far away, as its movement consist of traveling across roughly 2 rooms at once where it makes a weird bust of earrape." ..
																   "\n• A-350 will shoot bullets that change colors of red, blue, and green. It takes a while for it to get to room 350 because it spawns at room 1, but i still suggest hiding because the buillets are fast(ish)."})

local Paragraph = Tab5:CreateParagraph({Title = "John", Content = "\n(alr im gettin lazy so ill just give ya the basics)" ..
																  "\n• He does no damage, but he's like a more common hallway jack." ..
																  "\n• He can appear in lockers and sometimes be mario."})

local Paragraph = Tab5:CreateParagraph({Title = "Noah (1)", Content = "\n• Essentially, Noah's a bitch. Yeah. I big fat stupid bitch." ..
															                                    	  "\n• Wellllllllll... Noah's a bitch, he's a big fat bitch, he's the biggest bitch in the whole wide world." ..
														                                    		  " He's a stupid bitch if there ever was a bitch, he's a bitch to all the boys and girls! (Shut your fucking mouth 5Green!)..." ..
									                                    							  " On mondays he's a bitch, on tuesdays he's a bitch, on wednesdays to saturdays he's a bitch!"})
local Paragraph = Tab5:CreateParagraph({Title = "Noah (2)", Content = "\nThen on sunday, just to be different, he's a super king kameyameya beeyotch! (C'mon, you all know the words!)" ..
									                                  								  "(All) Have you ever met the entity Noah, he's the biggest bitch in the whole wide world! He's a mean old bitch and he has british teeth,"..
												                                  					  " he's a big, big, big, big, big, big bitch! Bitch, Bitch, Bitch, Bitch, Bitch, Bitch, Bitch, Bitch, he's a stupid bitch!!"})
local Paragraph = Tab5:CreateParagraph({Title = "Noah (3)", Content = "\nNoah's a bitch and he's such a dirty bitch! (Bitch!) Talk to players 'round the server, might go a li'l bit something like this:" ..
                                                                      "凱子的媽媽是個潑婦, 她是基佬秘術大師 我只想説, 摸了被她變潑婦, Noah est une pute c'est pour ça qu’on dit la plus grande pute du monde entier ze is een stom kutwijf, als er iemand een kutwijf was, " ..
                                                                      "Noah ni mbwa mkubwa mbwa mkubwa kuliko wote duniani hii! ..."})
local Paragraph = Tab5:CreateParagraph({Title = "Noah (4)", Content = "\nAlr jokes aside, he just goes around different rooms. If you are hiding and he is near, he will lowly damage you until you die."})


local Section = Tab5:CreateSection("E-Section (I get lazy here so I don't give much info.)")


local Paragraph = Tab5:CreateParagraph({Title = "E-1", Content = "\n• Does no dmg, but hurts you if you turn on a NORMAL flashlight and go near it."})

local Paragraph = Tab5:CreateParagraph({Title = "E-22", Content = "\n• The 'E' section version of A-10."})

local Paragraph = Tab5:CreateParagraph({Title = "E-42", Content = "\n• A pile of beans that floats across the room. You die if you touch it. That's it."})

local Paragraph = Tab5:CreateParagraph({Title = "E-60", Content = "\n• The 'E' section version of A-60."})

local Paragraph = Tab5:CreateParagraph({Title = "E-142", Content = "\n• Rushes from 'E' room 1 to the furthest loaded room." ..
                                                                   "\n• He's quiet so you'll have to rely on screen shake."})
                                                                   
local Paragraph = Tab5:CreateParagraph({Title = "E-144", Content = "\n• Spawns in the middle of the room." ..
                                                                   "\n• It will Rush to 'E' room 1 and make a loud moaning sound when it despawns." ..
                                                                   "\n• The ambience of E-144 consists of Base-boosted notes. E-144 will rush to 'E' room 1 on the 3rd note."})
                                                                   
local Paragraph = Tab5:CreateParagraph({Title = "E-200", Content = "\n• Spawns the same way as E-144." ..
                                                                   "\n• It rushes to 'E' room 1, then back to the furthest loaded 'E' room, then despawn."})



local Section = Tab5:CreateSection("V-Section")



local Paragraph = Tab5:CreateParagraph({Title = "V-5", Content = "\n• V-5 will jump at you, dealing small amounts of damage." ..
																 "\n• You can easily outrun it, but i still suggest hiding in a locker." ..
																 "\n• It will eventually have a seizure and despawn."})

local Paragraph = Tab5:CreateParagraph({Title = "V-27", Content = "\n• A-10 but literally a ÷."})

local Paragraph = Tab5:CreateParagraph({Title = "V-35", Content = "\n• Slowly rebounds from 'V' room 1 to the furthest loaded door twice, then despawns."})

local Paragraph = Tab5:CreateParagraph({Title = "V-50", Content = "\n• Kind of a faster version of A-350, but doesn't shoot projectiles."})



local Section = Tab5:CreateSection("Sidenotes")


local Paragraph = Tab5:CreateParagraph({Title = "Section Sizes", Content = "\nA-section: 400 rooms." ..
																		   "\nE-Section: 400 rooms." ..
																	       "\nV-Section: 5,000 rooms." ..
																		   "\nFuck the U-section. (Cuz idk anything about it)"})

local Paragraph = Tab5:CreateParagraph({Title = "V-Section", Content = "\nFor a section with 5,000 rooms, its kinda boring to avoid only 4 entities for roughly 12.5 hours."})

local Paragraph = Tab5:CreateParagraph({Title = "More Tips", Content = "\n• All entities are guarenteed to spawn at their respective door, and then randomly from then on after." ..
																	   "\n• (I'm pretty sure) X-10, X-35, and X-60 can't replace their normal versions the first time they spawn"})








local Paragraph = Tab3:CreateParagraph({Title = "Credits", Content = "\nScript made by Nenarus#3186.\n\nMod made by 5Green#1624."})


local Paragraph = Tab6:CreateParagraph({Title = "1.", Content = "Added Feature(s):\n\n- Remove Jumpscares\n\nDate Added: 5/22/23"})




















































