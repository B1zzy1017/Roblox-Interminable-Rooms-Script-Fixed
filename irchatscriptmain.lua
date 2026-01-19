-- Client-side entity announcer (exploit)
-- Skips announcing certain object names (spam control)

local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")

local player = Players.LocalPlayer
local EntitiesFolder = workspace:WaitForChild("Entities")

-- Names to ignore
local IGNORE_NAMES = {
	["Noah"] = true,
	["John"] = true,
	["A-120 Minion"] = true,
	["A-150"] = true,
	["A-245"] = true,
	["A-278"] = true,
	["ULB-278"] = true,
	["TLAB-278"] = true,
	["A-300"] = true
}

local tracked = {}

-- Chat sender (new + legacy chat)
local function say(msg)
	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		local channel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
		if channel then
			channel:SendAsync(msg)
		end
	else
		player:Chat(msg)
	end
end

-- Initial scan
for _, entity in ipairs(EntitiesFolder:GetChildren()) do
	tracked[entity] = true
end

-- Spawn detection
EntitiesFolder.ChildAdded:Connect(function(entity)
	if tracked[entity] then return end
	tracked[entity] = true

	if IGNORE_NAMES[entity.Name] then return end
	say(entity.Name .. " spawned")
end)

-- Despawn detection
EntitiesFolder.ChildRemoved:Connect(function(entity)
	if not tracked[entity] then return end
	tracked[entity] = nil

	if IGNORE_NAMES[entity.Name] then return end
	say(entity.Name .. " despawned")
end)
